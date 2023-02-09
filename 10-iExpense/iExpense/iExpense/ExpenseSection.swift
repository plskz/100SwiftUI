//  Date: 2/10/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

/// For a bigger challenge, try splitting the expenses list into two sections: one for personal expenses, and one for business expenses.
/// This is tricky for a few reasons, not least because it means being careful about how items are deleted!
struct ExpenseSection: View {
    var title: String
    var expenses: [ExpenseItem]
    var deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .localCurrency) // challenge 1
                        .style(for: item) // challenge 2
                }
            }
            .onDelete(perform: deleteItems)
        } header: {
            if expenses.count != 0 {
                HeaderFont(title)
            }
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expenses: []) { _ in }
    }
}

