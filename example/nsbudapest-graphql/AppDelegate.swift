//
//  AppDelegate.swift
//  nsbudapest-graphql
//
//  Created by Mate Papp on 2019. 03. 31..
//  Copyright © 2019. Mate Papp. All rights reserved.
//

import UIKit
import Apollo

let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = ["Authorization": "Bearer 01230fa8a22b868124f46ae4da07576de8632b98"]

    let url = URL(string: "https://api.github.com/graphql")!

    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

