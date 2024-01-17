//
//  Network.swift
//  rickAndMortyApp
//
//  Created by Cristian Gutiérrez on 03-01-24.
//

import Foundation

class Network: ObservableObject {
    @Published var characters: [Character] = []
    
    func getCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodeResults = try JSONDecoder().decode(ApiResponse.self, from: data)
                        print(decodeResults)
                        self.characters = decodeResults.results
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
