//
//  Shop.swift
//  TouchDown
//
//  Created by Samroz Javed on 11/08/2022.
//

import Foundation

class Shop: ObservableObject {
    
    //@Published notifies the change and reloads the view
   @Published var showingProduct: Bool = false
   @Published var selectedProduct: Product? = nil
}
