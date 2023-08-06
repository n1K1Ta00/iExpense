//
//  Expenses.swift
//  iExpense
//
//  Created by Никита Мартьянов on 4.08.23.
//

import Foundation
class Expenses: ObservableObject {
    @Published var items = [ExpenceItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenceItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}
