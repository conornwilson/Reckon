//
//  Sequence.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation

protocol Sequence {
    var name: String { get }
    var values: [String] { get }
}

extension Sequence {
    func titleAtIndex(_ index: Int) -> String {
        return values.indices.contains(index) ? values[index] : ""
    }
}
