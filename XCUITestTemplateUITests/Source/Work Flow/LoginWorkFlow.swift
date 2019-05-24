//
//  LoginWorkFlow.swift
//  XCUITestTemplateUITests
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation
import XCTest

class LoginWorkFlow {
    var loginPage:LoginPage
    
    init(_ app: XCUIApplication) {
        loginPage = LoginPage(app: app)
    }
    
    func userLogin(email:String,password:String) {
        loginPage.enterEmail(email)
        loginPage.enterPassword(password)
        loginPage.tapLogin()
    }
    
    func isAlertExists() -> Bool {
        return loginPage.isAlertExists()
    }
    
    func validateLoginView() {
        loginPage.validateLoginView()
    }
}
