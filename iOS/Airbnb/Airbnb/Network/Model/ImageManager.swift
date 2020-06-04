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
    
    static func cache(imageData: Data, name: String) {
                guard let directory = try? FileManager.default.url(for: .cachesDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: false) as URL else { return }
        try? imageData.write(to: directory.appendingPathComponent(name))
    }
    
    static func load(from imageName: String) -> UIImage? {
        guard let directory = try? FileManager.default.url(for: .cachesDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: false) else { return .none }
        let path = URL(fileURLWithPath: directory.absoluteString).appendingPathComponent(imageName).path
        let image = UIImage(contentsOfFile: path)
        
        return image
    }
}
