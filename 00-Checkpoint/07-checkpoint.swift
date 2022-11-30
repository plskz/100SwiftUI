class Animal {
  let legs: Int

  init(legs: Int) {
    self.legs = legs
  }
}

// -- :Dog --
class Dog: Animal {
  func speak() {
    print("arf arf")
  }
}

final class Corgi: Dog {
  override func speak() {
    print("aaarf")
  }
}

final class Poodle: Dog {
  override func speak() {
    print("arrf")
  }
}

// -- :Cat --
class Cat: Animal {
  let isTame: Bool

  init(isTame: Bool, legs: Int) {
    self.isTame = isTame
    super.init(legs: legs)
  }

  func speak() {
    print("meow meow")
  }
}

final class Persian: Cat {
  override func speak() {
    print("meeoOow")
  }
}

final class Lion: Cat {
  override func speak() {
    print("Mmeow")
  }
}

let oreo = Corgi(legs: 4)
oreo.speak() // aaarf

let mocha = Persian(isTame: true, legs: 4)
mocha.speak() // meeoOow
print(mocha.isTame) // true
