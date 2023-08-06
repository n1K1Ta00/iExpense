//
//  ExpencelItem.swift
//  iExpense
//
//  Created by Никита Мартьянов on 4.08.23.
//

import Foundation
struct ExpenceItem: Identifiable, Codable {
    var id = UUID()
    let name : String
    let type : String
    let amount : Double
}
