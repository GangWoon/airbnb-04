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
    private var subscriptions: Set<AnyCancellable> = .init()
    private let titleText: String = "체크인 - 체크아웃"
    private let datePicker: DatePicker = .init()
    
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
    
    private func configureDatePickerView() {
        datePickerView = DatePickerView()
        datePickerView.pagingView.register(PagingCell.self,
                      forCellWithReuseIdentifier: PagingCell.identifier)
        pagingDataSource = PagingDataSource(datePicker: datePicker)
        datePickerView.pagingView.dataSource = pagingDataSource
        datePickerView.pagingView.delegate = self
    }
    
    private func configureInterfaceView() {
        interfaceView.addConditionView(datePickerView)
        interfaceView.titleLabel.text = titleText
        interfaceView.resetButton
            .addTarget(self,
                       action: #selector(resetButtonTapped(_:)),
                       for: .touchUpInside)
    }
    
    private func configureSubscription() {
        Publishers
            .CombineLatest(datePicker.$startDate,
                           datePicker.$endDate)
            .sink {
                self.applyTitleLabel(start: $0.0, end: $0.1)
                self.datePickerView.pagingView.reloadData()
        }.store(in: &subscriptions)
        
        NotificationCenter.default.publisher(for: .dateSelect)
            .sink { notification in
                guard let selectedDate = notification.object as? Date else { return }
                self.datePicker.select(date: selectedDate)
        }.store(in: &subscriptions)
    }
    
    private func applyTitleLabel(start: Date?, end: Date?) {
        guard let start = start else {
            interfaceView.titleLabel.text = titleText
            return
        }
        interfaceView.titleLabel.text = start.description
        guard let end = end else { return }
        interfaceView.titleLabel.text = start.description + " - " + end.description
    }
    
    // MARK: Constraints
    override func makeConstraintsInterfaceView() {
        super.makeConstraintsInterfaceView()
        interfaceView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(399)
        }
    }
    
    // MARK: Objc
    @objc private func resetButtonTapped(_ sender: UIButton) {
        datePicker.reset()
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
