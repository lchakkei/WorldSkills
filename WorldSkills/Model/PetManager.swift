//
//  UserManager.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import Foundation

class PetManager {
    
    var pets = [Data]()
    let decoder = JSONDecoder()
    
    // MARK: - Auth
    
    func login(email: String, password: String, completion: @escaping (Error?) -> ()) {
        var urlRequest = URLRequest(url: Utilities.loginURL!)
        
        urlRequest.httpMethod = "POST"
        let params = ["email": email, "password": password]
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
                    UserDefaults.standard.set(true, forKey: "LOGGED")
                    print("Success")
                }
                completion(nil)
            }.resume()
        } catch {
            completion(error)
        }
    }
    
    
    func register(email: String, password: String, completion: @escaping (Error?) -> ()) {
        var urlRequest = URLRequest(url: Utilities.registerURL!)
        urlRequest.httpMethod = "POST"
        let params = ["email": email, "password": password]
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
                    UserDefaults.standard.set(true, forKey: "LOGGED")
                    print("Success")
                }
                completion(nil)
            }.resume()
        } catch {
            completion(error)
        }
    }
    
    // MARK: - CRUD
    
    func petsList(completion: @escaping ([Data], Error?) -> ())  {
        URLSession.shared.dataTask(with: Utilities.listURL!) { [self] (data, response, error) in
            guard let safeData = data else {return}
            do {
                let decodedData = try self.decoder.decode(Pet.self, from: safeData)
                self.pets = decodedData.data
                DispatchQueue.main.async {
                    completion(decodedData.data, error)
                }
            } catch {
                DispatchQueue.main.async {
                    completion([], error)
                }
            }
        }.resume()
    }
    
    func petCreate(name: String, species: String, breed: String, thumbnail: String, completion: @escaping (Error?) -> ()) {
        var urlRequest = URLRequest(url: Utilities.createURL!)
        
        urlRequest.httpMethod = "POST"
        let params = ["name": name, "species": species, "breed": breed, "thumbnail": thumbnail]
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
                    print("Created")
                }
                completion(nil)
            }.resume()
        } catch {
            completion(error)
        }
    }
    
    func petUpdate(id: Int, petName: String, species: String, breed: String, thumbnail: String, completion: @escaping (Error?) -> ()) {
        let updateUrl = URL(string: "\(Utilities.updateURL)\(id)")
        var urlRequest = URLRequest(url: updateUrl!)
        
        urlRequest.httpMethod = "PUT"
        let params = ["name": petName, "species": species, "breed": breed, "thumbnail": thumbnail]
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
                    print("Updated")
                }
                completion(nil)
            }.resume()
        } catch {
            completion(error)
        }
    }
    
    func petDelete(id: Int, completion: @escaping (Error?) -> ()) {
        let deleteUrl = URL(string: "\(Utilities.deleteURL)\(id)")
        var urlRequest = URLRequest(url: deleteUrl!)
        urlRequest.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: urlRequest) { (data, resp, err) in
            DispatchQueue.main.async {
                if let err = err {
                    completion(err)
                    return
                }
                if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                    let errorString = String(data: data!, encoding: .utf8) ?? ""
                    completion(NSError(domain: "", code: resp.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]))
                    print(resp.statusCode)
                    return
                }
                completion(nil)
            }
        }.resume()
    }
    
}
