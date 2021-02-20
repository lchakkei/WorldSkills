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
    @IBOutlet weak var confirmationPasswordTextField: UITextField!
    
    let petManager = PetManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func registerButton(_ sender: Any) {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let confirmationPassword = confirmationPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        
        if password == confirmationPassword {
            petManager.register(email: email, password: password) { (error) in

            }
        }
    }
    
}

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
       textField.resignFirstResponder()
       return true
    }
    
}
