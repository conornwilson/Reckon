//
//  ContentView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var bottomSheetShown = false
    @State private var theme: Theme = ThemeHelper.themeForName(
        UserDefaults.standard.string(forKey: ThemeHelper.themeKey) ?? ImperialTheme().name
    ) {
        didSet {
            UserDefaults.standard.set(theme.name, forKey: ThemeHelper.themeKey)
        }
    }

    @State private var sequence: Sequence = SequenceHelper.sequenceForName(
        UserDefaults.standard.string(forKey: SequenceHelper.sequenceKey) ?? StandardSequence().name
    ) {
        didSet {
            UserDefaults.standard.set(sequence.name, forKey: SequenceHelper.sequenceKey)
        }
    }

    var body: some View {
        GeometryReader { geometry in
            CardsListView(theme: self.$theme, sequence: self.$sequence)
                .padding()
            SettingsSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.70,
                sequence: self.$sequence,
                theme: self.$theme
            )
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
