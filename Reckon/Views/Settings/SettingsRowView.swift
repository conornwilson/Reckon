//
//  SettingsRowView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct SettingsRowView: View {
    let options: [PreviewPickerOptionContentProvider]
    @Binding var selected: String
    let name: String

    var body: some View {
        Section {
            PreviewPicker(selection: $selected, title: name, providers: options)
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(
            options: [
                ImperialTheme(),
                PastelTheme(),
                FireTheme()
            ],
            selected: .constant(ThemeHelper.themes[0].name),
            name: "Select Theme")
    }
}
