//
//  BasePage.swift
//  XCUITestTemplateUITests
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

import Foundation
import XCTest

class BasePage {
    let app:XCUIApplication
    
    init(app:XCUIApplication) {
        self.app = app
    }
    
    func clearText() {
        let deleteKey = app.keys["delete"]
        if deleteKey.exists {
            deleteKey.press(forDuration: 4.0)
        }
    }
    
    func waitForElementToAppear(_ element: XCUIElement){
       element.waitForExistence(timeout: Config.timeOut)
    }
}
