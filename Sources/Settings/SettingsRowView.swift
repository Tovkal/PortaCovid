//
//  SettingsRowView.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 6/12/21.
//

import SwiftUI

enum SettingsRowType {
    case `default`, destructive
}

struct SettingsRowView: View {
    let title: String
    let type: SettingsRowType
    let buttonAction: () -> Void

    init(title: String, type: SettingsRowType = .default, buttonAction: @escaping () -> Void) {
        self.title = title
        self.type = type
        self.buttonAction = buttonAction
    }

    var body: some View {
        Button(action: {
            buttonAction()
        }) {
            HStack(spacing: 15) {
                Text(title.localized)
                    .foregroundColor(textColor)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.gray)
            }
        }
    }

    var textColor: Color {
        switch type {
        case .default:
            return Color.black
        case .destructive:
            return Color.red
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(title: "Sample", buttonAction: {} )
    }
}
