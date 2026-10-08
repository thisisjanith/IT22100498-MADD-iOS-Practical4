import Foundation

struct Student: Identifiable {
    let id = UUID()
    var name: String
    var mark: Int

    var passed: Bool {
        mark >= 50
    }
}
