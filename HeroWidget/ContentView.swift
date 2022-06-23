//
//  ContentView.swift
//  HeroWidget
//
//  Created by Mehmet Ergün on 2022-06-24.
//

import SwiftUI
import WidgetKit

let superHeroArray = [superman, deadpool, hulk ]

struct ContentView: View {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.mehmetergun.HeroWidget"))
    var heroData: Data = Data()
    
    var body: some View {
        VStack{
            ForEach(superHeroArray) {hero in
                HeroView(hero: hero).onTapGesture {
                    saveToDefault(hero: hero)
                }
            }
        }
    }
    
    func saveToDefault(hero: SuperHero) {
        if let heroData = try? JSONEncoder().encode(hero) {
            self.heroData = heroData
            print(hero.name)
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetHero")
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
