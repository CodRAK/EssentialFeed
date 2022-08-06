//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by aseem kapoor on 06/08/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
