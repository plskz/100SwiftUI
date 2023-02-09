//  Date: 2/10/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

extension View {
    /// challenge 2 - Modify the expense amounts in ContentView to contain some styling depending on their value
    /// – expenses under $10 should have one style,
    /// – expenses under $100 another
    /// - expenses over $100 a third style.
    func style(for item: ExpenseItem) -> some View {
        item.amount <= 10 ? self.foregroundColor(.green) : item.amount <= 100 ? self.foregroundColor(.yellow) : self.foregroundColor(.red)
    }
}
