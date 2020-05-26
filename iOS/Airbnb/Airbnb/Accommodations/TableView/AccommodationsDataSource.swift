//
//  AccommodationsDataSource.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/21.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class AccommodationsDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    private let sections: Int = 2
    @Published var accomodations: [Accommodations] = .init()
    
    // MARK: - Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = [0: 0,
                                     1: accomodations.count]
        
        return numberOfRowsInSection[section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: AccommodationsCell.identifier,
                                 for: indexPath) as? AccommodationsCell else { return UITableViewCell() }
        let item = accomodations[indexPath.row]
        cell.update(with: AccommodationsCellViewModel(accommodations: item))
        
        return cell
    }
}


