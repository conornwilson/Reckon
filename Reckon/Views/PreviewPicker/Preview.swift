//
//  Preview.swift
//  Reckon
//
//  Created by Conor Wilson on 1/5/20.
//  Copyright © 2020 Conor Wilson. All rights reserved.
//

import SwiftUI

enum PreviewType {
    case theme(Theme)
    case sequence(Sequence)

    func view() -> AnyView {
        switch self {
        case let .theme(theme):
            return AnyView(
                VStack(spacing: 3) {
                    Rectangle()
                        .fill(theme.colorAtIndex(0))
                        .frame(width: Constants.previewSize, height: Constants.previewSize)
                    Text(theme.name)
                        .font(.subheadline)
                }
            )
        case let .sequence(sequence):
            return AnyView(
                VStack {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: Constants.previewSize, height: Constants.previewSize)
                    Text(sequence.name)
                }
            )
        }
    }
}

struct Preview: View {
    var type: PreviewType

    init(theme: Theme) {
        self.type = .theme(theme)
    }

    init(sequence: Sequence) {
        self.type = .sequence(sequence)
    }

    var body: some View {
        type.view()
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview(theme: PurpleTheme())
    }
}
