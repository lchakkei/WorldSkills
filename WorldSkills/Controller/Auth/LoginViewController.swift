//
//  LoginViewController.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let petManager = PetManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        petStatus()
        
    }
    
    func petStatus() {
        if UserDefaults.standard.bool(forKey: "LOGGED") {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBar") as! TabBarController
            self.view.window?.rootViewController = vc
            self.view.window?.makeKeyAndVisible()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func loginButton(_ sender: Any) {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}

        petManager.login(email: email, password: password) { (error) in

        }
        
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
       textField.resignFirstResponder()
       return true
    }
    
}
