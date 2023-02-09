//  Date: 2/10/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct EmptyList: View {
    var body: some View {
        VStack {
            Image(systemName: "cart")
                .font(.system(size: 128))
            
            Text("Your Expenses is Empty!")
                .font(.system(size: 22, weight: .heavy, design: .rounded))
                .padding()
            
            Text("Tap the button to add items")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.secondary)
            
            Image(systemName: "arrow.down")
                .font(.system(size: 64, weight: .ultraLight, design: .rounded))
                .padding(.top, 80)
        }
        .listRowBackground(Color.clear)
    }
}

struct EmptyList_Previews: PreviewProvider {
    static var previews: some View {
        List {
            EmptyList()
        }
    }
}
