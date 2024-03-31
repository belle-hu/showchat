//
//  Constants.swift
//  showchat
//
//  Created by Belle Hu on 3/29/24.
//

import SwiftUI

/// Constants used in Showhat Profile design system such as colors, fonts, etc.
struct Constants {

    /// Colors used in Profile design system.
    enum Colors {

        // Primary
        static let black1 = Color(red: 17/255, green: 18/255, blue: 20/255)
        static let black2 = Color(red: 39/255, green: 40/255, blue: 42/255)
        static let white = Color(red: 229/255, green: 229/255, blue: 229/255)

        // Accent
        static let orange = Color(red: 255/255, green: 136/255, blue: 27/255)
        static let orGrdLeft = Color(red: 255/255, green: 200/255, blue: 55/255)
        static let orGrdMiddle = Color(red: 255/255, green: 174/255, blue: 38/255)
        static let orGrdRight = Color(red: 255/255, green: 128/255, blue: 8/255)
        // Gray
        static let gray01 = Color(red: 159/255, green: 159/255, blue: 160/255)
        static let gray02 = Color(red: 22/255, green: 33/255, blue: 37/255)
        static let gray03 = Color(red: 45/255, green: 45/255, blue: 45/255)
    }

    /// Follower names.
    enum PeopleNames {
        static let annette = "Annette Black"
        static let cat = "ShowchatCat"
        static let eleanor = "Eleanor Pena"
        static let kathryn = "Kathryn Murphy"
        static let kristin = "Kristin Watson"
        static let leslie = "Leslie Alexander"
    }

    /// Room names.
    enum RoomNames {
        static let laCrew = "Room LAcrew"
        static let nyGirls = "Room NYgirls"
    }

    /// Fonts used.
    enum Fonts {
        // Headers
        static let h0 = Font.custom("Montserrat-Bold", size: 20)
        static let h1 = Font.custom("Montserrat-Medium", size: 19)
        static let h3 = Font.custom("Montserrat-Bold", size: 32)

        // Body
        static let bodyRegular = Font.custom("Montserrat-Regular", size: 16)
        static let roomName = Font.custom("Montserrat-Bold", size: 16)
        static let userName = Font.custom("Montserrat-Bold", size: 16)

        // Labels
        static let labelMedium = Font.custom("Montserrat-Medium", size: 12)
        static let smallButton = Font.custom("Montserrat-Medium", size: 14)
        static let largeButton = Font.custom("Montserrat-Medium", size: 16)
    }

    /// Image components.
    enum Images {
        static let iconBlock = "icon_block"
        static let iconEdit = "icon_edit"
        static let iconRemove = "icon_remove"
        static let iconSearch = "icon_search"
        static let iconThreeDots = "icon_three_dots"
        static let posterDrWho = "poster_dr_who"
        static let posterFriends = "poster_friends"
        static let posterShameless = "poster_shameless"
        static let posterSupernatural = "poster_supernatural"
        static let roomLaCrew = "room_la_crew"
        static let roomNyGirls = "room_ny_girls"
        static let userpicAnnette = "userpic_annette"
        static let userpicCat = "userpic_cat"
        static let userpicEleanor = "userpic_eleanor"
        static let userpicKathryn = "userpic_kathryn"
        static let userpicKristin = "userpic_kristin"
        static let userpicLeslie = "userpic_leslie"
        static let watchedAllTheLight = "watched_all_the_light"
        static let watchedBeef = "watched_beef"
        static let watchedBritishBakeoff = "watched_british_bakeoff"
        static let watchedIndianMatchMake = "watched_indian_matchmake"
        static let watchedLoveIsBlind = "watched_love_is_blind"
        static let watchedLoveIsland = "watched_love_island"
        static let watchedQueerEye = "watched_queer_eye"
        static let watchedSellingSunset = "watched_selling_sunset"
        static let watchedSuits = "watched_suits"
        static let watchedTheCircle = "watched_the_circle"
    }

}

