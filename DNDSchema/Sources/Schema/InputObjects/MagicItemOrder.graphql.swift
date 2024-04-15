// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct MagicItemOrder: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    by: GraphQLEnum<MagicItemOrderBy>,
    direction: GraphQLEnum<OrderByDirection>?,
    thenBy: GraphQLNullable<MagicItemOrder> = nil
  ) {
    __data = InputDict([
      "by": by,
      "direction": direction,
      "then_by": thenBy
    ])
  }

  public var by: GraphQLEnum<MagicItemOrderBy> {
    get { __data["by"] }
    set { __data["by"] = newValue }
  }

  public var direction: GraphQLEnum<OrderByDirection>? {
    get { __data["direction"] }
    set { __data["direction"] = newValue }
  }

  public var thenBy: GraphQLNullable<MagicItemOrder> {
    get { __data["then_by"] }
    set { __data["then_by"] = newValue }
  }
}
