//
//  CircularImageView.swift
//  HeroWidget
//
//  Created by Mehmet Ergün on 2022-06-24.
//

import SwiftUI

struct CircularImageView: View {
    
    var image: Image
    
    var body: some View {
        image.resizable().aspectRatio(contentMode: .fit)
            .clipShape(Circle()).overlay(Circle().stroke(Color.red, lineWidth: 2))
            .shadow(radius: 15)
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: Image("superman"))
    }
}
