//
//  SequenceHelper.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation

struct SequenceHelper {

    public static let sequences: [Sequence] = [
        StandardSequence(),
        FibonacciSequence(),
        TShirtSequence()
    ]

    public static func sequenceForName(_ name: String) -> Sequence {
        return sequences.first(where: { name == $0.name }) ?? sequences[0]
    }
}
