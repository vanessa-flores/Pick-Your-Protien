//
//  JSONDecoder+Custom.swift
//  Pick Your Protien
//
//  Created by Vanessa Flores on 2/13/25.
//

import Foundation

public class ISO8601JSONDecoder: JSONDecoder {
    public override init() {
        super.init()
        self.dateDecodingStrategy = .iso8601
    }
}
