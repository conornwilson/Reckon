//
//  CardView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/18/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Pages
import SwiftUI

struct CardView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @Binding var theme: Theme
    @Binding var sequence: Sequence
    @Binding var currentIndex: Int

    private var pageControl: UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = sequence.values.count
        control.pageIndicatorTintColor = .lightGray
        control.currentPageIndicatorTintColor = .darkGray
        return control
    }

    var body: some View {
        NavigationView {
            ModelPages(sequence.values,
                       currentPage: $currentIndex,
                       control: self.pageControl) { index, value in
                        GeometryReader { geometry in
                            VStack {
                                ZStack {
                                    Rectangle()
                                        .fill(self.theme.colorAtIndex(index))
                                        .frame(width: (geometry.size.width * Constants.cardWidthRatio),
                                               height:(geometry.size.height * Constants.cardHeightRatio))
                                        .cornerRadius(10, antialiased: true)
                                    Text(value)
                                        .font(.system(size: 120))
                                        .bold()
                                        .foregroundColor(Color.white)
                                        .shadow(radius: 1)
                                }
                                Spacer()
                                    .frame(height: Constants.cardCellHeight)
                            }
                        }
            }
            .navigationBarItems(trailing:
                Button(action: {
                  self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                    .renderingMode(.original)
                    .font(Font.title.weight(.semibold))
            })
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(theme: .constant(PastelTheme()), sequence: .constant(StandardSequence()), currentIndex: .constant(0))
    }
}
