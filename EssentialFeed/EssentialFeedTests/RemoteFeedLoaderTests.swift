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
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
        
    func get(from url: URL)  {
    }
}

class HTTPClientSpy: HTTPClient {
    
    var requestedUrl: URL?
    
    override func get(from url: URL) {
        requestedUrl = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared  = client
        
        let sut = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_RequestDataFromUrl() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedUrl)
    }
}
