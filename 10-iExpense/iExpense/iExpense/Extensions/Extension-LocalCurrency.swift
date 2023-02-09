//  Date: 2/10/23
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    /// challenge 1: I'll use locale currency instead of user's preferred currency ^,..,^
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
