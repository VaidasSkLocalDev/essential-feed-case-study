//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Vaidas Skardzius on 2023-12-23.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import Foundation

public struct FeedItem: Equatable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageUrl: URL
    
    public init(id: UUID, description: String?, location: String?, imageUrl: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageUrl = imageUrl
    }
}
