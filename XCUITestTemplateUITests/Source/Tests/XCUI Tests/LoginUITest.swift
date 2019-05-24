//
//  LoginUITest.swift
//  XCUITestTemplateUITests
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import XCTest

class LoginUITest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func Login() {
        
        let workFlow:LoginWorkFlow = LoginWorkFlow(XCUIApplication())
        
        if let studentModel: StudentJsonModel = DataParser.getDataFromJsonAndParse("CustomData", ofType: "json") {
            
            for input in studentModel.inputs {
                workFlow.userLogin(email: input.userName, password: input.passWord)
                XCTAssert(false == workFlow.isAlertExists(), "Validation Failed...")
            }
            
        }
    }
    
}
