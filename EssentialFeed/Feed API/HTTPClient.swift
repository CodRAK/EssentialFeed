//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by aseem kapoor on 13/08/22.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
