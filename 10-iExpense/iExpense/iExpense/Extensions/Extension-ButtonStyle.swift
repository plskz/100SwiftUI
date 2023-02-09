//  Date: 2/10/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct GhostButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundStyle(.tint)
            .background(
                RoundedRectangle(
                    cornerRadius: 20,
                    style: .continuous
                )
                .stroke(.tint, lineWidth: 2)
            )
    }
}

extension ButtonStyle where Self == GhostButtonStyle {
    static var ghost: Self {
        return .init()
    }
}
