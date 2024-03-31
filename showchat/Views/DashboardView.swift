//
//  DashboardView.swift
//  showchat
//
//  Created by Belle Hu on 3/30/24.
//

import SwiftUI

struct DashboardView: View {

    // MARK: - UI
    
    var body: some View {
        HStack(spacing: 35) {
            Image(Constants.Images.userpicCat)
            dashboardBody
        }
    }

    private var dashboardBody: some View {
        VStack(alignment: .leading, spacing: 10) {
            topLine
            allStats
        }
    }

    private var topLine: some View {
        HStack{
            Text(Constants.PeopleNames.cat)
                .font(Constants.Fonts.h0)
                .foregroundColor(.white)

            Spacer()
                .frame(width: 17)

            Image(Constants.Images.iconEdit)
                .frame(width: 40, height: 40)

            Image(Constants.Images.iconThreeDots)
                .frame(width: 40, height: 40)
        }
    }

    private var allStats: some View {
        HStack(spacing: 25) {
            showchatStats
            followerStats
            followingStats
        }
    }

    private var showchatStats: some View {
        VStack(alignment: .leading){
            Text("1323")
                .font(Constants.Fonts.largeButton)
                .foregroundColor(Constants.Colors.white)

            Text("Showchats")
                .font(Constants.Fonts.labelMedium)
                .foregroundColor(Constants.Colors.gray01)
        }
    }

    private var followerStats: some View {
        VStack(alignment: .leading){
            Text("113")
                .font(Constants.Fonts.largeButton)
                .foregroundColor(Constants.Colors.white)

            Text("Followers")
                .font(Constants.Fonts.labelMedium)
                .foregroundColor(Constants.Colors.gray01)
        }
    }

    private var followingStats: some View {
        VStack(alignment: .leading){
            Text("59")
                .font(Constants.Fonts.largeButton)
                .foregroundColor(Constants.Colors.white)

            Text("Following")
                .font(Constants.Fonts.labelMedium)
                .foregroundColor(Constants.Colors.gray01)
        }
    }

}

#Preview {
    DashboardView()
}
