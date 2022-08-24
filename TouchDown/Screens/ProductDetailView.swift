//
//  ProductDetailView.swift
//  TouchDown
//
//  Created by Samroz Javed on 11/08/2022.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5, content:  {
            //NAVBAR
            
            NavigationBarDetailView()
                .padding(.top, 50)
                .padding(.horizontal, 15)
                .padding(.bottom)
            //HEADER
            HeaderDetailView()
                .padding(.horizontal)
            
            //DETAIL TOP PART
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)
            
            //DETAIL BOTTOM PART
            VStack(alignment: .leading, spacing: 5, content:  {
            
            //RATING + SIZES
            RatingSizesDetailView()
                    .padding(.top, -25)
                    .padding(.bottom)
                
            //DESCRIPTION
                ScrollView(.vertical, showsIndicators: false){
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                } //: SCROLL
            //QUANTITY + FAVOURITE
                QuantityFavouriteDetailView()
                    .padding(.bottom)
                
            //ADD TO CART
                
            AddToCartDetailView()
                    .padding(.bottom, 20)
                
                Spacer()
            }) //: VSTACK
                .padding(.horizontal)
                .background(
                    Color.white
                    .clipShape(CustomShape())
                        .padding(.top, -105)
                )
            
            
        }) //: VSTACK
            .zIndex(0)
            .ignoresSafeArea(.all, edges: .all)
            .background(Color(red: shop.selectedProduct?.red ?? sampleProduct.red,
                              green: shop.selectedProduct?.green ?? sampleProduct.green,
                              blue: shop.selectedProduct?.blue ?? sampleProduct.blue))
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .previewLayout(.fixed(width: 375, height: 812))
            .environmentObject(Shop())
    }
}
