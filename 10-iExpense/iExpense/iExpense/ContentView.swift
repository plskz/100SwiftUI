//  Date: 2/2/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(types, id: \.self) { type in
                    Section {
                        // challenge 3
                        ForEach(expensesFilter(type)) { item in
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
                        .onDelete { IndexSet in
                            removeItems(at: IndexSet, for: type)
                        }
                    } header: {
                        if expensesFilter(type).count != 0 {
                            HeaderFont(type)
                        }
                    }
                }
            }
            .navigationTitle("iExpense 💸")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    // challenge 3
    func expensesFilter(_ type: String) -> [ExpenseItem] {
        expenses.items.filter { $0.type == type }
    }
    
    func removeItems(at offsets: IndexSet, for type: String) {
        let chosenElement = expensesFilter(type)[offsets.first!]
        let uuid = chosenElement.id
        let index = expenses.items.firstIndex(where: { $0.id == uuid })!
        expenses.items.remove(at: index)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
