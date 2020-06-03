//
//  PersonnelSelector.swift
//  Airbnb
//
//  Created by TTOzzi on 2020/06/02.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation
import Combine

final class PersonnelSelector {
    
    @Published var adult: Int = .zero
    @Published var youth: Int = .zero
    @Published var infant: Int = .zero
    
    func update(category: AgeGroup, isPlus: Bool) {
        switch category {
        case .adult:
            adult += isPlus ? 1 : -1
        case .youth:
            youth += isPlus ? 1 : -1
        case .infant:
            infant += isPlus ? 1 : -1
        }
    }
    
    func reset() {
        adult = .zero
        youth = .zero
        infant = .zero
    }
}
