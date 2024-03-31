//
//  Poster.swift
//  showchat
//
//  Created by Belle Hu on 3/30/24.
//

import Foundation

/// Model representing a movie poster.
struct Poster: Hashable {

    // MARK: - Properties

    /// The movie poster image.
    let image: String

    /// The user who watched this movie/show.
    let user: User

}
