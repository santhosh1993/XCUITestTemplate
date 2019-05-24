//
//  ViewController.swift
//  XCUITestTemplate
//
//  Created by Santhosh Nampally on 24/05/19.
//  Copyright © 2019 Santhosh Nampally. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    // MARK: Button Actions
    
    @IBAction func buttonActionClickMe(_ button: UIButton) {
        
        let isUserNameValid = Validations.validateUserName(textFieldUsername.text ?? "")
        let isPasswordValid = Validations.validatePassword(textFieldPassword.text ?? "")
        guard  isUserNameValid && isPasswordValid else {
            let errorMessage = !isUserNameValid ? "Please Enter Valid Email" : "Please Enter Valid Password"
            showAlertController(errorMessage)
            return
        }
    }
}

extension ViewController {
    
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.show(alertController, sender: nil)
    }
}

//MARK:- Validations

struct Validations {
    
    static func validateUserName(_ userName: String) -> Bool {
        
        let regexEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regexEmail)
        return emailTest.evaluate(with: userName)
    }
    static func validatePassword(_ password: String) -> Bool {
        
        let regexPassword = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{4,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", regexPassword)
        return passwordTest.evaluate(with: password)
    }
}
