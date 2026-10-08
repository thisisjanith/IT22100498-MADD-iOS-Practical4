import SwiftUI

struct ContentView: View {
    @State private var students: [Student] = [
        Student(name: "Amal", mark: 72),
        Student(name: "Nimali", mark: 45),
        Student(name: "Ruwan", mark: 58)
    ]

    @State private var studentName = ""
    @State private var markText = ""
    @State private var errorMessage: String? = nil

    var passedCount: Int {
        students.filter { $0.passed }.count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Input Section Card
                VStack(spacing: 12) {
                    TextField("Student Name", text: $studentName)
                        .textFieldStyle(.roundedBorder)

                    TextField("Mark (0 - 100)", text: $markText)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)

                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Button {
                        addStudent()
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Student")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color(.secondarySystemBackground))

                // Summary Banner
                HStack {
                    Label("Passed Students: \(passedCount)", systemImage: "checkmark.circle.fill")
                        .font(.headline)
                        .foregroundStyle(.green)

                    Spacer()

                    Text("Total: \(students.count)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color(.systemBackground))

                Divider()

                // Student List
                List {
                    ForEach(students) { student in
                        NavigationLink {
                            StudentDetailView(student: student)
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(student.name)
                                        .font(.body)
                                        .bold()

                                    Text("Grade: \(student.grade)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                VStack(alignment: .trailing, spacing: 4) {
                                    Text("\(student.mark)")
                                        .font(.headline)
                                        .bold()
                                        .foregroundStyle(student.passed ? .green : .red)

                                    Text(student.passed ? "PASS" : "FAIL")
                                        .font(.caption2)
                                        .bold()
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, 2)
                                        .background(
                                            (student.passed ? Color.green : Color.red)
                                                .opacity(0.15)
                                        )
                                        .foregroundStyle(student.passed ? .green : .red)
                                        .clipShape(Capsule())
                                }
                            }
                            .padding(.vertical, 2)
                        }
                    }
                    .onDelete(perform: deleteStudent)
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("SE4041 Marks")
        }
    }

    private func addStudent() {
        let trimmedName = studentName.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedName.isEmpty else {
            errorMessage = "Please enter a student name."
            return
        }

        guard let mark = Int(markText.trimmingCharacters(in: .whitespacesAndNewlines)) else {
            errorMessage = "Please enter a valid integer mark."
            return
        }

        guard mark >= 0 && mark <= 100 else {
            errorMessage = "Mark must be between 0 and 100."
            return
        }

        let newStudent = Student(name: trimmedName, mark: mark)
        students.append(newStudent)

        // Clear input fields & reset error
        studentName = ""
        markText = ""
        errorMessage = nil
    }

    private func deleteStudent(at offsets: IndexSet) {
        students.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
