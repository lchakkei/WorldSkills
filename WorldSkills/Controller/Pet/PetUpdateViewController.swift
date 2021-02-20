//
//  PetUpdateViewController.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import UIKit

class PetUpdateViewController: UIViewController {

    @IBOutlet weak var petNameTextField: UITextField!
    @IBOutlet weak var speciesTextField: UITextField!
    @IBOutlet weak var breedTextField: UITextField!
    @IBOutlet weak var thumbnailTextField: UITextField!
    
    let petManager = PetManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateButton(_ sender: Any) {
        guard let petName = petNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let species = speciesTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let breed = breedTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let thumbnail = thumbnailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}

        petManager.petUpdate(id: 0, petName: petName, species: species, breed: breed, thumbnail: thumbnail) { (error) in
            
        }
    }
    
}
