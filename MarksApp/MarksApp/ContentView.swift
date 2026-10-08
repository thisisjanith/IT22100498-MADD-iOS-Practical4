import SwiftUI

struct ContentView: View {
    @State private var students = [
        Student(name: "Amal", mark: 72),
        Student(name: "Nimali", mark: 45),
        Student(name: "Ruwan", mark: 58)
    ]

    var body: some View {
        List(students) { student in
            HStack {
                Text(student.name)

                Spacer()

                Text("\(student.mark)")
                    .bold()
                    .foregroundStyle(
                        student.passed ? .green : .red
                    )
            }
        }
    }
}

#Preview {
    ContentView()
}
