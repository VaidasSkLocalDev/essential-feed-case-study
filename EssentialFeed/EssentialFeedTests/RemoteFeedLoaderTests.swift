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
        
        XCTAssertTrue(client.requestedUrls.isEmpty)
    }
    
    func test_load_requestsDataFromUrl() {
        let url =  URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        
        XCTAssertEqual(client.requestedUrls, [url])
    }
    
    func test_load_requestsDataFromUrlTwice() {
        let url =  URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        sut.load()
        
        XCTAssertEqual(client.requestedUrls, [url, url])
    }
    
    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        
        client.error = NSError(domain: "Test", code: 0)
        var capturedError: RemoteFeedLoader.Error?
        sut.load { error in capturedError = error }
        
        XCTAssertEqual(capturedError, .connectivity)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut: sut, client: client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedUrls = [URL]()
        var error: Error?
        
        func get(from url: URL, completion: @escaping (Error) -> Void) {
            if let error {
                completion(error)
            }
            requestedUrls.append(url)
        }
    }
}
