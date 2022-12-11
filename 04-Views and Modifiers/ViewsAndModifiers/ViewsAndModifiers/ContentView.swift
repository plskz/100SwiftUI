//  Date: 12/12/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .teal]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(20)
            .blur(radius: 0.5)
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
                gradient: Gradient(colors: [.blue, .black]),
                center: .top,
                startRadius: 20,
                endRadius: 300
            )
            Text("Raccoons")
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
