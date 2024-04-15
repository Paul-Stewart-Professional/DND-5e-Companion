//
//  Spells.swift
//  dnd5eCompanion
//
//  Created by Paul Stewart on 3/7/24.
//

import Foundation
import DNDSchema

@MainActor
class SharedSpellsArray: ObservableObject{
    
    @Published var spellsArray: [SpellsQuery.Data.Spell] = []
    @Published var filteredSpellsArray: [SpellsQuery.Data.Spell] = []
    @Published var savedSpellsArray: [SpellsQuery.Data.Spell] = []
    @Published var savedSpellsIndexArray: [String] = []
    
    
    static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("spells.saved")
    }
    
    func load() async throws {
        let task = Task<[String], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let spells = try JSONDecoder().decode([String].self, from: data)

            return spells
        }
        let savedSpells = try await task.value
        self.savedSpellsIndexArray = savedSpells
    }
    
    func save(spells: [String]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(spells)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
    
    func likeSpell(spell: SpellsQuery.Data.Spell) async {
        guard !savedSpellsIndexArray.contains(spell.index) else { return }
        savedSpellsArray.append(spell)
        savedSpellsIndexArray.append(spell.index)
        print(savedSpellsIndexArray)
        Task {
            do {
                try await save(spells: savedSpellsIndexArray)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func dislikeSpell(spell: SpellsQuery.Data.Spell) async {
        savedSpellsArray.removeAll { $0 == spell }
        savedSpellsIndexArray.removeAll {$0 == spell.index}
        print(savedSpellsIndexArray)
        Task {
            do {
                try await save(spells: savedSpellsIndexArray)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func filterSpells(with searchText: String) {
        if searchText.isEmpty {
            filteredSpellsArray = spellsArray
        } else {
            if filteredSpellsArray != [] {
                filteredSpellsArray = filteredSpellsArray.filter { spell in
                    return spell.name.lowercased().contains(searchText.lowercased())
                }
            } else {
                filteredSpellsArray = spellsArray.filter { spell in
                    return spell.name.lowercased().contains(searchText.lowercased())
                }
            }
        }
    }
}

