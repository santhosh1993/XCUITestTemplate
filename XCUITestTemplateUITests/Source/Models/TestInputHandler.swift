//
//  TestInputHandler.swift
//  XCUITestTemplateUITests
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

/*
 Coading keys are the keys in the Json / any serialisation.
 */

struct StudentJsonModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case inputs = "data"
    }
    
    var inputs: [InputValues]
}

struct InputValues: Codable {
    
    enum CodingKeys: String, CodingKey {
        case userName = "userName"
        case passWord = "passWord"
    }
    
    var userName: String
    var passWord: String
}
