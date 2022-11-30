struct Car {
  let model: String
  let numOfSeats: Int
  private(set) var curGear: Int {
    willSet {
      print("Changing gear from \(curGear) to \(newValue)")
    }
    didSet {
      print("Current gear is now \(curGear)")
    }
  }

  enum GearDirection {
    case up, down, neutral
  }

  mutating func changeGear(_ gear: GearDirection) {
    switch gear {
    case .up:
      if curGear + 1 > 10 {
        print("Can't go above 10")
      } else {
        curGear += 1
      }

    case .down:
      if curGear - 1 <= 0 {
        print("Can't go below 0")
      } else {
        curGear -= 1
      }

    case .neutral:
      curGear = 1
    }
  }
}

var car = Car(model: "Model Z", numOfSeats: 4, curGear: 7)

print(car)
car.changeGear(.up)
car.changeGear(.up)
car.changeGear(.down)
car.changeGear(.neutral)
car.changeGear(.up)
