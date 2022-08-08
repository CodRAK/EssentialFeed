//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by aseem kapoor on 06/08/22.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUI()
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_load_requestsDataFromURL() {
        let url = URL(string: "www.a-givenurl.com")!
        let (sut, client) = makeSUI(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    func test_loadTwice_requestsDataFromURLTwice() {
        let url = URL(string: "www.a-givenurl.com")!
        let (sut, client) = makeSUI(url: url)
        
        sut.load()
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    
    //MARK: - Helpers
    
    private func makeSUI(url: URL = URL(string: "www.a-url.com")!) -> (sut:RemoteFeedLoader, client: HTTPClientSPY) {
        let client = HTTPClientSPY()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut: sut, client: client)
    }
    
    private class HTTPClientSPY: HTTPClient {
        var requestedURLs = [URL]()
        
        func get(from url: URL) {
            requestedURLs.append(url)
        }
    }
}
