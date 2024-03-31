//
//  GoBackButton.swift
//  showchat
//
//  Created by Belle Hu on 3/30/24.
//

import SwiftUI

struct GoBackButton: View {

    // MARK: - UI
    
    var body: some View {
        Text("No, go back")
            .font(Constants.Fonts.largeButton)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Constants.Colors.gray02)
                    .frame(width: 365, height: 64)
            )
    }
    
}

#Preview {
    GoBackButton()
}
