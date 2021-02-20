//
//  UserManager.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import Foundation

struct UserManager {
    
    func userAuth(email: String, password: String, completion: @escaping (Error?) -> ()) {
        var urlRequest = URLRequest(url: Utilities.registerURL!)
        urlRequest.httpMethod = "POST"
        let params = ["email": "eve.holt@reqres.in", "password": "pistol"]
        do {
            let data = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                    let errorString = String(data: data!, encoding: .utf8) ?? ""
                    completion(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]))
                    print(response.statusCode)
                    return
                } else {
                    // UserDefaults.standard.set(true, forKey: "LOGGED")
                    print("Success")
                }
                completion(nil)
            }.resume()
        } catch {
            completion(error)
        }
    }
    
    
}
