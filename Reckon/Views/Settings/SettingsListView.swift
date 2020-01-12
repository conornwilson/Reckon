//
//  SettingsListView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct SettingsListView: View {
    @Binding var selectedSequence: Sequence
    @Binding var selectedTheme: Theme
    @State var selectedSequenceName: String = ""
    @State var selectedThemeName: String = ""
    let isVisible: Bool

    var body: some View {

        let themeBinding = Binding<String>(
        get: { self.selectedThemeName },
        set: {
            self.selectedThemeName = $0
            self.selectedTheme = ThemeHelper.themeForName($0)
        })

        let sequenceBinding = Binding<String>(
        get: { self.selectedSequenceName },
        set: {
            self.selectedSequenceName = $0
            self.selectedSequence = SequenceHelper.sequenceForName($0)
        })

        return Form {
            SettingsRowView(options: ThemeHelper.themes.compactMap({ $0 as? PreviewPickerOptionContentProvider }), selected: themeBinding, name: "Select Theme")
                .listRowInsets(.init(top: Constants.previewRowVerticalInsets, leading: 0, bottom: Constants.previewRowVerticalInsets, trailing: 0))
            SettingsRowView(options: SequenceHelper.sequences.compactMap({ $0 as? PreviewPickerOptionContentProvider }), selected: sequenceBinding, name: "Select Sequence")
                .listRowInsets(.init(top: Constants.previewRowVerticalInsets, leading: 0, bottom: Constants.previewRowVerticalInsets, trailing: 0))

        }
        .opacity(isVisible ? 1 : 0)
        .onAppear {
            self.selectedThemeName = self.selectedTheme.name
            self.selectedSequenceName = self.selectedSequence.name
        }
    }

    init(selectedSequence: Binding<Sequence>, selectedTheme: Binding<Theme>, isVisible: Bool) {
        self._selectedSequence = selectedSequence
        self._selectedTheme = selectedTheme
        self.isVisible = isVisible
        UITableView.appearance().backgroundColor = .clear
    }
}

struct SettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsListView(selectedSequence: .constant(SequenceHelper.sequences[0]), selectedTheme: .constant(ThemeHelper.themes[0]), isVisible: true)
    }
}
