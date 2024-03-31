//
//  FollowersView.swift
//  showchat
//
//  Created by Belle Hu on 3/30/24.
//

import SwiftUI

struct FollowersView: View {

    // MARK: - Properties

    @State private var searchWord: String = ""
    @State private var searchIconHidden: Bool = false
    @State private var removeIconHidden: Bool = false
    @State private var followStates: [Bool] = Array(repeating: false, count: DummyData.followerList.count)
    @State private var isExpandedStatesRooms: [Bool] = Array(repeating: false, count: DummyData.roomsList.count)
    @State private var isExpandedStatesUsers: [Bool] = Array(repeating: false, count: DummyData.followerList.count)
    @State private var showingDeleteRoom: Bool = false
    @State private var showingRemoveUser: Bool = false
    @State private var currentUser: User? = nil

    // MARK: - UI

    var body: some View {
        ZStack {
            mainFollowersView
            VStack {
                Spacer()

                Button {
                    // Create a new room
                } label: {
                    BigOrangeButton(text: "Create a room")
                }
                .padding(.bottom, 292)
            }
        }
    }

    private var mainFollowersView: some View {
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
                    Section {
                        ForEach(DummyData.roomsList.indices, id: \.self) { index in
                            roomInfoRow(DummyData.roomsList[index], isExpandedState: $isExpandedStatesRooms[index])
                        }
                    }

                    Section {
                        ForEach(DummyData.followerList.indices, id: \.self) { index in
                            userInfoRow(DummyData.followerList[index], followState: $followStates[index],
                                        isExpandedState: $isExpandedStatesUsers[index],
                                        atIndex: index
                            )
                        }
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

    private func horizontalScrollView(_ posterList: [Poster]) -> some View{
        ScrollView(.horizontal){
            HStack (spacing: 20){
                ForEach(posterList, id: \.self){
                    poster in posterCellView(poster)
                        .frame(width: 66, height: 104)
                }
            }
        }
    }

    private func posterCellView(_ poster: Poster) -> some View {
        Image(poster.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 66, height: 104)
    }

    private func roomInfoRow(_ room: User, isExpandedState: Binding<Bool>) -> some View {
        VStack {
            HStack{
                HStack{
                    Image(room.image)
                        .frame(width: 48, height: 48)

                    Spacer()
                        .frame(width: 8)

                    VStack(alignment: .leading) {
                        Text(room.name)
                            .font(Constants.Fonts.roomName)
                            .foregroundColor(.white)

                        if (isExpandedState.wrappedValue) {
                            Text("Hide watched shows")
                                .font(Constants.Fonts.labelMedium)
                                .foregroundColor(Constants.Colors.gray01)
                                .onTapGesture {
                                    isExpandedState.wrappedValue.toggle()
                                }
                        } else {
                            Text("Show watched shows")
                                .font(Constants.Fonts.labelMedium)
                                .foregroundColor(Constants.Colors.gray01)
                                .onTapGesture {
                                    isExpandedState.wrappedValue.toggle()
                                }
                        }
                    }
                }

                Spacer()

                if isExpandedState.wrappedValue {
                    Button {
                        showingDeleteRoom.toggle()
                    } label: {
                        GrayButton(text: "Delete room")
                    }
                    .sheet(isPresented: $showingDeleteRoom) {
                        deleteRoomModal(room)
                            .presentationDetents([.fraction(0.5)])
                            .presentationDragIndicator(.visible)
                    }
                } else {
                    GrayButton(text: "Leave room")
                }
            }

            if isExpandedState.wrappedValue {
                horizontalScrollView(DummyData.allWatchedShows.filter({ $0.user == room }))
            }
        }
        .listRowBackground(Constants.Colors.black1)
    }

    private func deleteRoomModal(_ room: User) -> some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Are you sure?")
                .font(Constants.Fonts.h3)
                .foregroundColor(.white)

            Text("Deleting a room removes \n everyone from it")
                .font(Constants.Fonts.bodyRegular)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

            Spacer()
                .frame(height: 20)

            Button {
                if let index = DummyData.roomsList.firstIndex(where: { $0.id == room.id }) {
                    DummyData.roomsList.remove(at: index)
                    isExpandedStatesRooms.remove(at: index)
                } else {
                    print("Room not found in list")
                }
                showingDeleteRoom.toggle()
            } label: {
                BigOrangeButton(text: "Yes, delete")
            }

            Spacer()
                .frame(height: 20)

            Button {
                showingDeleteRoom = false
            } label: {
                GoBackButton()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Constants.Colors.black2.edgesIgnoringSafeArea(.all))
    }

    private func removeFollowerModal() -> some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Are you sure?")
                .font(Constants.Fonts.h3)
                .foregroundColor(.white)

            Text("Once you remove a follower, they \n will need to request to follow again")
                .font(Constants.Fonts.bodyRegular)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

            Spacer()
                .frame(height: 20)

            Button {
                if let indexToDelete = DummyData.followerList.firstIndex(where: { $0.id == currentUser?.id }) {
                    DummyData.followerList.remove(at: indexToDelete)
                    followStates.remove(at: indexToDelete)
                    isExpandedStatesUsers.remove(at: indexToDelete)
                    showingRemoveUser.toggle()
                } else {
                    print("User not found in list")
                }
            } label: {
                BigOrangeButton(text: "Yes, remove")
            }

            Spacer()
                .frame(height: 20)

            Button {
                showingRemoveUser = false

            } label: {
                GoBackButton()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Constants.Colors.black2.edgesIgnoringSafeArea(.all))
    }

    private func userInfoRow(_ user: User, followState: Binding<Bool>, isExpandedState: Binding<Bool>, atIndex index: Int) -> some View {
        VStack {
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

                        if (isExpandedState.wrappedValue) {
                            Text("Hide watched shows")
                                .font(Constants.Fonts.labelMedium)
                                .foregroundColor(Constants.Colors.gray01)
                                .onTapGesture {
                                    isExpandedState.wrappedValue.toggle()
                                }
                        } else {
                            Text("Show watched shows")
                                .font(Constants.Fonts.labelMedium)
                                .foregroundColor(Constants.Colors.gray01)
                                .onTapGesture {
                                    isExpandedState.wrappedValue.toggle()
                                }
                        }
                    }
                }

                Spacer()

                Button {
                    followState.wrappedValue.toggle()
                } label: {
                    if followState.wrappedValue {
                        GrayButton(text: "Following")
                    } else {
                        FollowBack()
                    }
                }
            }
            .swipeActions(allowsFullSwipe: false) {
                Button {
                    showingRemoveUser.toggle()

                    // Update current user being considered for blocking/removal
                    currentUser = user
                } label: {
                    Image(Constants.Images.iconBlock)
                        .frame(width: 20, height: 20)
                }
                .tint(Color.black)
            }
            .sheet(isPresented: $showingRemoveUser) {
                removeFollowerModal()
                    .presentationDetents([.fraction(0.5)])
                    .presentationDragIndicator(.visible)
            }

            if isExpandedState.wrappedValue {
                horizontalScrollView(DummyData.allWatchedShows.filter( {$0.user == user} ))
            }
        }
        .listRowBackground(Constants.Colors.black1)
    }

}

#Preview {
    FollowersView()
}
