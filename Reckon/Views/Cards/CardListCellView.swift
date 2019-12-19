//
//  CardListCellView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct CardListCellView: View {
    let value: String

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width, height: Constants.cardHeight)
                .cornerRadius(10, antialiased: true)
                Text(self.value)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct CardListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardListCellView(value: "1")
    }
}
