//  Date: 2/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .padding(.bottom, 5)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
            .titleStyle()
    }
}
