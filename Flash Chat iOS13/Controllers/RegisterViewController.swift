//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text, let password = passwordTextfield.text else { return }

            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    // Show alert with error
                    self.showErrorAlert(message: e.localizedDescription)
                } else {
                    //Navigate to the ChatViewController
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }
                }
            }
        }

        // MARK: - Helper to show alerts
        func showErrorAlert(message: String) {
            let alert = UIAlertController(title: "Registration Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
        }
//        performSegue(withIdentifier: "RegisterToChat", sender: self)
//        
//        if let email = emailTextfield.text, let password = passwordTextfield.text {
//            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//                if let e = error {
//                    print(e.localizedDescription)
//                } else {
//                    //Navigate to the ChatViewController
//                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
//                    
//                }
//            }
//        }
//    }
    
}
