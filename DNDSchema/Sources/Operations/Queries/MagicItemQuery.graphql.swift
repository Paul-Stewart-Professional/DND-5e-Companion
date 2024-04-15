// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MagicItemQuery: GraphQLQuery {
  public static let operationName: String = "MagicItem"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MagicItem($equipmentCategory: StringFilter, $order: MagicItemOrder, $name: String) { magicItems(equipment_category: $equipmentCategory, order: $order, name: $name) { __typename rarity name equipment_category { __typename name } desc index } }"#
    ))

  public var equipmentCategory: GraphQLNullable<StringFilter>
  public var order: GraphQLNullable<MagicItemOrder>
  public var name: GraphQLNullable<String>

  public init(
    equipmentCategory: GraphQLNullable<StringFilter>,
    order: GraphQLNullable<MagicItemOrder>,
    name: GraphQLNullable<String>
  ) {
    self.equipmentCategory = equipmentCategory
    self.order = order
    self.name = name
  }

  public var __variables: Variables? { [
    "equipmentCategory": equipmentCategory,
    "order": order,
    "name": name
  ] }

  public struct Data: DNDSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("magicItems", [MagicItem]?.self, arguments: [
        "equipment_category": .variable("equipmentCategory"),
        "order": .variable("order"),
        "name": .variable("name")
      ]),
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
        .field("rarity", GraphQLEnum<DNDSchema.MagicItemRarity>.self),
        .field("name", String.self),
        .field("equipment_category", Equipment_category.self),
        .field("desc", [String].self),
        .field("index", String.self),
      ] }

      public var rarity: GraphQLEnum<DNDSchema.MagicItemRarity> { __data["rarity"] }
      public var name: String { __data["name"] }
      public var equipment_category: Equipment_category { __data["equipment_category"] }
      public var desc: [String] { __data["desc"] }
      public var index: String { __data["index"] }

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
