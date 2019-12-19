//
//  SequenceHelper.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation

struct SequenceHelper {
    public static func sequenceForName(_ name: String) -> Sequence {
        switch name {
        case FibonacciSequence().name:
            return FibonacciSequence()
        case TShirtSequence().name:
            return TShirtSequence()
        default:
            return StandardSequence()
        }
    }
}
