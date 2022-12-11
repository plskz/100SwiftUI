//  Date: 12/12/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.blue)
            .padding()
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.teal, .black]),
                center: .top,
                startRadius: 20,
                endRadius: 300
            )
            Text("Prominent Title")
                .titleStyle()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
