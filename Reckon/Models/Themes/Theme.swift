//
//  Theme.swift
//  Reckon
//
//  Created by Conor Wilson on 12/23/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation
import SwiftUI

protocol Theme {
    var name: String { get }
    func colorAtIndex(_ index: Int) -> Color
}
