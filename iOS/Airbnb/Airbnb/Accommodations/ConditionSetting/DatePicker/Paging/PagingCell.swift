//
//  PagingCell.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class PagingCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = "PagingCell"
    var calendar: CalendarView!
    var calendarDataSource: CalendarDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        configureCalendarView()
        calendar
            .register(CalendarCell.self,
                          forCellWithReuseIdentifier: CalendarCell.identifier)
        calendarDataSource = CalendarDataSource()
        calendar.dataSource = calendarDataSource
        calendar.delegate = self
    }
    
    func configureCalendarView() {
        calendar = CalendarView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        addSubview(calendar)
        calendar.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension PagingCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calendar.calendarCellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
