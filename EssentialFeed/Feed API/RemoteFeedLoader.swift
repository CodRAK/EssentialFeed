//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by aseem kapoor on 08/08/22.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let httpClient: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.httpClient = client
        self.url = url
    }
    
    public func load() {
        httpClient.get(from: url)
    }
}
