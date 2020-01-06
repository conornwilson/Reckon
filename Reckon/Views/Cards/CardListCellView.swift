//
//  CardListCellView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct CardListCellView: View {
    @Binding var theme: Theme
    @Binding var sequence: Sequence
    let currentIndex: Int
    var onTapAction: ((Int) -> Void)?

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(self.theme.colorAtIndex(self.currentIndex))
                    .frame(width: geometry.size.width, height: Constants.cardCellHeight)
                .cornerRadius(10, antialiased: true)
                .gesture(TapGesture()
                    .onEnded { _ in
                        self.onTapAction?(self.currentIndex)
                    }
                )
                Text(self.sequence.values[self.currentIndex])
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.white)
                    .shadow(radius: 1)
            }
        }
    }
}

struct CardListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardListCellView(theme: .constant(PastelTheme()), sequence: .constant(StandardSequence()), currentIndex: 0)
    }
}
