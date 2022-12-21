//  Date: 12/21/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct Icon: View {
    var icon: String
    
    init(_ icon: String) {
        self.icon = icon
    }
    
    var body: some View {
        Image(systemName: icon)
            .foregroundStyle(.blue)
    }
}

struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        Icon("clock")
    }
}
