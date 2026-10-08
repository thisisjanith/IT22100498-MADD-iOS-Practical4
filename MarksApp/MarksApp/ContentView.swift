import SwiftUI

struct ContentView: View {
    @State private var students = [
        Student(name: "Amal", mark: 72),
        Student(name: "Nimali", mark: 45),
        Student(name: "Ruwan", mark: 58)
    ]

    var body: some View {
        NavigationStack {
            List(students) { student in
                NavigationLink {
                    StudentDetailView(student: student)
                } label: {
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
            .navigationTitle("SE4041 Marks")
        }
    }
}

#Preview {
    ContentView()
}
