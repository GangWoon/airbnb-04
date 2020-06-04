//
//  String.swift
//  Airbnb
//
//  Created by Cloud on 2020/06/04.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

extension String {
    func filterRegex(_ regex: String) -> Self {
        guard let regex = try? NSRegularExpression(pattern: regex),
            let result = regex.firstMatch(in: self, options: .anchored,
                                          range: NSRange(self.startIndex..., in: self)) else { return "" }
        
        return self.replacingOccurrences(of: self[Range(result.range, in: self)!],
                                         with: "")
    }
}
