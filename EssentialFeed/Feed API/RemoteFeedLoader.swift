//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by aseem kapoor on 08/08/22.
//

import Foundation

public final class RemoteFeedLoader {
    private let url: URL
    private let httpClient: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }
    
    public init(url: URL, client: HTTPClient) {
        self.httpClient = client
        self.url = url
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        httpClient.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let data, let response):
                completion(FeedItemsMapper.map(data, from: response))
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}
