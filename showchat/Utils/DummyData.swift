//
//  DummyData.swift
//  showchat
//
//  Created by Belle Hu on 3/30/24.
//

import Foundation

/// Dummy data for the app's model objects.
struct DummyData {

    /// Dummy data for User objects.
    static var followerList: [User] = [
        User(image: Constants.Images.userpicKathryn, name: Constants.PeopleNames.kathryn),
        User(image: Constants.Images.userpicKristin, name: Constants.PeopleNames.kristin),
        User(image: Constants.Images.userpicLeslie, name: Constants.PeopleNames.leslie),
        User(image: Constants.Images.userpicEleanor, name: Constants.PeopleNames.eleanor),
        User(image: Constants.Images.userpicAnnette, name: Constants.PeopleNames.annette)
    ]

    /// Dummy data for Room objects.
    static var roomsList: [User] = [
        User(image: Constants.Images.roomLaCrew, name: Constants.RoomNames.laCrew),
        User(image: Constants.Images.roomNyGirls, name: Constants.RoomNames.nyGirls)
    ]

    /// Dummy data for all user's watched list.
    static var allWatchedShows: [Poster] = [
        Poster(image: Constants.Images.posterShameless, user: roomsList[0]),
        Poster(image: Constants.Images.posterSupernatural, user: roomsList[0]),
        Poster(image: Constants.Images.posterFriends, user: roomsList[0]),
        Poster(image: Constants.Images.posterDrWho, user: roomsList[0]),
        Poster(image: Constants.Images.posterShameless, user: roomsList[1]),
        Poster(image: Constants.Images.posterSupernatural, user: roomsList[1]),
        Poster(image: Constants.Images.posterFriends, user: roomsList[1]),
        Poster(image: Constants.Images.posterDrWho, user: roomsList[1]),
        Poster(image: Constants.Images.watchedLoveIsland, user: followerList[0]),
        Poster(image: Constants.Images.watchedLoveIsBlind, user: followerList[0]),
        Poster(image: Constants.Images.watchedBeef, user: followerList[0]),
        Poster(image: Constants.Images.watchedSuits, user: followerList[0]),
        Poster(image: Constants.Images.watchedAllTheLight, user: followerList[0]),
        Poster(image: Constants.Images.watchedQueerEye, user: followerList[0]),
        Poster(image: Constants.Images.watchedIndianMatchMake, user: followerList[1]),
        Poster(image: Constants.Images.watchedQueerEye, user: followerList[1]),
        Poster(image: Constants.Images.watchedBritishBakeoff, user: followerList[1]),
        Poster(image: Constants.Images.watchedSellingSunset, user: followerList[1]),
        Poster(image: Constants.Images.watchedSuits, user: followerList[1]),
        Poster(image: Constants.Images.watchedAllTheLight, user: followerList[2]),
        Poster(image: Constants.Images.watchedLoveIsBlind, user: followerList[2]),
        Poster(image: Constants.Images.watchedTheCircle, user: followerList[2]),
        Poster(image: Constants.Images.watchedBeef, user: followerList[2]),
        Poster(image: Constants.Images.watchedSellingSunset, user: followerList[2]),
        Poster(image: Constants.Images.watchedIndianMatchMake, user: followerList[2]),
        Poster(image: Constants.Images.watchedLoveIsland, user: followerList[3]),
        Poster(image: Constants.Images.watchedLoveIsBlind, user: followerList[3]),
        Poster(image: Constants.Images.watchedBeef, user: followerList[3]),
        Poster(image: Constants.Images.watchedBritishBakeoff, user: followerList[3]),
        Poster(image: Constants.Images.watchedBeef, user: followerList[4]),
        Poster(image: Constants.Images.watchedTheCircle, user: followerList[4]),
        Poster(image: Constants.Images.watchedBritishBakeoff, user: followerList[4]),
        Poster(image: Constants.Images.watchedAllTheLight, user: followerList[4])
    ]

}
