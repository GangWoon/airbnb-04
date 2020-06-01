//
//  DatePickerViewController.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class DatePickerViewController: ConditionSettingViewController {

    // MARK: - Properties
    private var datePickerView: DatePickerView!
    private var pagingDataSource: PagingDataSource?
    
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
