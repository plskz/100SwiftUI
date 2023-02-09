//  Date: 2/8/23
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
