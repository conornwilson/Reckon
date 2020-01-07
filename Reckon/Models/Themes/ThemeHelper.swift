//
//  ThemeHelper.swift
//  Reckon
//
//  Created by Conor Wilson on 12/23/19.
//  Copyright © 2019 Conor Wilson. All rights reserved.
//

import Foundation

struct ThemeHelper {
    public static let themes: [Theme] = [
        PastelTheme(),
        ImperialTheme(),
        FireTheme(),
        FrogTheme(),
        OceanTheme()
    ]

    public static func themeForName(_ name: String) -> Theme {
        return themes.first(where: { name == $0.name }) ?? themes[0]
    }
}
