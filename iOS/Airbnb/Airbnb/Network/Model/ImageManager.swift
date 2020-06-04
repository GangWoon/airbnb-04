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
    
    static func cache(imageData: Data, urlString: String) {
                guard let directory = try? FileManager.default.url(for: .cachesDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: false) as URL else { return }
        let name = getFileName(from: urlString)
        try? imageData.write(to: directory.appendingPathComponent(name))
    }
    
    static func load(from urlString: String) -> UIImage? {
        guard let directory = try? FileManager.default.url(for: .cachesDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: false) else { return .none }
        let name = getFileName(from: urlString)
        let path = URL(fileURLWithPath: directory.absoluteString).appendingPathComponent(name).path
        let image = UIImage(contentsOfFile: path)
        
        return image
    }
    
    static func fileExist(fileName: String) -> Bool {
        guard let directory = try? FileManager.default.url(for: .cachesDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: false) else { return false }
        let path = URL(fileURLWithPath: directory.absoluteString).appendingPathComponent(fileName).path
        return FileManager.default.fileExists(atPath: path)
    }
    
    static func getFileName(from urlString: String) -> String {
        return urlString.filterRegex(.imageName).replacingOccurrences(of: "?aki_policy=large",
                                                               with: "")
        
    }
}
