import Foundation

struct Entry {
    let minOcurrence: Int
    let maxOcurrence: Int
    let character: Character
    let password: String

    static func parse(from string: String) -> Self? {
        let parts = string.split(separator: " ")
        guard parts.count == 3 else { return nil }
        guard let minOcurrence = Int(parts[0].split(separator: "-")[0]) else { return nil }
        guard let maxOcurrence = Int(parts[0].split(separator: "-")[1]) else { return nil }
        guard let character = String(parts[1]).first else { return nil }

        return .init(
            minOcurrence: minOcurrence,
            maxOcurrence: maxOcurrence,
            character: character,
            password: String(parts[2])
        )
    }

    func isValidForFirstPolicy() -> Bool {
        let character_occurrences = password.filter { $0 == character }.count
        return character_occurrences >= minOcurrence && character_occurrences <= maxOcurrence
    }

    func isValidForSecondPolicy() -> Bool {
        return (
            password[
                password.index(password.startIndex, offsetBy: minOcurrence - 1)
            ] == character
        ) != (
            password[
                password.index(password.startIndex, offsetBy: maxOcurrence - 1)
            ] == character
        )
    }
}

func readLines(from input: String = "passwords") -> [String]? {
    let fileURL = Bundle.main.url(forResource: input, withExtension: "txt")
    return try? String(
            contentsOf: fileURL!,
            encoding: String.Encoding.utf8
        )
    .split(whereSeparator: \.isNewline)
    .map { String($0) }
}

let entries = readLines()?.compactMap { Entry.parse(from: $0) } ?? []

let firstPolicyEntries = entries.filter { $0.isValidForFirstPolicy() }
let secondPolicyEntries = entries.filter { $0.isValidForSecondPolicy() }

print("Entries that satisfy first policy: \(firstPolicyEntries.count)")
print("Entries that satisfy second policy: \(secondPolicyEntries.count)")
