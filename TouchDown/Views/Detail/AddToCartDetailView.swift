//
//  AddToCartDetailView.swift
//  TouchDown
//
//  Created by Samroz Javed on 11/08/2022.
//

import SwiftUI

struct AddToCartDetailView: View {
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        Button(action: {
            feedback.impactOccurred()
        }, label: {
            Spacer()
            Text("ADD TO CART".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
                
        }) //: BUTTON
            .padding(15)
            .background(Color(red: shop.selectedProduct?.red ?? sampleProduct.red,
                              green: shop.selectedProduct?.green ?? sampleProduct.green,
                              blue: shop.selectedProduct?.blue ?? sampleProduct.blue))
            .clipShape(Capsule())
    }
                
}

struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(Shop())
    }
}
