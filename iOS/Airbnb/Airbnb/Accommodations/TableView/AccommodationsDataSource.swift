//
//  AccommodationsDataSource.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/21.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class AccommodationsDataSource: NSObject, UITableViewDataSource {

    // MARK: - Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: AccommodationsCell.identifier,
                                 for: indexPath) as? AccommodationsCell else { return UITableViewCell() }
        
        return cell
    }
}


