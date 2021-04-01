//
//  Structs.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 17.03.2021.
//

import UIKit
enum Status: String, Codable {
    case one = "Бродяга"
    case two = "Бедняк"
    case three = "Ниже среднячка"
    case four = "Среднячок"
    case five = "Богач"
    case six = "Бизнесмен"
    case seven = "Монополист"
    case eight = "Хищник"
    case nine = "Хиищник"
}
struct Houme: Codable {
    var level = 0
    var imageName: String
}

struct Pet: Codable {
    var level = 0
    var imageName: String
}

struct Sword: Codable {
    var level = 0
    var imageName: String
}

struct User: Codable {
    var name: String
    var avatarName: String
    var coins: Int = 0
    var status: Status = Status.one
    var home: Houme?
    var pet: Pet?
    var sword: Sword?
}
