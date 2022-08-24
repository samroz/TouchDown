//
//  FeaturedItemView.swift
//  TouchDown
//
//  Created by Samroz Javed on 09/08/2022.
//

import SwiftUI

struct FeaturedItemView: View {
    var player: Player
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
            .frame(minHeight: UIScreen.main.bounds.height / 3)
    }
}

struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemView(player: players[1])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
