// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SpellsQuery: GraphQLQuery {
  public static let operationName: String = "Spells"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Spells($name: String, $level: IntFilter, $class: StringFilter, $school: StringFilter, $range: StringFilter, $limit: Int!) { spells( name: $name level: $level class: $class school: $school range: $range limit: $limit ) { __typename name level desc school { __typename name } range index } }"#
    ))

  public var name: GraphQLNullable<String>
  public var level: GraphQLNullable<IntFilter>
  public var `class`: GraphQLNullable<StringFilter>
  public var school: GraphQLNullable<StringFilter>
  public var range: GraphQLNullable<StringFilter>
  public var limit: Int

  public init(
    name: GraphQLNullable<String>,
    level: GraphQLNullable<IntFilter>,
    `class`: GraphQLNullable<StringFilter>,
    school: GraphQLNullable<StringFilter>,
    range: GraphQLNullable<StringFilter>,
    limit: Int
  ) {
    self.name = name
    self.level = level
    self.`class` = `class`
    self.school = school
    self.range = range
    self.limit = limit
  }

  public var __variables: Variables? { [
    "name": name,
    "level": level,
    "class": `class`,
    "school": school,
    "range": range,
    "limit": limit
  ] }

  public struct Data: DNDSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("spells", [Spell]?.self, arguments: [
        "name": .variable("name"),
        "level": .variable("level"),
        "class": .variable("class"),
        "school": .variable("school"),
        "range": .variable("range"),
        "limit": .variable("limit")
      ]),
    ] }

    public var spells: [Spell]? { __data["spells"] }

    /// Spell
    ///
    /// Parent Type: `Spell`
    public struct Spell: DNDSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { DNDSchema.Objects.Spell }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("level", Int.self),
        .field("desc", [String].self),
        .field("school", School.self),
        .field("range", String.self),
        .field("index", String.self),
      ] }

      public var name: String { __data["name"] }
      public var level: Int { __data["level"] }
      public var desc: [String] { __data["desc"] }
      public var school: School { __data["school"] }
      public var range: String { __data["range"] }
      public var index: String { __data["index"] }

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
        ] }

        public var name: String { __data["name"] }
      }
    }
  }
}
