//
//  ContentView.swift
//  TouchDown
//
//  Created by Samroz Javed on 07/08/2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let playerss: [Player] = Bundle.main.decode("player.json")
    @EnvironmentObject var shop: Shop
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    
                    NavigationBarView()
                    //.padding()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .background(.white)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    ScrollView (.vertical, showsIndicators: false, content:{
                        VStack (spacing: 0){
                            
                            ZStack {
                                FeaturedTabView()
                                    .padding(.vertical, 20)
                                    .frame(minHeight: UIScreen.main.bounds.height / 3)
                            }
                                
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            
                            LazyVGrid(columns: gridLayout, spacing: 15, content: {
                                ForEach(products){ product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            withAnimation(.easeOut) {
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                }//: LOOP
                            })//: GRID
                                .padding(15)
                            
                            TitleView(title: "Brands")
                            
                            BrandGridView()
                            
                            FooterView()
                                .padding(.horizontal)

                        }//: VSTACK
                    })//: SCROLL
                    
                }//: VSTACK
                .background(
                    colorBackground.ignoresSafeArea(.all, edges: .all)
                )
            } else {
                ProductDetailView()
            }
        }//: ZSTACK
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
