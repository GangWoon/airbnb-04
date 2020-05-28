//
//  DatePickerView.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/26.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

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
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        makeConstraints()
    }
    
    // MARK: - Methods
    // MARK: Configure
    private func configure() {
        configureWeekDayView()
        configurePagingView()
    }
    
    private func configureWeekDayView() {
        weekDayView = WeekDayView()
        addSubview(weekDayView)
    }
    
    private func configurePagingView() {
        pagingView = PagingView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        addSubview(pagingView)
    }
    
    //MARK: Constarints
    private func makeConstraints() {
        makeConstraintsWeekDayView()
        makeConstraintsPagingView()
    }
    
    private func makeConstraintsWeekDayView() {
        weekDayView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
    }
    
    private func makeConstraintsPagingView() {
        pagingView.snp.makeConstraints { make in
            make.top.equalTo(weekDayView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}

