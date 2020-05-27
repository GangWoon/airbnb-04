//
//  DatePickerView.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/26.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import SnapKit

final class DatePickerView: UIView {
    
    // MARK: - IBOutlets
    private var weekDayView: WeekDayView!
    var pagingView: PagingView!
    var pagingViewSize: CGSize {
        pagingView.frame.size
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Methods
    private func configure() {
        configureWeekDayView()
        configurePagingView()
    }
    
    private func configureWeekDayView() {
        weekDayView = WeekDayView()
        addSubview(weekDayView)
        weekDayView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
    private func configurePagingView() {
        pagingView = PagingView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        addSubview(pagingView)
        pagingView.snp.makeConstraints { make in
            make.top.equalTo(weekDayView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}

