//
//  BigOrangeButton.swift
//  showchat
//
//  Created by Belle Hu on 3/31/24.
//

import SwiftUI

struct BigOrangeButton: View {

    // MARK: - Properties

    private var text: String

    // MARK: - Initializer

    init(text: String) {
        self.text = text
    }

    // MARK: - UI

    var body: some View {
        Text(text)
            .font(Constants.Fonts.largeButton)
            .foregroundColor(Constants.Colors.black1)
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [Constants.Colors.orGrdLeft,
                                         Constants.Colors.orGrdMiddle,
                                         Constants.Colors.orGrdRight
                                        ]
                            ),
                            startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                            endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/
                        )
                    )
                    .frame(width: 365, height: 64)
            )
    }

}

#Preview {
    BigOrangeButton(text: "Placeholder")
}

