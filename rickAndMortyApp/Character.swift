//
//  Character.swift
//  rickAndMortyApp
//
//  Created by Cristian Gutiérrez on 16-12-23.
//

import Foundation

struct Character: Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var status: String
    var species: String
    var gender: String
    var origin: Origin
}

struct CharacterCollection: Codable {
    var characters: [Character]
}

struct ApiResponse: Codable {
    var results: [Character]
}

struct Origin: Codable {
    var name: String
    var url: String
}
