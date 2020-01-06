//
//  FibonacciSequence.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation

struct FibonacciSequence: Sequence {
    var name: String = "Fibonacci"

    var values: [String] = [
        "0",
        "1",
        "2",
        "3",
        "5",
        "8",
        "13",
        "21",
        "34",
        "55",
        "89",
        "∞",
        "?"
    ]
}

extension FibonacciSequence: PreviewPickerOptionContentProvider {
    var key: String {
        return name
    }

    var preview: Preview {
        return Preview(sequence: self)
    }
}
