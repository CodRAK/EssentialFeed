//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by aseem kapoor on 06/08/22.
//

import XCTest

class RemoteFeedLoader {
    let httpClient: HTTPClient
    
    init(client: HTTPClient) {
        self.httpClient = client
    }
    
    func load() {
        httpClient.get(from: URL(string: "www.a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSPY: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}


class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSPY()
        _ = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_loadDataFromRequest() {
        let client = HTTPClientSPY()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
