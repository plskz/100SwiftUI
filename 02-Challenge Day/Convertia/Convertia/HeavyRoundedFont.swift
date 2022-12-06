//  Date: 12/6/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct HeavyRoundedFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .heavy, design: .rounded))
    }
}

extension View {
    func heavyRoundedFont() -> some View {
        self.modifier(HeavyRoundedFont())
    }
}
