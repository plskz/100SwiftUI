//  Date: 3/8/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedShortLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                                .padding(.top, -5)
                        }
                    }
                }
                .padding([.leading, .trailing])
                .listRowBackground(Color.darkBackground)
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 3, leading: 15, bottom: 3, trailing: 15))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.lightBackground)
                )
            }
        }
        .navigationTitle("Moonshot")
        .listStyle(.plain)
        .background(.darkBackground)
    }
}

struct ListLayout_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayout(astronauts: astronauts, missions: missions)
            .preferredColorScheme(.dark)
    }
}
