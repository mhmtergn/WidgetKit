//
//  HeroView.swift
//  HeroWidget
//
//  Created by Mehmet Ergün on 2022-06-24.
//

import SwiftUI

struct HeroView: View {
    
    let hero: SuperHero
    
    var body: some View {
        Spacer()
        HStack {
        CircularImageView(image: Image(hero.image))
            .frame(width: 150, height: 150, alignment: .center)
            VStack {
                Text(hero.name).font(.largeTitle).foregroundColor(Color.red)
                
                Text(hero.realName).underline(true, color: Color.red).padding()
            }
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
        Spacer()
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero: deadpool)
    }
}
