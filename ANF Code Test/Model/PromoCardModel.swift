//
//  PromoCardModel.swift
//  ANF Code Test
//
//  Created by Md Rezaul Karim on 7/9/21.
//

import UIKit
import Foundation

struct PromoCardModel: Codable {
    let backgroundImage: String
    var topDescription: String?
    let title: String
    var promoMessage: String?
    var bottomDescription: String?
    var content: [Title]?
}

struct Title: Codable {
    let title: String
    let target: String 
}
