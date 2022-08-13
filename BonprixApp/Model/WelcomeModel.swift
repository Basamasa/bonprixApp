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
struct Category: Codable {
    let label: String
    let url: String?
    let image: String?
    let children: [CategoryChild]?
}

// MARK: - CategoryChild
struct CategoryChild: Codable {
    let label: String
    let url: String
    let children: [PurpleChild]?
}

// MARK: - PurpleChild
struct PurpleChild: Codable {
    let label: String
    let url: String
    let children: [FluffyChild]?
}

// MARK: - FluffyChild
struct FluffyChild: Codable {
    let label: String
    let url: String
    let children: [TentacledChild]?
}

// MARK: - TentacledChild
struct TentacledChild: Codable {
    let label: String
    let url: String
}
