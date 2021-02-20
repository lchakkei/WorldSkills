//
//  UserDetailViewController.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import UIKit

class PetDetailViewController: UIViewController {
    
    @IBOutlet weak var petNameTextField: UILabel!
    @IBOutlet weak var speciesTextField: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    
    let petManager = PetManager()
    var pet: Data?
    var imageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        petNameTextField.text = pet?.name
        speciesTextField.text = "\(pet?.species) / \(pet?.breed)"
        
        imageURL = pet!.thumbnail
        let url = URL(string: imageURL!)
        petImage.downloaded(from: url!)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? PetUpdateViewController {
            controller.id = pet?.id
        }
    }
    
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
