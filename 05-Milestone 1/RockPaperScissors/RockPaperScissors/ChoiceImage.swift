//  Date: 12/16/22
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct ChoiceImage: View {
    var choice: String
    var width: CGFloat
    
    init(of choice: String, _ width: CGFloat) {
        self.choice = choice
        self.width = width
    }
    
    var body: some View {
        Image(choice)
            .resizable()
            .scaledToFit()
            .frame(width: width)
    }
}

struct ChoiceImage_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceImage(of: "rock", 256)
    }
}
