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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Methods
    private func configure() {
        datePickerView = DatePickerView()
        interfaceView.addConditionView(datePickerView)
        datePickerView.pagingView.register(PagingCell.self,
                      forCellWithReuseIdentifier: PagingCell.identifier)
        pagingDataSource = PagingDataSource()
        datePickerView.pagingView.dataSource = pagingDataSource
        datePickerView.pagingView.delegate = self
        interfaceView.titleLabel.text = "체크인 - 체크아웃"
        
        subscription = Publishers
            .CombineLatest(DatePicker.shared.$startDate,
                           DatePicker.shared.$endDate)
            .sink { start, end in
                let formatter = DateFormatter()
                formatter.dateFormat = "MM월 dd일"
                
                guard let start = start else { return }
                self.interfaceView.titleLabel.text = "\(formatter.string(from: start))"
                guard let end = end else { return }
                self.interfaceView.titleLabel.text = "\(formatter.string(from: start)) - \(formatter.string(from: end))"
        }
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
