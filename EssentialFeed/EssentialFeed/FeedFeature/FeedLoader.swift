//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vaidas Skardzius on 2023-12-23.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
