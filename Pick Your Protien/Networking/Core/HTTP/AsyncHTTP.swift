//
//  AsyncHTTP.swift
//  Pick Your Protien
//
//  Created by Vanessa Flores on 2/13/25.
//

import Foundation

public protocol AsyncHTTPClient {
    func perform(request: URLRequest) async -> Result<(Data, URLResponse), Error>
}
