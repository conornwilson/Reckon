//
//  PreviewPicker.swift
//  Reckon
//
//  Created by Conor Wilson on 1/5/20.
//  Copyright © 2020 Conor Wilson. All rights reserved.
//

import SwiftUI

struct PreviewPicker: View {
    @Binding var selection: String
    let title: String
    let content: [PreviewPickerOption]

    public init(selection: Binding<String>, title: String) {
        self._selection = selection
        self.title = title
    }

    public var body: some View {
        return VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .bold()
                .padding([.horizontal])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    PreviewPickerOption<PurpleTheme>(selected: self.$selection, content: PurpleTheme())
                    PreviewPickerOption<PurpleTheme>(selected: self.$selection, content: PurpleTheme())
                    PreviewPickerOption<PurpleTheme>(selected: self.$selection, content: PurpleTheme())
                    PreviewPickerOption<PurpleTheme>(selected: self.$selection, content: PurpleTheme())
                    PreviewPickerOption<PurpleTheme>(selected: self.$selection, content: PurpleTheme())
                    PreviewPickerOption<PurpleTheme>(selected: self.$selection, content: PurpleTheme())
                    PreviewPickerOption<PurpleTheme>(selected: self.$selection, content: PurpleTheme())
                }
                .padding([.horizontal])
            }
        }
    }
}

struct ThumbPicker_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPicker(selection: .constant(PurpleTheme().name), title: "Select Theme")
    }
}
