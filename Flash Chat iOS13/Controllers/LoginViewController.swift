//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print("Error logging in: \(e.localizedDescription)")
                    self!.showErrorAlert(message: e.localizedDescription)
                } else {
//                    DispatchQueue.main.async {
                    self!.performSegue(withIdentifier: K.loginSegue, sender: self)
//                    }
                }
//                guard let strongSelf = self else { return }
                // ...
            }
        }
    }
    
    // MARK: - Helper to show alerts
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }

    
}
