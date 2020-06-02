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
    
    func updateAdult(isPlus: Bool) {
        adult += isPlus ? 1 : -1
    }
    
    func updateYouth(isPlus: Bool) {
        youth += isPlus ? 1 : -1
    }
    
    func updateInfant(isPlus: Bool) {
        infant += isPlus ? 1 : -1
    }
}
