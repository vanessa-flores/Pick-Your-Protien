//
//  DefaultMapper.swift
//  Pick Your Protien
//
//  Created by Vanessa Flores on 2/13/25.
//

import Foundation
import OSLog

public struct DefaultMapper<T> {
    public static func map(data: Data, response: HTTPURLResponse) throws -> T where T: Decodable {
        guard 200...299 ~= response.statusCode else {
            switch response.statusCode {
            case 401, 402:
                throw ResourceError.unauthorized
            default:
                let responseText = String(data: data, encoding: .utf8)
                throw ResourceError.invalidResponse(statusCode: response.statusCode, responseText: responseText ?? "")
            }
        }
        
        if let model = T.decode(with: data) {
            return model
        } else {
            let desearializedJSON = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            if let uparsableJSON = desearializedJSON as? [String: AnyHashable] {
                throw ResourceError.couldNotParse(json: uparsableJSON)
            } else {
                throw ResourceError.invalidJson(response.statusCode)
            }
            
        }
    }
}

public enum ResourceError: Error {
    case unauthorized
    case invalidResponse(statusCode: Int, responseText: String)
    case noData
    case couldNotParse(json: [String: AnyHashable])
    case invalidJson(Int)
    case other(Error?)
    case missingApiKey
}

extension Decodable {
    public static func decode(with data: Data) -> Self? {
        do {
            let decodedJSON = try ISO8601JSONDecoder().decode(Self.self, from: data)
            return decodedJSON
        } catch let DecodingError.keyNotFound(key, _) {
            return nil
        } catch let DecodingError.dataCorrupted(context) {
            return nil
        } catch {
            Log.debug("Could not decode JSON data: \(error)")
            return nil
        }
    }
}

let Log = Logger.init()
