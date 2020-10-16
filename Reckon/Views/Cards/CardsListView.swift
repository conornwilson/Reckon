//
//  CardsListView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct CardsListView: View {
    @Binding var theme: Theme
    @Binding var sequence: Sequence
    @State private var showModal: Bool = false
    @State private var selectedIndex: Int = 0

    private func indexForValue(_ value: String?) -> Int {
        guard let value = value, let index = sequence.values.firstIndex(of: value) else {
            return 0
        }
        return index
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(sequence.values.paired(), id: \.self) { valuePair in
                HStack {
                    CardListCellView(theme: self.$theme,
                                     sequence: self.$sequence,
                                     currentIndex: self.indexForValue(valuePair.first),
                                     onTapAction: { index in
                        self.showModal = true
                        self.selectedIndex = index
                    })
                        .frame(height: Constants.cardCellHeight)
                    if valuePair.count > 1 {
                        CardListCellView(theme: self.$theme,
                                         sequence: self.$sequence,
                                         currentIndex: self.indexForValue(valuePair.last),
                                         onTapAction: { index in
                            self.showModal = true
                            self.selectedIndex = index
                        })
                            .frame(height: Constants.cardCellHeight)
                    } else {
                        Spacer()
                            .frame(height: Constants.cardCellHeight)
                    }
                }
            }
            Spacer()
                .frame(height: Constants.cardCellHeight)
        }
        .sheet(isPresented: self.$showModal) {
            CardView(theme: self.$theme, sequence: self.$sequence, currentIndex: self.$selectedIndex)
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView(theme: .constant(PastelTheme()), sequence: .constant(StandardSequence()))
    }
}

extension Array {
    func paired() -> [[Element]] {
        if self.count <= 2 {
            return [self]
        } else {
            let head = [Array(self[0 ..< 2])]
            let tail = Array(self[2 ..< self.count])
            return head + tail.paired()
        }
    }
}
