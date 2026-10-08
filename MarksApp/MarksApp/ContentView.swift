import SwiftUI

struct ContentView: View {
    @State private var studentName = ""
    @State private var mark = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Student Registration")
                .font(.title)
                .bold()

            TextField("Student Name", text: $studentName)
                .textFieldStyle(.roundedBorder)

            TextField("Mark", text: $mark)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            Button("Show Result") {
                // Action placeholder
            }
            .buttonStyle(.borderedProminent)

            if studentName.isEmpty {
                Text("Enter student name above")
                    .foregroundStyle(.secondary)
            } else {
                Text("Welcome, \(studentName)")
                    .font(.headline)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
