//
//  LoginPage.swift
//  XCUITestTemplateUITests
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import Foundation

import XCTest

class LoginPage:BasePage {
    
    private enum Element:String {
        case loginView = "loginView"
        case userName = "username"
        case password = "password"
        case login = "clickMe"
        case alert = "Alert!"
        
        func get(_ app:XCUIApplication) -> XCUIElement {
            switch self {
            case .loginView:
                return app.otherElements[self.rawValue]
            case .userName,.password:
                return app.textFields[self.rawValue]
            case .login:
                return app.buttons[self.rawValue]
            case .alert:
                return app.alerts[self.rawValue]
            }
        }
    }
    
    func enterEmail(_ emailStr:String) {
        let element = Element.userName.get(app)
        waitForElementToAppear(element)
        updateText(element, str: emailStr)
    }
    
    func enterPassword(_ passwordStr:String) {
        let element = Element.password.get(app)
        waitForElementToAppear(element)
        updateText(element, str: passwordStr)
    }
    
    func tapLogin() {
        let element = Element.login.get(app)
        waitForElementToAppear(element)
        Element.login.get(app).tap()
    }
    
    func updateText(_ element:XCUIElement,str:String) {
        element.tap()
        clearText()
        element.typeText(str)
    }
    
    func  isAlertExists() -> Bool {
        let element = Element.alert.get(app)
        waitForElementToAppear(element)
        return element.exists
    }
    
    func validateLoginView() {
        let element = Element.loginView.get(app)
        waitForElementToAppear(element)
    }
    
}
