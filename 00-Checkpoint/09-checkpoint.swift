func getRandom(_ arr: [Int]? = nil) -> Int {
  return arr?.randomElement() ?? Int.random(in: 1...100)
}

print(getRandom())

print(getRandom([2, 3, 1, 5, 7]))
