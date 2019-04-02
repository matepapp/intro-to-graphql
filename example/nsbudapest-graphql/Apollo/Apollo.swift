//
//  Apollo.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 04. 02..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import Apollo

final class Apollo {
    private enum Constant {
        static let accessToken = "9da5fa3ff8ee2ee19dbf254e7096e955b9507871"
        static let url = URL(string: "https://api.github.com/graphql")!
        static var configuration: URLSessionConfiguration {
            let config = URLSessionConfiguration.default
            config.httpAdditionalHeaders = ["Authorization": "Bearer \(Constant.accessToken)"]
            return config
        }
    }
    private static let url = Constant.url
    private static var configuration = Constant.configuration

    static let client = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))

    private init() {}
}
