//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Vaidas Skardzius on 2023-12-24.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load()  {
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    
    var requestedUrl: URL?
    
    func get(from url: URL) {
        requestedUrl = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_RequestDataFromUrl() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedUrl)
    }
}
