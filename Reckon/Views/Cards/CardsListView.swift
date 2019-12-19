//
//  CardsListView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct CardsListView: View {
    @Binding var sequence: Sequence

    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(sequence.values.paired(), id: \.self) { valuePair in
                HStack {
                    CardListCellView(value: valuePair.first ?? "")
                        .frame(height: Constants.cardHeight)
                    if valuePair.count > 1 {
                        CardListCellView(value: valuePair.last ?? "")
                            .frame(height: Constants.cardHeight)
                    } else {
                        Spacer()
                            .frame(height: Constants.cardHeight)
                    }
                }
            }
            Spacer()
                .frame(height: Constants.cardHeight)
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView(sequence: .constant(StandardSequence()))
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
