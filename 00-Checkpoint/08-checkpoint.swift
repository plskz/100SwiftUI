protocol Building {
  var rooms: Int { get }
  var cost: Int { get set }
  var agentName: String { get }

  func getSummary()
}

extension Building {
  func getSummary() {
    print(
      """
      Details about the \(Self.self)
      - rooms: \(self.rooms)
      - cost: \(self.cost)
      - agentName: \(self.agentName)
      """)
  }
}

struct House: Building {
  var rooms: Int
  var cost: Int
  var agentName: String
}

struct Office: Building {
  var rooms: Int
  var cost: Int
  var agentName: String
}

let home = House(rooms: 4, cost: 400_000, agentName: "Michelle Ramirez")
let bakerStreet = Office(rooms: 14, cost: 550_000, agentName: "Maxine Wells")

home.getSummary()
bakerStreet.getSummary()

/**
 * --- Output ---
 *
 * Details about the House
 *  - rooms: 4
 *  - cost: 400000
 *  - agentName: Michelle Ramirez
 *
 * Details about the Office
 *  - rooms: 14
 *  - cost: 550000
 *  - agentName: Maxine Wells
 **/
