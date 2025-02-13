//
//  URLSession+Custom.swift
//  Pick Your Protien
//
//  Created by Vanessa Flores on 2/13/25.
//

import Foundation

extension URLSession: AsyncHTTPClient {
    
    public func perform(request: URLRequest) async -> Result<(Data, URLResponse), Error> {
        do {
            let (data, response) = try await data(for: request)
            return .success((data, response))
        } catch {
            return .failure(error)
        }
    }
}
