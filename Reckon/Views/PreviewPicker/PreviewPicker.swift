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
    let providers: [PreviewPickerOptionContentProvider]

    public init(selection: Binding<String>, title: String, providers: [PreviewPickerOptionContentProvider]) {
        self._selection = selection
        self.title = title
        self.providers = providers
    }

    public var body: some View {
        return VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .bold()
                .padding([.horizontal])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(providers.indices) { index in
                        PreviewPickerOption(selected: self.$selection,
                                            content: PreviewPickerOptionContent(key: self.providers[index].key, preview: self.providers[index].preview))
                    }
                }
                .padding([.horizontal])
            }
        }
    }
}

struct ThumbPicker_Previews: PreviewProvider {
    static var previews: some View {
        PreviewPicker(selection: .constant(ImperialTheme().name), title: "Select Theme", providers: [
            ImperialTheme(),
            PastelTheme(),
            FireTheme()
        ])
    }
}
