//
//  CalendarCell.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class CalendarCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier: String = "CalendarCell"
    private let selectedColor: UIColor = UIColor.lightGray.withAlphaComponent(0.1)
    private var leftBackgroundView: UIView!
    private var rightBackgroundView: UIView!
    private var date: Date?
    var dayButton: UIButton!
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dayButton.setTitle("",
                           for: .normal)
        dayButton.isEnabled = false
        toggle(state: false)
        leftBackgroundView.backgroundColor = .systemBackground
        rightBackgroundView.backgroundColor = .systemBackground
    }
    
    // MARK: - Methods
    func apply(date: Date) {
        self.date = date
        let color = WeekDays(rawValue: DateCalculator.weekday(of: date))?.color()
        let day = DateCalculator.day(of: date)
        dayButton.setTitleColor(color,
                                for: .normal)
        dayButton.setTitle(day,
                           for: .normal)
    }
    
    func toggle(state: Bool) {
        dayButton.setTitleColor(state ? .white : .black,
                           for: .normal)
        contentView.layer.cornerRadius = state ? contentView.frame.height / 2 : 0
        contentView.backgroundColor = state ? .black : .clear
    }
    
    func applyBackgroundColor(isStart: Bool = false, isEnd: Bool = false) {
        rightBackgroundView.backgroundColor = isStart ? selectedColor : .clear
        leftBackgroundView.backgroundColor = isEnd ? selectedColor : .clear
    }
    
    // MARK: Configure
    private func configure() {
        backgroundColor = .systemBackground
        contentView.backgroundColor = .clear
        configureDayButton()
        configureLeftBackgroundView()
        configureRightBackgroundView()
    }
    
    private func configureDayButton() {
        dayButton = UIButton()
        dayButton.setTitleColor(.black,
                                for: .normal)
        dayButton.titleLabel?.textAlignment = .center
        dayButton.titleLabel?.font = .boldSystemFont(ofSize: 11)
        dayButton.addTarget(self,
                       action: #selector(dayButtonTapped(_:)),
                       for: .touchUpInside)
        addSubview(dayButton)
    }
    
    private func configureLeftBackgroundView() {
        leftBackgroundView = UIView()
        insertSubview(leftBackgroundView,
                      at: 0)
    }
    
    private func configureRightBackgroundView() {
        rightBackgroundView = UIView()
        insertSubview(rightBackgroundView,
                      at: 0)
        
        rightBackgroundView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(frame.width / 2)
        }
    }
    
    // MARK: Constraints
    private func makeConstraints() {
        makeConstraintsDayButton()
        makeConstraintsLeftBackgroundView()
        makeConstraintsRightBackgroundView()
    }
    
    private func makeConstraintsDayButton() {
        dayButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func makeConstraintsLeftBackgroundView() {
        leftBackgroundView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(frame.width / 2)
        }
    }
    
    private func makeConstraintsRightBackgroundView() {
        rightBackgroundView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview()
            make.width.equalTo(frame.width / 2)
        }
    }
    
    // MARK: Objc
    @objc func dayButtonTapped(_ sender: UIButton) {
        DatePicker.shared.select(date: date)
    }
}
