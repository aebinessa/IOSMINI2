//
//  Transaction.swift
//  mini-project-iOS-bank-api-starter
//
//  Created by Fatma Buyabes on 06/03/2024.
//

import Foundation
struct Transaction: Codable{
    let senderId: Int
    let reciverId: Int
    let amount: Double
    let type: String
}


