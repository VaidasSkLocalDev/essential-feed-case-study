//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Vaidas Skardzius on 2023-12-28.
//  Copyright © 2023 Essential Developer. All rights reserved.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
