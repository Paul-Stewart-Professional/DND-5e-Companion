//
//  NetworkController.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/5/24.
//
import Apollo
import Foundation
import DNDSchema
import ApolloSQLite


final class NetworkController {
    
    static let shared = NetworkController()
    
    private(set) var apollo = ApolloClient(url: API.url!)
    
    
    private(set) lazy var apolloSQLite: ApolloClient = {
        do {
            let documentsPath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let fileUrl = documentsPath.appendingPathComponent("apollo_cache.sqlite")

            let sqliteCache = try SQLiteNormalizedCache(fileURL: fileUrl)

            let store = ApolloStore(cache: sqliteCache)

            let normalTransport: RequestChainNetworkTransport = RequestChainNetworkTransport(interceptorProvider: DefaultInterceptorProvider(store: store), endpointURL: API.url!)

            return ApolloClient(networkTransport: normalTransport, store: store)
        } catch {
            print("Error creating ApolloSQLite Client: \(error)")
            return apollo
        }
    }()
    
    private init() { }
    
    func fetchSpells(name: GraphQLNullable<StringFilter>,
                     level: GraphQLNullable<IntFilter>,
                     characterClass: GraphQLNullable<StringFilter>,
                     school: GraphQLNullable<StringFilter>,
                     range: GraphQLNullable<StringFilter>,
                     limit: Int,
                     completion: @escaping ([SpellsQuery.Data.Spell]) -> Void) {
        // you can change it to... Int, [Int], or a custom type containing any or all of the Intfilter types defined in the apollo API docs
        let query = SpellsQuery(name: name, level: level, class: characterClass, school: school, range: range, limit: limit)
        NetworkController.shared.apolloSQLite.fetch(query: query) { result in
            switch result {
                
            case .success(let value):
                let fetchedSpells = value.data?.spells?.compactMap { $0 } ?? []
                completion(fetchedSpells)
                print("All Spells Fetched")
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func fetchSpellDetail(index: GraphQLNullable<String>, completion: @escaping (SpellDetailQuery.Data.Spell) -> Void) {
        let query = SpellDetailQuery(index: index)
        NetworkController.shared.apolloSQLite.fetch(query: query) { result in
            switch result {
                
            case .success(let value):
                let fetchedSpell = value.data?.spell
                completion(fetchedSpell!)
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func fetchMagicItem(equipmentCategory: GraphQLNullable<StringFilter>, order: GraphQLNullable<MagicItemOrder>, name: GraphQLNullable<String>, completion: @escaping ([MagicItemQuery.Data.MagicItem]) -> Void) {
        let query = MagicItemQuery(equipmentCategory: equipmentCategory, order: order, name: name)
        NetworkController.shared.apolloSQLite.fetch(query: query) { result in
            switch result {
            case .success(let value):
                let fetchedItems = value.data?.magicItems?.compactMap { $0 } ?? []
                completion(fetchedItems)
                print("all items fetched")
            case .failure(let error):
                debugPrint(error.localizedDescription)
                
            }
        }
    }
}
