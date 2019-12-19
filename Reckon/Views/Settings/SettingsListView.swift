//
//  SettingsListView.swift
//  Reckon
//
//  Created by Conor Wilson on 12/15/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import SwiftUI

struct SettingsListView: View {
    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .bold()
                .padding([.horizontal])
            List(0..<6) { _ in
                SettingsRowView()
            }
            .colorMultiply(Color(UIColor.secondarySystemBackground))
        }
    }
}

struct SettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsListView(title: "Settings")
    }
}
