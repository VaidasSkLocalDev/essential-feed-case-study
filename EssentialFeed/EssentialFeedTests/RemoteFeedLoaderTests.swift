//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Vaidas Skardzius on 2023-12-24.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_requestsDataFromUrl() {
        let url =  URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        
        XCTAssertEqual(client.requestedUrl, url)
    }
    
    func test_load_requestsDataFromUrlTwice() {
        let url =  URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        sut.load()
        
        XCTAssertEqual(client.requestedUrls, [url, url])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut: sut, client: client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedUrl: URL?
        var requestedUrls = [URL]()
        
        func get(from url: URL) {
            requestedUrl = url
            requestedUrls.append(url)
        }
    }
}
