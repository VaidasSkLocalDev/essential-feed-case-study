//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Vaidas Skardzius on 2023-12-24.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import XCTest

class RemoteFeedLoader {
    func load()  {
        HTTPClient.shared.requestedUrl =  URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private init() {
        
    }
    
    var requestedUrl: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_RequestDataFromUrl() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedUrl)
    }
}
