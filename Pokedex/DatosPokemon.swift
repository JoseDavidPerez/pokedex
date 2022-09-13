//
//  DatosPokemon.swift
//  Pokedex
//
//  Created by osx on 08/09/22.
//

import Foundation

struct Pokemon: Decodable , Identifiable {
    
    let id : Int
    let attack: Int
    let name : String
    let imageUrl: String
    let defense: Int
    let type : String
    let description : String
    
    
}
