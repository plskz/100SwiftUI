enum SqrtError: Error {
  case outOfBounds, noRoot
}

func square(_ x: Int) throws -> String {
  if x < 1 || x > 10_000 {
    throw SqrtError.outOfBounds
  }

  for i in 1...100 {
    if x == i * i {
      print("The sqrt of \(x) is \(i)")
    }
  }

  throw SqrtError.noRoot
}

for i in 0...10_001 {
  do {
    let ans = try square(i)
    print(ans)
  } catch {
    print("\(i) is \(error)")
  }
}

/** bash
 * swift 04-checkpoint.swift > out.txt
 **/
