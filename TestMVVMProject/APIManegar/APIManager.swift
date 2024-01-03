//
//  APIManager.swift
//  TestMVVMProject
//
//  Created by Suresh Sindam on 1/2/24.
//

import Foundation


class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func getData(completion: @escaping (DataModel?) -> Void) {
        
        let apiURL = URLRequest(url: URL(string: "https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json")!)

        
        URLSession.shared.dataTask(with: apiURL) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "")")
                completion(nil)
                return
            }
            
            do {
                let fetchedData = try JSONDecoder().decode(DataModel.self, from: data)
                
                completion(fetchedData)
                
            } catch {
                print("Error fetching data: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
