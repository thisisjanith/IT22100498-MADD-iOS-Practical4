import SwiftUI

struct StudentDetailView: View {
    let student: Student

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // SF Symbol
                Image(systemName: student.passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(student.passed ? .green : .red)
                    .padding(.top, 20)

                // Student Name
                VStack(spacing: 6) {
                    Text(student.name)
                        .font(.largeTitle)
                        .bold()

                    Text(student.passed ? "Status: Passed" : "Status: Failed")
                        .font(.headline)
                        .foregroundStyle(student.passed ? .green : .red)
                }

                // Details Card
                VStack(spacing: 16) {
                    HStack {
                        Label("Score", systemImage: "number")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(student.mark) / 100")
                            .font(.title3)
                            .bold()
                    }

                    Divider()

                    HStack {
                        Label("Result", systemImage: "chart.bar.fill")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(student.passed ? "Pass" : "Fail")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(student.passed ? .green : .red)
                    }

                    Divider()

                    HStack {
                        Label("Grade", systemImage: "rosette")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(student.grade)
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.blue)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.secondarySystemBackground))
                )
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationTitle("Student Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        StudentDetailView(
            student: Student(name: "Amal", mark: 72)
        )
    }
}
