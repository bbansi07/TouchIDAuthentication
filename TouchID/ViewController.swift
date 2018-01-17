//
//  ViewController.swift
//  TouchID
//
//  Created by \ on 17/01/18.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBAction func btnPressed(_ sender: Any) {
        authenticationWithTouchID()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func authenticationWithTouchID() {
        let localAuthenticationContext  = LAContext()
        localAuthenticationContext.localizedFallbackTitle = "Use Passcode"
        var title = ""
        var msg = ""
        
        
        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To access the secure data") { success, evaluateError in
                
                if success {
                    //TODO: User authenticated successfully, take appropriate action
                    title = "Touch ID"
                    msg = "User authenticated Successfully..."
                    self.showMessage(withtitle: title, withMessage: msg)
                    print("User authenticated Successfully...")
                } else {
                    //TODO: User did not authenticate successfully, look at error and take appropriate action
                    title = "Touch ID"
                    msg = "User did not authenticate successfully"
                    print("User did not authenticate successfully")
                    self.showMessage(withtitle: title, withMessage: msg)
                    //TODO: If you have choosen the 'Fallback authentication mechanism selected' (LAError.userFallback). Handle gracefully
                }
            }
            
        } else {
            //TODO: Show appropriate alert if biometry/TouchID/FaceID is lockout or not enrolled
            
            title = "Touch ID"
            msg = "biometry/TouchID/FaceID is lockout or not enrolled"
            print("biometry/TouchID/FaceID is lockout or not enrolled")
            self.showMessage(withtitle: title, withMessage: msg)
        }
        
    }
    
    func showMessage(withtitle : String, withMessage : String){
        
        let alert = UIAlertController(title:withtitle, message: withMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel){
            action in
            
        }
        alert.addAction(okAction)
        self.present(alert, animated: true ,completion : nil)
        
    }
}

