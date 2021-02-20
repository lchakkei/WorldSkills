//
//  RegisterViewController.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func registerButton(_ sender: Any) {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        
        let buttonID = "register"
        
        userManager.userRegister(email: email, password: password) { (error) in

        }
    }
    
}