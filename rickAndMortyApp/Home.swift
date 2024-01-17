//
//  Home.swift
//  rickAndMortyApp
//
//  Created by Cristian Gutiérrez on 17-12-23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var network: Network
    var body: some View {
        VStack {
            Text("The Rick and Morty API")
                .font(.title)
                .foregroundStyle(.white)
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(network.characters) { character in
                        CharacterCard(character: character)
                    }
                }
                .padding()
            }
        }
        .background(Color("black-home"))
        .onAppear{
            network.getCharacters()
        }
    }
}

struct CharacterCard: View {
    let character: Character
    
    var body: some View {
        HStack(alignment: .top ,spacing: 10 ,content: {
            AsyncImage(url: URL(string: character.image), scale: 3)
            VStack(alignment: .leading) {
                Text(character.name)
                    .bold()
                    .foregroundStyle(.white)
                HStack {
                    Text(character.status)
                        .foregroundStyle(.white)
                    Text("-")
                        .foregroundStyle(.white)
                    Text(character.species)
                        .foregroundStyle(.white)
                }
                Text(character.gender)
                    .foregroundStyle(Color("grey-item-card"))
                Text(character.origin.name)
                    .foregroundStyle(Color("grey-item-card"))
            }
            .padding(.top, 5)
        })
        .frame(minWidth: 0, maxWidth: .infinity ,alignment: .leading)
        .background(Color("grey-card"))
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(Network())
    }
}
