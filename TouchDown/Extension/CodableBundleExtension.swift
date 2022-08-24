//
//  CodableBundleExtension.swift
//  TouchDown
//
//  Created by Samroz Javed on 09/08/2022.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        //2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file) from bundle")
        }
        //3. Create a decoder
        let decoder = JSONDecoder()
        //4. Create a property for the decoder
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file) from bundle")
        }
        //5. Return the ready to use data
        return decodedData
    }
}
