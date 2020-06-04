//
//  ImageManager.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/04.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import Combine

struct ImageManager {
    
    
    func cache(imageData: Data, name: String) {
                guard let directory = try? FileManager.default.url(for: .cachesDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: false) as URL else { return }
        try? imageData.write(to: directory.appendingPathComponent(name))
    }
}
