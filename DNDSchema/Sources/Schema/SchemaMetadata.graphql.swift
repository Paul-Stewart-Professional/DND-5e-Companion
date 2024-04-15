// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == DNDSchema.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == DNDSchema.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == DNDSchema.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == DNDSchema.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return DNDSchema.Objects.Query
    case "Spell": return DNDSchema.Objects.Spell
    case "MagicSchool": return DNDSchema.Objects.MagicSchool
    case "SpellDamage": return DNDSchema.Objects.SpellDamage
    case "DamageAtLevel": return DNDSchema.Objects.DamageAtLevel
    case "DamageType": return DNDSchema.Objects.DamageType
    case "AreaOfEffect": return DNDSchema.Objects.AreaOfEffect
    case "SpellDc": return DNDSchema.Objects.SpellDc
    case "AbilityScore": return DNDSchema.Objects.AbilityScore
    case "Class": return DNDSchema.Objects.Class
    case "HealingAtLevel": return DNDSchema.Objects.HealingAtLevel
    case "MagicItem": return DNDSchema.Objects.MagicItem
    case "Tool": return DNDSchema.Objects.Tool
    case "Gear": return DNDSchema.Objects.Gear
    case "Pack": return DNDSchema.Objects.Pack
    case "Ammunition": return DNDSchema.Objects.Ammunition
    case "Weapon": return DNDSchema.Objects.Weapon
    case "Armor": return DNDSchema.Objects.Armor
    case "Vehicle": return DNDSchema.Objects.Vehicle
    case "EquipmentCategory": return DNDSchema.Objects.EquipmentCategory
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
