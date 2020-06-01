//
//  DatePickerViewController.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import Combine

final class DatePickerViewController: ConditionSettingViewController {

    // MARK: - Properties
    private var datePickerView: DatePickerView!
    private var pagingDataSource: PagingDataSource?
    private var subscription: AnyCancellable?
    private let titleText: String = "체크인 - 체크아웃"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Methods
    private func configure() {
        configureDatePickerView()
        configureInterfaceView()
        configureSubscription()
    }
    
    func configureDatePickerView() {
        datePickerView = DatePickerView()
        datePickerView.pagingView.register(PagingCell.self,
                      forCellWithReuseIdentifier: PagingCell.identifier)
        pagingDataSource = PagingDataSource()
        datePickerView.pagingView.dataSource = pagingDataSource
        datePickerView.pagingView.delegate = self
    }
    
    func configureInterfaceView() {
        interfaceView.addConditionView(datePickerView)
        interfaceView.titleLabel.text = titleText
        interfaceView.resetButton
            .addTarget(self,
                       action: #selector(resetButtonTapped(_:)),
                       for: .touchUpInside)
    }
    
    func configureSubscription() {
        subscription = Publishers
            .CombineLatest(DatePicker.shared.$startDate,
                           DatePicker.shared.$endDate)
            .sink { self.applyTitleLabel(start: $0.0, end: $0.1) }
    }
    
    func applyTitleLabel(start: Date?, end: Date?) {
        guard let start = start else {
            interfaceView.titleLabel.text = titleText
            return
        }
        interfaceView.titleLabel.text = "\(DateCalculator.formattingDate(start))"
        guard let end = end else { return }
        interfaceView.titleLabel.text = "\(DateCalculator.formattingDate(start)) - \(DateCalculator.formattingDate(end))"
    }
    
    // MARK: Objc
    @objc private func resetButtonTapped(_ sender: UIButton) {
        DatePicker.shared.reset()
    }
}

extension DatePickerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return datePickerView.pagingViewSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
