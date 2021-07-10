//
//  APICaller.swift
//  ANF Code Test
//
//  Created by Md Rezaul Karim on 7/9/21.
//

import Foundation

struct APICaller {
    
    func exploreData(completion: @escaping(Result<[PromoCardModel], Error>) -> Void)  {
        if let filePath = Bundle.main.path(forResource: "exploreData", ofType: "json"),
           let fileContent = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            do {
                let jsonDictionary = try JSONDecoder().decode([PromoCardModel].self, from: fileContent)
                completion(.success(jsonDictionary))
            }catch{
                completion(.failure(error))
            }
        }
    }
}
