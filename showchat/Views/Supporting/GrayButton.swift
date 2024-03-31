//
//  GrayButton.swift
//  showchat
//
//  Created by Belle Hu on 3/31/24.
//

import SwiftUI

struct GrayButton: View {

    // MARK: - Properties

    private var text: String

    // MARK: - Initializer
    
    init(text: String) {
        self.text = text
    }

    // MARK: - UI

    var body: some View {
        Text(text)
            .font(Constants.Fonts.smallButton)
            .foregroundColor(Constants.Colors.gray01)
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Constants.Colors.gray02)
                    .stroke(Constants.Colors.gray03, lineWidth: 1)
                    .frame(width: 115, height: 40)
            )
    }

}

#Preview {
    GrayButton(text: "Placeholder")
}
