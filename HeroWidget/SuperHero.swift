//
//  SuperHero.swift
//  HeroWidget
//
//  Created by Mehmet Ergün on 2022-06-24.
//

import Foundation


struct SuperHero: Codable, Identifiable {

    let image: String
    let name: String
    let realName: String
    
    var id: String { image }
    
}

let superman = SuperHero(image: "superman", name: "Superman", realName: "Clark Kent")
let deadpool = SuperHero(image: "deadpool", name: "DeadPool", realName: "Wade Wilson")
let hulk = SuperHero(image: "hulk", name: "Hulk", realName: "Bruce Banner")
