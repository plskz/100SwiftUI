//  Date: 2/9/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct HeaderFont: View {
    let types = ["Business", "Personal"]
    var headerTitle: String
    
    init(_ headerTitle: String) {
        self.headerTitle = headerTitle
    }
    
    var body: some View {
        Text("\(headerTitle) \(headerTitle == "Personal" ? "🛍️" : "💼")")
            .font(.title2.bold())
            .foregroundColor(.blue)
            .textCase(nil)
    }
}

struct HeaderFont_Previews: PreviewProvider {
    static let types = ["Business", "Personal"]
    
    static var previews: some View {
        VStack {
            ForEach(types, id: \.self) { type in
                HeaderFont(type)
            }
            .padding()
        }
    }
}
