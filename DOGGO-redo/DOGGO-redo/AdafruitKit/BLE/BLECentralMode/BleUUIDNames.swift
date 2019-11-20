//
//  BleUUIDNames.swift
//  DOGGO-redo
//
//  Created by Alam Figueroa Aguilar on 11/19/19.
//  Copyright © 2019 Michelle Natasha. All rights reserved.
//

import Foundation
class BleUUIDNames {
    // Manager
    static let shared = BleUUIDNames()

    // Data
    fileprivate var gattUUIds: [String:String]?

    init() {
        // Read known UUIDs
        let path = Bundle.main.path(forResource: "GattUUIDs", ofType: "plist")!
        gattUUIds = NSDictionary(contentsOfFile: path) as? [String: String]
    }

    func nameForUUID(_ uuidString: String) -> String? {
        return gattUUIds?[uuidString]
    }
}
