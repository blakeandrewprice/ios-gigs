//
//  Gig.swift
//  Gigs
//
//  Created by Blake Andrew Price on 11/7/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import Foundation

struct Gig: Decodable {
    let title: String
    let description: String
    let dueDate: Date
}
