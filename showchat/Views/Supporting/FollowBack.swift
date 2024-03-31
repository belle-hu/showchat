//
//  FollowBack.swift
//  showchat
//
//  Created by Belle Hu on 3/30/24.
//

import SwiftUI

struct FollowBack: View {

    // MARK: - UI

    var body: some View {
        Text("Follow Back")
            .font(Constants.Fonts.smallButton)
            .foregroundColor(Constants.Colors.orange)
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(
                        LinearGradient( 
                            gradient: Gradient(colors: [
                                Constants.Colors.orGrdLeft,
                                Constants.Colors.orGrdMiddle,
                                Constants.Colors.orGrdRight
                            ]),
                            startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                            endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/
                        ),
                        lineWidth: 1
                    )
                    .frame(width: 116, height: 40)
            )
    }
    
}

#Preview {
    FollowBack()
}
