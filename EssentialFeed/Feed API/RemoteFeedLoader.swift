//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by aseem kapoor on 08/08/22.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (Error?, HTTPURLResponse?) -> Void)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let httpClient: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.httpClient = client
        self.url = url
    }
    
    public func load(completion: @escaping (Error) -> Void) {
        httpClient.get(from: url) { error, response in
            if response != nil {
                completion(.invalidData)
            } else {
                completion(.connectivity)
            }
        }
    }
}
