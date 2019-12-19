//
//  SettingsSheetView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct SettingsSheetView: View {

    @Binding var isOpen: Bool
    @Binding var sequence: Sequence
    @GestureState private var translation: CGFloat = 0

    let maxHeight: CGFloat
    let minHeight: CGFloat

    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    private var title: String {
        isOpen ? "Settings" : sequence.name
    }

    private var indicator: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.secondary)
            .frame(
                width: 50,
                height: 6
        )
        .gesture(
            TapGesture().onEnded {
                self.isOpen = !self.isOpen
            }
        )
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator.padding()
                SettingsListView(title: self.title)
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * 0.5
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.isOpen = value.translation.height < 0
                }
            )
        }
    }

    init(isOpen: Binding<Bool>, maxHeight: CGFloat, sequence: Binding<Sequence>) {
        self.minHeight = Constants.settingsSheetMinHeight
        self.maxHeight = maxHeight
        self._isOpen = isOpen
        self._sequence = sequence
    }
}

struct SettingsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSheetView(isOpen: .constant(false), maxHeight: 500, sequence: .constant(StandardSequence()))
            .edgesIgnoringSafeArea(.all)
    }
}
