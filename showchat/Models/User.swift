//
//  User.swift
//  showchat
//
//  Created by Belle Hu on 3/30/24.
//

import Foundation

/// Model representing a user.
struct User: Identifiable, Hashable, Equatable {

    // MARK: - Properties

    /// The id of the user.
    let id = UUID()

    /// The profile picture of the user.
    let image: String

    /// The name of the user.
    let name: String

}
