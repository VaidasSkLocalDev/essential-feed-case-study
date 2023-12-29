//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vaidas Skardzius on 2023-12-23.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    associatedtype Error: Swift.Error
    
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
