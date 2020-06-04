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
        let numberOfRowsInSection = [0, accomodations.count]
        
        return numberOfRowsInSection[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: AccommodationsCell.identifier,
                                 for: indexPath) as? AccommodationsCell else { return UITableViewCell() }
        let item = accomodations[indexPath.row]
        let viewModel = AccommodationsCellViewModel(accommodations: item)
        item.images.forEach { url in
            let name = url.filterRegex(.imageName)
                .replacingOccurrences(of: "?aki_policy=large",
                                      with: "")
            guard let image = ImageManager.load(from: name) else { return }
            viewModel.images.append(image)
        }
        DispatchQueue.main.async {
            cell.apply(with: viewModel)
        }
        
        return cell
    }
}


