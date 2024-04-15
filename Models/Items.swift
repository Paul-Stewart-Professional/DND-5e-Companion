//
//  Items.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 4/6/24.
//

import Foundation
import DNDSchema

@MainActor
class SharedItemsArray: ObservableObject {
    
    @Published var itemsArray: [MagicItemQuery.Data.MagicItem] = []
    @Published var filteredItemsArray: [MagicItemQuery.Data.MagicItem] = []
    @Published var savedItemsArray: [MagicItemQuery.Data.MagicItem] = []
    @Published var savedItemsIndexArray: [String] = []
    
    
    static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("items.saved")
    }
    
    func load() async throws {
        let task = Task<[String], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let items = try JSONDecoder().decode([String].self, from: data)

            return items
        }
        let savedItems = try await task.value
        self.savedItemsIndexArray = savedItems
    }
    
    func save(items: [String]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(items)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
    
    func likeItem(item: MagicItemQuery.Data.MagicItem) async {
        savedItemsArray.append(item)
        savedItemsIndexArray.append(item.index)
        print(savedItemsIndexArray)
        Task {
            do {
                try await save(items: savedItemsIndexArray)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func dislikeItem(item: MagicItemQuery.Data.MagicItem) async {
        savedItemsArray.removeAll { $0 == item }
        savedItemsIndexArray.removeAll { $0 == item.index }
        print(savedItemsIndexArray)
        Task {
            do {
                try await save(items: savedItemsIndexArray)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func filterItems(with searchText: String) {
        if searchText.isEmpty {
            filteredItemsArray = itemsArray
        } else {
            if filteredItemsArray != [] {
                filteredItemsArray = filteredItemsArray.filter { item in
                    return item.name.lowercased().contains(searchText.lowercased())
                }
            } else {
                filteredItemsArray = itemsArray.filter { item in
                    return item.name.lowercased().contains(searchText.lowercased())
                }
            }
        }    }
}
