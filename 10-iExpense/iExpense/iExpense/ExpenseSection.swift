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
        List {
            ExpenseSection(
                title: "Business",
                expenses: [
                    ExpenseItem(name: "Macbook Pro", type: "Business", amount: 1200),
                    ExpenseItem(name: "Uber", type: "Business", amount: 21.59)
                ]) { _ in }
            
            ExpenseSection(
                title: "Personal",
                expenses: [
                    ExpenseItem(name: "Breakfast", type: "Personal", amount: 10),
                    ExpenseItem(name: "Lunch", type: "Personal", amount: 12),
                    ExpenseItem(name: "Gift", type: "Personal", amount: 500)
                ]) { _ in }
        }
    }
}

