//
//  LoginStepDefenation.swift
//  XCUITestTemplateUITests
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import XCTest
import Foundation
import Cucumberish

class CucumberishInitializer: NSObject {
    
    @objc class func setupCucumberish() {
        
        let workFlow:LoginWorkFlow = LoginWorkFlow(XCUIApplication())
        
        before({ _ in
            XCUIApplication().launch()
        })
        
        Given("I am on Login Screen") { (args, userInfo) -> Void in
            workFlow.validateLoginView()
        }
        
        When("User enters valid credentials") { (args, userInfo) -> Void in
            if let studentModel: StudentJsonModel = DataParser.getDataFromJsonAndParse("CustomData", ofType: "json") {
                workFlow.userLogin(email: studentModel.inputs.first?.userName ?? "", password: studentModel.inputs.first?.passWord ?? "")
            }
        }
        
        Then("Login is successful") { (args, userInfo) -> Void in
            XCTAssert(false == workFlow.isAlertExists(), "Validation Failed...")
        }
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: self.getTags(), excludeTags: nil)
    }
    
    fileprivate class func getTags() -> [String]? {
        var itemsTags: [String]? = nil
        for i in ProcessInfo.processInfo.arguments {
            if i.hasPrefix("-Tags:") {
                let newItems = i.replacingOccurrences(of: "-Tags:", with: "")
                itemsTags = newItems.components(separatedBy: ",")
            }
        }
        return itemsTags
    }
    
}
