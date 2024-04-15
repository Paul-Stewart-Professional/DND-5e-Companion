// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MagicItemDetailQuery: GraphQLQuery {
  public static let operationName: String = "MagicItemDetail"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MagicItemDetail($name: String) { magicItems(name: $name) { __typename name rarity equipment_category { __typename name } desc } }"#
    ))

  public var name: GraphQLNullable<String>

  public init(name: GraphQLNullable<String>) {
    self.name = name
  }

  public var __variables: Variables? { ["name": name] }

  public struct Data: DNDSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("magicItems", [MagicItem]?.self, arguments: ["name": .variable("name")]),
    ] }

    public var magicItems: [MagicItem]? { __data["magicItems"] }

    /// MagicItem
    ///
    /// Parent Type: `MagicItem`
    public struct MagicItem: DNDSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.MagicItem }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("rarity", GraphQLEnum<DNDSchema.MagicItemRarity>.self),
        .field("equipment_category", Equipment_category.self),
        .field("desc", [String].self),
      ] }

      public var name: String { __data["name"] }
      public var rarity: GraphQLEnum<DNDSchema.MagicItemRarity> { __data["rarity"] }
      public var equipment_category: Equipment_category { __data["equipment_category"] }
      public var desc: [String] { __data["desc"] }

      /// MagicItem.Equipment_category
      ///
      /// Parent Type: `EquipmentCategory`
      public struct Equipment_category: DNDSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.EquipmentCategory }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String.self),
        ] }

        public var name: String { __data["name"] }
      }
    }
  }
}
