//
//  Student.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation
// MARK: - WelcomeElement
struct Student: Codable {
    let createdAt, name: String?
    let avatar: String?
    let age: Int?
    let department, profileID, id: String?

    enum CodingKeys: String, CodingKey {
        case createdAt, name, avatar, age, department
        case profileID = "profileId"
        case id
    }
}
