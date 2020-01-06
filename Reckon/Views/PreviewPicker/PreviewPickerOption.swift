//
//  PreviewPickerOption.swift
//  Reckon
//
//  Created by Conor Wilson on 1/5/20.
//  Copyright © 2020 Conor Wilson. All rights reserved.
//

import SwiftUI

struct PreviewPickerOption: View {
    @Binding var selected: String
    let content: PreviewPickerOptionContent

    init(selected: Binding<String>, content: PreviewPickerOptionContent) {
        self._selected = selected
        self.content = content
    }

    var body: some View {
        ZStack {
            content.preview
            if selected == content.key {
                Image(systemName: "checkmark.circle.fill")
                    .renderingMode(.original)
                    .font(Font.title.weight(.semibold))
                    .colorInvert()
                    .offset(x: 0, y: -10)
                    .shadow(radius: 5)
            }
        }.onTapGesture {
            self.selected = self.content.key
        }
    }
}

struct PreviewPickerOption_Previews: PreviewProvider {
    static var previews: some View {
        let theme = PurpleTheme()
        return PreviewPickerOption(selected: .constant(theme.name),
                                   content: PreviewPickerOptionContent(key: theme.name, preview: theme.preview))
    }
}

class PreviewPickerOptionContent {
    let key: String
    let preview: Preview

    init(key: String, preview: Preview) {
        self.key = key
        self.preview = preview
    }
}

protocol PreviewPickerOptionContentProvider {
    var key: String { get }
    var preview: Preview { get }
}
