//  Date: 2/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

struct CrewRoster: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 74)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading){
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CrewRoster_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CrewRoster(
                crew: [
                    MissionView.CrewMember(
                        role: "Commander",
                        astronaut: Astronaut(
                            id: "armstrong",
                            name: "Neil A. Armstrong",
                            description: "")
                    ),
                ]
            )
        }
        .preferredColorScheme(.dark)
    }
}
