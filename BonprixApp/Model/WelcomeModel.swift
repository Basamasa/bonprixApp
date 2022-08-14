//
//  Model.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable, Hashable {
    let label: String
    let url: String?
    let image: String?
    let children: [Category]?
}
