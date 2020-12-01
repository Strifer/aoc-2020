import UIKit

func find_two_sum(equalTo sum: Int = 2020) -> (Int, Int) {
    let expenses = (readLines() ?? []).compactMap(Int.init)
    var complements = Set<Int>()
    var pair = (0, 0)
    expenses.forEach { expense in
        let complement = sum - expense
        if complements.contains(complement) {
            pair = (expense, complement)
        }
        complements.insert(expense)
    }
    return pair
}

func find_three_sum(equalTo sum: Int = 2020) -> (Int, Int, Int) {
    let expenses = (readLines() ?? []).compactMap(Int.init)
    var complements = Set<Int>()
    var triple = (0, 0, 0)
    expenses.forEach { first in
        expenses.dropFirst().forEach { second in
            let complement = sum - first - second
            if complements.contains(complement) {
                triple = (first, second, complement)
            }
            complements.insert(second)
        }
    }
    return triple
}

func readLines(from input: String = "expenses") -> [String]? {
    let fileURL = Bundle.main.url(forResource: input, withExtension: "txt")
    return try? String(
            contentsOf: fileURL!,
            encoding: String.Encoding.utf8
        )
    .split(whereSeparator: \.isNewline)
    .map { String($0) }
}

let pair = find_two_sum()
let triple = find_three_sum()

print("Part 1")
print("Found pair: \(pair.0) + \(pair.1) = \(pair.0 + pair.1)")
print("\(pair.0) * \(pair.1) = \(pair.0 * pair.1)")
print("Part 2")
print("Found triple: \(triple.0) + \(triple.1) + \(triple.2) = \(triple.0 + triple.1 + triple.2)")
print("\(triple.0) * \(triple.1) * \(triple.2) = \(triple.0 * triple.1 * triple.2)")
