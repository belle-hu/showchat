//
//  RoomsView.swift
//  showchat
//
//  Created by Belle Hu on 3/30/24.
//

import SwiftUI

struct RoomsView: View {
    // MARK: - Properties
    @State private var searchWord: String = ""
    @State private var searchIconHidden: Bool = false
    @State private var removeIconHidden: Bool = false
    @State private var isFollowBack: Bool = false
    @State private var followStates: [Bool] = Array(repeating: false, count: DummyData.followerList.count)

    // MARK: - UI
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                VStack(alignment: .leading) {
                    DashboardView()
                    Spacer()
                        .frame(height: 25)
                    Text("MY FOLLOWERS")
                        .font(Constants.Fonts.h1)
                        .foregroundColor(.white)
                    Spacer()
                        .frame(height: 15)
                    searchBar
                }
                .padding()
                List {
                    ForEach(DummyData.followerList.indices, id: \.self) { index in
                        userInfoRow(DummyData.followerList[index], followState: $followStates[index])
                    }
                }
                .listRowInsets(EdgeInsets())
                .listStyle(PlainListStyle())
            }
        }
        .background(Color.black.ignoresSafeArea())
    }

    private var searchBar: some View {
        TextField("", text: $searchWord)
            .font(Constants.Fonts.largeButton)
            .foregroundColor(.white)
            .padding()
            .background(
                Rectangle()
                    .fill(Constants.Colors.black2)
                    .stroke(Constants.Colors.gray03, lineWidth: 1)
                    .frame(width: UIScreen.main.bounds.size.width, height: 48)
            )
            .overlay(
                searchBarIcons
            )
    }

    private var searchBarIcons: some View {
        HStack{
            Button {
                searchIconHidden = true
            } label: {
                if !(searchIconHidden){
                    Image(Constants.Images.iconSearch)
                }
            }
            Spacer()
            Button {
                removeIconHidden = true
                searchWord = ""
            } label: {
                if !(removeIconHidden){
                    Image(Constants.Images.iconRemove)
                }
                else if (searchWord != ""){
                    Image(Constants.Images.iconRemove)
                }
            }
        }
    }

    private func userInfoRow(_ user: User, followState: Binding<Bool>) -> some View {
        HStack{
            HStack{
                Image(user.image)
                    .frame(width: 48, height: 48)
                Spacer()
                    .frame(width: 8)
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(Constants.Fonts.userName)
                        .foregroundColor(.white)
                    Text("Show watched shows")
                        .font(Constants.Fonts.labelMedium)
                        .foregroundColor(Constants.Colors.gray01)
                }
            }
            Spacer()
            Button {
                followState.wrappedValue.toggle()
            } label: {
                if followState.wrappedValue {
                    FollowingButton()
                } else {
                    FollowBack()
                }
            }
        }
        .listRowBackground(Constants.Colors.black1)
        .swipeActions(allowsFullSwipe: false) {
            Button {
                print("Blocking user")
            } label: {
                Image(Constants.Images.iconBlock)
                    .frame(width: 20, height: 20)
            }
            .tint(Color.black)
        }
    }

}

#Preview {
    RoomsView()
}

