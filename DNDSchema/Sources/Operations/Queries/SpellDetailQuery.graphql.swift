// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SpellDetailQuery: GraphQLQuery {
  public static let operationName: String = "SpellDetail"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SpellDetail($index: String) { spell(index: $index) { __typename attack_type casting_time damage { __typename damage_at_character_level { __typename level damage } damage_type { __typename desc name index } damage_at_slot_level { __typename damage level } } level name range desc higher_level area_of_effect { __typename size type } dc { __typename success desc type { __typename name } } school { __typename name desc index } classes { __typename name } components heal_at_slot_level { __typename level healing } } }"#
    ))

  public var index: GraphQLNullable<String>

  public init(index: GraphQLNullable<String>) {
    self.index = index
  }

  public var __variables: Variables? { ["index": index] }

  public struct Data: DNDSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("spell", Spell?.self, arguments: ["index": .variable("index")]),
    ] }

    public var spell: Spell? { __data["spell"] }

    /// Spell
    ///
    /// Parent Type: `Spell`
    public struct Spell: DNDSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.Spell }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("attack_type", GraphQLEnum<DNDSchema.SpellAttackType>?.self),
        .field("casting_time", String.self),
        .field("damage", Damage?.self),
        .field("level", Int.self),
        .field("name", String.self),
        .field("range", String.self),
        .field("desc", [String].self),
        .field("higher_level", [String]?.self),
        .field("area_of_effect", Area_of_effect?.self),
        .field("dc", Dc?.self),
        .field("school", School.self),
        .field("classes", [Class].self),
        .field("components", [GraphQLEnum<DNDSchema.SpellComponent>?]?.self),
        .field("heal_at_slot_level", [Heal_at_slot_level]?.self),
      ] }

      public var attack_type: GraphQLEnum<DNDSchema.SpellAttackType>? { __data["attack_type"] }
      public var casting_time: String { __data["casting_time"] }
      public var damage: Damage? { __data["damage"] }
      public var level: Int { __data["level"] }
      public var name: String { __data["name"] }
      public var range: String { __data["range"] }
      public var desc: [String] { __data["desc"] }
      public var higher_level: [String]? { __data["higher_level"] }
      public var area_of_effect: Area_of_effect? { __data["area_of_effect"] }
      public var dc: Dc? { __data["dc"] }
      public var school: School { __data["school"] }
      public var classes: [Class] { __data["classes"] }
      public var components: [GraphQLEnum<DNDSchema.SpellComponent>?]? { __data["components"] }
      public var heal_at_slot_level: [Heal_at_slot_level]? { __data["heal_at_slot_level"] }

      /// Spell.Damage
      ///
      /// Parent Type: `SpellDamage`
      public struct Damage: DNDSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.SpellDamage }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("damage_at_character_level", [Damage_at_character_level]?.self),
          .field("damage_type", Damage_type?.self),
          .field("damage_at_slot_level", [Damage_at_slot_level]?.self),
        ] }

        public var damage_at_character_level: [Damage_at_character_level]? { __data["damage_at_character_level"] }
        public var damage_type: Damage_type? { __data["damage_type"] }
        public var damage_at_slot_level: [Damage_at_slot_level]? { __data["damage_at_slot_level"] }

        /// Spell.Damage.Damage_at_character_level
        ///
        /// Parent Type: `DamageAtLevel`
        public struct Damage_at_character_level: DNDSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.DamageAtLevel }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("level", Int.self),
            .field("damage", String.self),
          ] }

          public var level: Int { __data["level"] }
          public var damage: String { __data["damage"] }
        }

        /// Spell.Damage.Damage_type
        ///
        /// Parent Type: `DamageType`
        public struct Damage_type: DNDSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.DamageType }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("desc", [String].self),
            .field("name", String.self),
            .field("index", String.self),
          ] }

          public var desc: [String] { __data["desc"] }
          public var name: String { __data["name"] }
          public var index: String { __data["index"] }
        }

        /// Spell.Damage.Damage_at_slot_level
        ///
        /// Parent Type: `DamageAtLevel`
        public struct Damage_at_slot_level: DNDSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.DamageAtLevel }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("damage", String.self),
            .field("level", Int.self),
          ] }

          public var damage: String { __data["damage"] }
          public var level: Int { __data["level"] }
        }
      }

      /// Spell.Area_of_effect
      ///
      /// Parent Type: `AreaOfEffect`
      public struct Area_of_effect: DNDSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.AreaOfEffect }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("size", Int.self),
          .field("type", GraphQLEnum<DNDSchema.AreaOfEffectType>.self),
        ] }

        public var size: Int { __data["size"] }
        public var type: GraphQLEnum<DNDSchema.AreaOfEffectType> { __data["type"] }
      }

      /// Spell.Dc
      ///
      /// Parent Type: `SpellDc`
      public struct Dc: DNDSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.SpellDc }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("success", GraphQLEnum<DNDSchema.DcSuccess>.self),
          .field("desc", String?.self),
          .field("type", Type_SelectionSet.self),
        ] }

        public var success: GraphQLEnum<DNDSchema.DcSuccess> { __data["success"] }
        public var desc: String? { __data["desc"] }
        public var type: Type_SelectionSet { __data["type"] }

        /// Spell.Dc.Type_SelectionSet
        ///
        /// Parent Type: `AbilityScore`
        public struct Type_SelectionSet: DNDSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.AbilityScore }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }

      /// Spell.School
      ///
      /// Parent Type: `MagicSchool`
      public struct School: DNDSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.MagicSchool }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
          .field("desc", String.self),
          .field("index", String.self),
        ] }

        public var name: String { __data["name"] }
        public var desc: String { __data["desc"] }
        public var index: String { __data["index"] }
      }

      /// Spell.Class
      ///
      /// Parent Type: `Class`
      public struct Class: DNDSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.Class }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
        ] }

        public var name: String { __data["name"] }
      }

      /// Spell.Heal_at_slot_level
      ///
      /// Parent Type: `HealingAtLevel`
      public struct Heal_at_slot_level: DNDSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.HealingAtLevel }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("level", Int.self),
          .field("healing", String.self),
        ] }

        public var level: Int { __data["level"] }
        public var healing: String { __data["healing"] }
      }
    }
  }
}
