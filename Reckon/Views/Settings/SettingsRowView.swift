//
//  SettingsRowView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct SettingsRowView: View {
    let options: [String]
    @Binding var selected: String
    let name: String

    var body: some View {
        Section {
            Picker(selection: $selected, label: Text(name)) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(options: ThemeHelper.themes.map({ $0.name }), selected: .constant(ThemeHelper.themes[0].name), name: "Select Theme")
    }
}
