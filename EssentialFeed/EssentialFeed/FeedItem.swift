//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Vaidas Skardzius on 2023-12-23.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import Foundation

struct FeedItem {
    let id: UUID
    let description: String?
    let location: String?
    let imageUrl: URL
}
