//
//  PreviewPickerOption.swift
//  Reckon
//
//  Created by Conor Wilson on 1/5/20.
//  Copyright © 2020 Conor Wilson. All rights reserved.
//

import SwiftUI

struct PreviewPickerOption<Content>: View where Content: PreviewPickerOptionContent {
    @Binding var selected: String
    let content: PreviewPickerOptionContent

    init(selected: Binding<String>, content: PreviewPickerOptionContent) {
        self._selected = selected
        self.content = content
    }

    var body: some View {
        ZStack {
            content.preview()
            if selected == content.key {
                Image(systemName: "checkmark.circle.fill")
                    .renderingMode(.original)
                    .font(Font.title.weight(.semibold))
                    .colorInvert()
                    .offset(x: 0, y: -10)
            }
        }.onTapGesture {
            self.selected = self.content.key
        }
    }
}

struct PreviewPickerOption_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPickerOption<PurpleTheme>(selected: .constant(PurpleTheme().name), content: PurpleTheme())
    }
}

protocol PreviewPickerOptionContent {
    var key: String { get }
    func preview() -> Preview
}
