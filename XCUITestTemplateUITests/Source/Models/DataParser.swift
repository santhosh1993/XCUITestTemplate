//
//  DataParser.swift
//  XCUITestTemplateUITests
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

class DataParser {
    
    class func getDataFromJsonAndParse<T: Codable>(_ fileName: String, ofType type: String) -> T? {
        
        let bundle = Bundle(for: DataParser.self)
        let pathOfJsonFile = bundle.path(forResource: fileName, ofType: type)
        
        guard let unWrappedPath = pathOfJsonFile else { return nil}
        
        let urlOfPath = URL(fileURLWithPath: unWrappedPath)
        guard let unWrappedData = try? Data(contentsOf: urlOfPath) else { return nil }
        var testJsonObject: T
        do {
            let decoder = JSONDecoder()
            let dataTobeTested = type == "plist" ? try DataParser.parseProperyListWithData(unWrappedData) : unWrappedData
            testJsonObject =  try decoder.decode(T.self, from: dataTobeTested)
        }
        catch {
            return nil
        }
        return testJsonObject
    }
    
    static func parseProperyListWithData(_ data: Data) throws -> Data {
        
        let hello = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
        let jsonData = try JSONSerialization.data(withJSONObject: hello, options: .prettyPrinted)
        return jsonData
    }
}
