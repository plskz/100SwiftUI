// Sol 1 :: using modulo
for i in 1...100 {
  if i % 15 == 0 {
    print("FizzBuzz")
  } else if i % 3 == 0 {
    print("Fizz")
  } else if i % 5 == 0 {
    print("Buzz")
  } else {
    print(i)
  }
}

// Sol 2 :: I didn't know that swift has `.isMultiple(of:)`
for i in 1...100 {
  if i.isMultiple(of: 15) {
    print("FizzBuzz")
  } else if i.isMultiple(of: 3) {
    print("Fizz")
  } else if i.isMultiple(of: 5) {
    print("Buzz")
  } else {
    print(i)
  }
}

// Sol 3
for i in 1...100 {
  var out = ""

  if i.isMultiple(of: 3) {
    out += "Fizz"
  }

  if i.isMultiple(of: 5) {
    out += "Buzz"
  }

  print(out.isEmpty ? i : out)
}
