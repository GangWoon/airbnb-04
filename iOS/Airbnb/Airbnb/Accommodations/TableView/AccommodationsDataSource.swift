//
//  AccommodationsDataSource.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/21.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class AccommodationsDataSource: NSObject, UITableViewDataSource {
    
    private let sections: Int = 2
    
    // MARK: - Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = [0: 0,
                                     1: 100]
        return numberOfRowsInSection[section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: AccommodationsCell.identifier,
                                 for: indexPath) as? AccommodationsCell else { return UITableViewCell() }
        
        return cell
    }
}


