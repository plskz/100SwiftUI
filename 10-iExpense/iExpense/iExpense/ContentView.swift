//  Date: 2/2/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                // challenge 3
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                // challenge 3
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                
                if expenses.isEmpty {
                    EmptyList()
                }
            }
            .navigationTitle("iExpense 💸")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                if expenses.isEmpty {
                    // only show this when empty
                    ToolbarItem(placement: .bottomBar) {
                        Button("Add Expenses") {
                            showingAddExpense = true
                        }
                        .buttonStyle(.ghost)
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
