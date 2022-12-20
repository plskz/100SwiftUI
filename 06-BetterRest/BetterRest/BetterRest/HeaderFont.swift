//  Date: 12/20/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct HeaderFont: View {
    var headerTitle: String
    
    init(_ headerTitle: String) {
        self.headerTitle = headerTitle
    }
    
    var body: some View {
        Text(headerTitle)
            .font(.subheadline.bold())
            .foregroundColor(.pink)
            .textCase(nil)
    }
}

struct HeaderFont_Previews: PreviewProvider {
    static var previews: some View {
        HeaderFont("When do you want to wake up?")
    }
}
