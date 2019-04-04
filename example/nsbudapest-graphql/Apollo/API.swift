//  This file was automatically generated and should not be edited.

import Apollo

public final class StarredRepositoriesQuery: GraphQLQuery {
  public let operationDefinition =
    "query StarredRepositories($numberOfLastStarred: Int!) {\n  viewer {\n    __typename\n    starredRepositories(last: $numberOfLastStarred) {\n      __typename\n      nodes {\n        __typename\n        ...RepositoryCellFragment\n      }\n    }\n    repositoriesContributedTo(last: 1) {\n      __typename\n      nodes {\n        __typename\n        ...RepositoryCellFragment\n      }\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(RepositoryCellFragment.fragmentDefinition) }

  public var numberOfLastStarred: Int

  public init(numberOfLastStarred: Int) {
    self.numberOfLastStarred = numberOfLastStarred
  }

  public var variables: GraphQLMap? {
    return ["numberOfLastStarred": numberOfLastStarred]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("starredRepositories", arguments: ["last": GraphQLVariable("numberOfLastStarred")], type: .nonNull(.object(StarredRepository.selections))),
        GraphQLField("repositoriesContributedTo", arguments: ["last": 1], type: .nonNull(.object(RepositoriesContributedTo.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(starredRepositories: StarredRepository, repositoriesContributedTo: RepositoriesContributedTo) {
        self.init(unsafeResultMap: ["__typename": "User", "starredRepositories": starredRepositories.resultMap, "repositoriesContributedTo": repositoriesContributedTo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Repositories the user has starred.
      public var starredRepositories: StarredRepository {
        get {
          return StarredRepository(unsafeResultMap: resultMap["starredRepositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "starredRepositories")
        }
      }

      /// A list of repositories that the user recently contributed to.
      public var repositoriesContributedTo: RepositoriesContributedTo {
        get {
          return RepositoriesContributedTo(unsafeResultMap: resultMap["repositoriesContributedTo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "repositoriesContributedTo")
        }
      }

      public struct StarredRepository: GraphQLSelectionSet {
        public static let possibleTypes = ["StarredRepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StarredRepositoryConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(RepositoryCellFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var repositoryCellFragment: RepositoryCellFragment {
              get {
                return RepositoryCellFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct RepositoriesContributedTo: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(RepositoryCellFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var repositoryCellFragment: RepositoryCellFragment {
              get {
                return RepositoryCellFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class ProfileQuery: GraphQLQuery {
  public let operationDefinition =
    "query Profile {\n  viewer {\n    __typename\n    login\n    avatarUrl\n    name\n    status {\n      __typename\n      emoji\n      message\n    }\n    bio\n    company\n    email\n    location\n    repositories {\n      __typename\n      totalCount\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
        GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("status", type: .object(Status.selections)),
        GraphQLField("bio", type: .scalar(String.self)),
        GraphQLField("company", type: .scalar(String.self)),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("repositories", type: .nonNull(.object(Repository.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(login: String, avatarUrl: String, name: String? = nil, status: Status? = nil, bio: String? = nil, company: String? = nil, email: String, location: String? = nil, repositories: Repository) {
        self.init(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl, "name": name, "status": status.flatMap { (value: Status) -> ResultMap in value.resultMap }, "bio": bio, "company": company, "email": email, "location": location, "repositories": repositories.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }

      /// A URL pointing to the user's public avatar.
      public var avatarUrl: String {
        get {
          return resultMap["avatarUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatarUrl")
        }
      }

      /// The user's public profile name.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The user's description of what they're currently doing.
      public var status: Status? {
        get {
          return (resultMap["status"] as? ResultMap).flatMap { Status(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "status")
        }
      }

      /// The user's public profile bio.
      public var bio: String? {
        get {
          return resultMap["bio"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bio")
        }
      }

      /// The user's public profile company.
      public var company: String? {
        get {
          return resultMap["company"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "company")
        }
      }

      /// The user's publicly visible profile email.
      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      /// The user's public profile location.
      public var location: String? {
        get {
          return resultMap["location"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location")
        }
      }

      /// A list of repositories that the user owns.
      public var repositories: Repository {
        get {
          return Repository(unsafeResultMap: resultMap["repositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "repositories")
        }
      }

      public struct Status: GraphQLSelectionSet {
        public static let possibleTypes = ["UserStatus"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("emoji", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(emoji: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserStatus", "emoji": emoji, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An emoji summarizing the user's status.
        public var emoji: String? {
          get {
            return resultMap["emoji"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "emoji")
          }
        }

        /// A brief message describing what the user is doing.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }

      public struct Repository: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(totalCount: Int) {
          self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "totalCount": totalCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }
      }
    }
  }
}

public struct RepositoryCellFragment: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment RepositoryCellFragment on Repository {\n  __typename\n  owner {\n    __typename\n    login\n  }\n  name\n  primaryLanguage {\n    __typename\n    name\n    color\n  }\n  stargazers {\n    __typename\n    totalCount\n  }\n  viewerHasStarred\n}"

  public static let possibleTypes = ["Repository"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
    GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
    GraphQLField("viewerHasStarred", type: .nonNull(.scalar(Bool.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(owner: Owner, name: String, primaryLanguage: PrimaryLanguage? = nil, stargazers: Stargazer, viewerHasStarred: Bool) {
    self.init(unsafeResultMap: ["__typename": "Repository", "owner": owner.resultMap, "name": name, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> ResultMap in value.resultMap }, "stargazers": stargazers.resultMap, "viewerHasStarred": viewerHasStarred])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The User owner of the repository.
  public var owner: Owner {
    get {
      return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "owner")
    }
  }

  /// The name of the repository.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The primary language of the repository's code.
  public var primaryLanguage: PrimaryLanguage? {
    get {
      return (resultMap["primaryLanguage"] as? ResultMap).flatMap { PrimaryLanguage(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "primaryLanguage")
    }
  }

  /// A list of users who have starred this starrable.
  public var stargazers: Stargazer {
    get {
      return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
    }
  }

  /// Returns a boolean indicating whether the viewing user has starred this starrable.
  public var viewerHasStarred: Bool {
    get {
      return resultMap["viewerHasStarred"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "viewerHasStarred")
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes = ["Organization", "User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("login", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public static func makeOrganization(login: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "Organization", "login": login])
    }

    public static func makeUser(login: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "User", "login": login])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The username used to login.
    public var login: String {
      get {
        return resultMap["login"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "login")
      }
    }
  }

  public struct PrimaryLanguage: GraphQLSelectionSet {
    public static let possibleTypes = ["Language"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("color", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String, color: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Language", "name": name, "color": color])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The name of the current language.
    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    /// The color defined for the current language.
    public var color: String? {
      get {
        return resultMap["color"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "color")
      }
    }
  }

  public struct Stargazer: GraphQLSelectionSet {
    public static let possibleTypes = ["StargazerConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }
}