//
//  ContentView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    private let sequenceName: String = UserDefaults.standard.string(forKey: "sequenceName") ?? StandardSequence().name

    @State private var bottomSheetShown = false
    @State private var sequence: Sequence = SequenceHelper.sequenceForName(
        UserDefaults.standard.string(forKey: "sequenceName") ?? StandardSequence().name
    )

    var body: some View {
        GeometryReader { geometry in
            CardsListView(sequence: self.$sequence)
                .padding()
            SettingsSheetView(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.65,
                sequence: self.$sequence
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
