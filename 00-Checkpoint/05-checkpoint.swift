let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Sol 1
let _ =
  luckyNumbers
  .filter { !$0.isMultiple(of: 2) }
  .sorted()
  .map { print("\($0) is lucky") }

/**
 * --- Output ---
 *
 * 7 is lucky
 * 15 is lucky
 * 21 is lucky
 * 31 is lucky
 * 33 is lucky
 * 49 is lucky
 **/

// Sol 2 :: Support for other inputs
func solve(_ numbers: [Int]) {
  let _ =
    numbers
    .filter { !$0.isMultiple(of: 2) }
    .sorted()
    .map { print("\($0) is lucky") }
}

print("\n---Test Case #1---")
solve(luckyNumbers)

print("\n---Test Case #2---")
solve([3, 2, 5, 4, 1])

print("\n---Test Case #3---")
solve([33, 22, 11, 55, 44, 77])

/**
 * ---Test Case #1---
 * 7 is lucky
 * 15 is lucky
 * 21 is lucky
 * 31 is lucky
 * 33 is lucky
 * 49 is lucky
 *
 * ---Test Case #2---
 * 1 is lucky
 * 3 is lucky
 * 5 is lucky
 *
 * ---Test Case #3---
 * 11 is lucky
 * 33 is lucky
 * 55 is lucky
 * 77 is lucky
 **/
