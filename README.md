# SE4041 – Mobile Application Design & Development  
### Practical 03 – Functions, Enums, Structs & Classes in Swift

**Duration:** 2 Hours  
**Module:** SE4041 – Mobile Application Design & Development  
**Practical Type:** Self-Guided  
**Language:** Swift

---

> **Source note:** Sections through final-challenge Part I reproduce the accessible finalized lab sheet, with GitHub formatting and corrected timings. The remaining source text was truncated by the conversation reader. The additional challenge and submission sections below are provisional additions, clearly identified, pending the missing source text.

## 1. Practical Overview

In Practical 01, you worked with individual Swift values such as variables, data types, operators, strings, and optionals.

In Practical 02, you extended this knowledge using collections and control flow such as:

- Arrays
- Sets
- Dictionaries
- `if`
- `switch`
- Loops

In this practical, you will learn how to **organize your Swift code into reusable and meaningful components**.

You will work with:

- Functions
- Parameters and return values
- Argument labels
- Default parameter values
- `guard`
- Tuples
- Closures
- `map`, `filter`, and `reduce`
- Enumerations
- Structures
- Stored and computed properties
- Methods
- Classes
- Value types and reference types

These concepts form the final Swift language foundation before moving into SwiftUI application development. Lecture 04 specifically connects them to SwiftUI: SwiftUI screens are structs, `body` is a computed property, and SwiftUI frequently uses closures.

---

## 2. Learning Objectives

By the end of this practical, you should be able to:

1. Define and call Swift functions.
2. Pass values into functions using parameters.
3. Return values from functions.
4. Use argument labels correctly.
5. Use default parameter values.
6. Use `guard` for early validation.
7. Return multiple values using tuples.
8. Use closures with `map`, `filter`, and `reduce`.
9. Define and use enumerations.
10. Create structures with stored and computed properties.
11. Add methods to structures.
12. Create classes and initializers.
13. Explain the difference between value types and reference types.

These directly match the learning outcomes of Lecture 04.

---

## 3. Practical Environment

You may complete this practical using either of the following options.

### Option 1 – Xcode Playground

Open:

**Xcode → File → New → Playground**

Create a blank Swift Playground.

### Option 2 – Swift Playgrounds

Create a new Swift Playground and complete the same exercises.

---

## 4. Exercise 0 – GitHub Setup

Before beginning:

1. Log in to your GitHub account.
2. Accept the GitHub Classroom assignment provided by your instructor.
3. Open or clone your repository.
4. Create the following files.

```text
SE4041-Practical-03/
│
├── Exercise01.swift
├── Exercise02.swift
├── Exercise03.swift
├── Exercise04.swift
├── Exercise05.swift
├── Exercise06.swift
├── FinalChallenge.swift
│
└── screenshots/
```

Keep this `README.md` in the repository root. Work on each exercise separately. Examples sometimes redefine the same function, type, or constant: replace the earlier version or run the example in a separate Playground page rather than pasting every block into one scope. Keep functions through default parameters in `Exercise01.swift`; keep structs, computed properties, methods, classes, and value/reference examples in `Exercise06.swift`. Save the final challenge separately.

Commit your work regularly.

Suggested commit messages:

```text
Complete functions exercises
Complete closures and enum exercises
Complete structs and classes exercises
Complete Practical 03 final challenge
```

---

## 5. Exercise 01 – Functions

**Suggested time: 18 minutes.**

A function is a named block of code that performs a particular task.

Functions help us:

- avoid repeating code,
- make code easier to understand,
- test small parts independently,
- reuse logic in different places.

Lecture 04 introduces functions as a way to give reusable work a meaningful name.

---

## Step 1 – A Simple Function

Create `Exercise01.swift`.

Enter:

```swift
func greet() {
    print("Welcome to SE4041")
}

greet()
```

Expected output:

```text
Welcome to SE4041
```

The function is defined using:

```swift
func
```

The function runs only when you call:

```swift
greet()
```

---

## Step 2 – Function with a Parameter

Create:

```swift
func greetStudent(name: String) {
    print("Welcome \(name)")
}

greetStudent(name: "Amal")
```

Expected:

```text
Welcome Amal
```

Here:

```text
name
```

is a parameter.

It allows different values to be passed into the same function.

Try:

```swift
greetStudent(name: "Nimali")
greetStudent(name: "Ruwan")
```

---

## 6. Returning a Value

Functions can also return values.

```swift
func grade(for mark: Int) -> String {

    if mark >= 50 {
        return "Pass"
    }

    return "Fail"
}
```

Call it:

```swift
let result = grade(for: 68)

print(result)
```

Expected:

```text
Pass
```

The syntax:

```swift
-> String
```

means:

> This function returns a `String`.

Lecture 04 uses this exact `grade(for:)` style to demonstrate parameters, return types, and argument labels.

---

## Activity 1

Create a function:

```swift
func calculateAverage(...)
```

that accepts three `Double` values and returns their average.

Example:

```swift
let result = calculateAverage(75, 82, 68)

print(result)
```

Expected:

```text
75.0
```

---

## 7. Argument Labels

Swift functions can use an external argument label and an internal parameter name.

Example:

```swift
func travel(from town: String, to city: String) {
    print("Travelling from \(town) to \(city)")
}
```

Call:

```swift
travel(from: "Malabe", to: "Kandy")
```

Expected:

```text
Travelling from Malabe to Kandy
```

Here:

```text
from
to
```

are argument labels.

While:

```text
town
city
```

are the names used inside the function.

Lecture 04 emphasizes that Swift argument labels make function calls read naturally.

---

## Removing an Argument Label

Use `_`:

```swift
func double(_ number: Int) -> Int {
    return number * 2
}

print(double(10))
```

Expected:

```text
20
```

Notice:

```swift
double(10)
```

instead of:

```swift
double(number: 10)
```

---

## 8. Default Parameter Values

A parameter can have a default value.

Example:

```swift
func result(_ mark: Int, passMark: Int = 50) -> String {

    if mark >= passMark {
        return "Pass"
    }

    return "Fail"
}
```

Call:

```swift
print(result(68))
```

Expected:

```text
Pass
```

You can also override the default:

```swift
print(result(68, passMark: 75))
```

Expected:

```text
Fail
```

Default values make parameters optional at the call site.

---

## Activity 2

Create:

```swift
func finalResult(mark: Int, passMark: Int = 50) -> String
```

Test it using:

```swift
finalResult(mark: 45)
finalResult(mark: 75)
finalResult(mark: 75, passMark: 80)
```

Observe the results.

---

## 9. Exercise 02 – `guard`

**Suggested time: 8 minutes.**

In Practical 01 you learned:

```swift
if let
```

for safely unwrapping optionals.

Swift also provides:

```swift
guard
```

`guard` is useful when a function should stop immediately if a required condition is not satisfied.

---

## Example

```swift
func register(_ name: String?) {

    guard let name = name else {
        print("No name given")
        return
    }

    print("Registered \(name)")
}
```

Try:

```swift
register("Kamal")
```

Expected:

```text
Registered Kamal
```

Now:

```swift
register(nil)
```

Expected:

```text
No name given
```

A `guard` statement handles the invalid case first and exits the current function. The unwrapped value remains available afterwards.

---

## Add Another Validation

```swift
func register(_ name: String?) {

    guard let name = name else {
        print("No name given")
        return
    }

    guard !name.isEmpty else {
        print("Name cannot be empty")
        return
    }

    print("Registered \(name)")
}
```

Test:

```swift
register(nil)
register("")
register("Kamal")
```

---

## Activity 3

Create:

```swift
func checkStudent(name: String?, mark: Int?)
```

Requirements:

- if `name` is `nil`, print `"Student name unavailable"` and return,
- if `mark` is `nil`, print `"Student mark unavailable"` and return,
- otherwise print:

```text
Kamal received 75 marks
```

Use `guard let`.

---

## 10. Exercise 03 – Tuples

**Suggested time: 7 minutes.**

Sometimes a function needs to return more than one value.

A tuple allows several values to be grouped together.

Example:

```swift
func summary(of marks: [Int])
    -> (minimum: Int, maximum: Int, average: Double) {

    let total = marks.reduce(0, +)

    return (
        marks.min()!,
        marks.max()!,
        Double(total) / Double(marks.count)
    )
}
```

> Run this example with a non-empty marks array: `min()!` and `max()!` assume values exist.

Call:

```swift
let result = summary(of: [72, 65, 48, 90])

print(result.minimum)
print(result.maximum)
print(result.average)
```

Expected:

```text
48
90
68.75
```

Lecture 04 uses tuples specifically to return multiple related results from a function.

---

## Tuple Unpacking

You can also write:

```swift
let (low, high, average) = summary(of: [72, 65, 48, 90])

print(low)
print(high)
print(average)
```

If you do not need one part:

```swift
let (low, high, _) = summary(of: [72, 65, 48, 90])
```

---

## Activity 4

Write:

```swift
func analyzeMarks(_ marks: [Int])
    -> (total: Int, average: Double)
```

Test using:

```swift
[60, 70, 80, 90]
```

Expected:

```text
Total: 300
Average: 75.0
```

---

## 11. Exercise 04 – Closures, `map`, `filter`, and `reduce`

**Suggested time: 12 minutes.**

A closure is a block of code that can be passed around like a value.

You will see closures frequently when you begin SwiftUI.

Lecture 04 introduces them primarily through:

- `map`
- `filter`
- `reduce`

and directly connects trailing-closure syntax to SwiftUI.

Create:

```swift
let marks = [72, 45, 65, 48, 90]
```

---

## `filter`

`filter` selects values that satisfy a condition.

```swift
let passed = marks.filter { $0 >= 50 }

print(passed)
```

Expected:

```text
[72, 65, 90]
```

Here:

```swift
$0
```

means the current element.

---

## `map`

`map` transforms every value.

```swift
let increasedMarks = marks.map { $0 + 5 }

print(increasedMarks)
```

Expected:

```text
[77, 50, 70, 53, 95]
```

The original array is not changed.

---

## `reduce`

`reduce` combines all values into one value.

```swift
let total = marks.reduce(0) { $0 + $1 }

print(total)
```

Expected:

```text
320
```

Here:

```text
$0
```

represents the accumulated result.

```text
$1
```

represents the current element.

---

## Activity 5

Create:

```swift
let prices = [120.0, 250.0, 80.0, 500.0, 150.0]
```

Use closures to:

1. Create an array containing only prices greater than `100`.
2. Create a new array where every price has increased by `10`.
3. Calculate the total of all prices.

Do not use a `for` loop for this activity.

---

## 12. Exercise 05 – Enumerations

**Suggested time: 8 minutes.**

An enumeration, or `enum`, defines a fixed set of possible values.

Example:

```swift
enum Direction {
    case north
    case south
    case east
    case west
}
```

Create:

```swift
var direction = Direction.north
```

Once Swift knows the type:

```swift
direction = .south
```

An enum prevents invalid values from being used accidentally. Lecture 04 presents enums as a way to model a fixed set of choices.

---

## Enum with `switch`

```swift
enum Status {
    case registered
    case pending
    case rejected
}
```

Create:

```swift
let studentStatus = Status.registered
```

Then:

```swift
switch studentStatus {

case .registered:
    print("Registration Complete")

case .pending:
    print("Registration Pending")

case .rejected:
    print("Registration Rejected")
}
```

When every enum case is covered, a `default` case is not required.

---

## 13. Raw Values

An enum case can also have a raw value.

```swift
enum Grade: String {

    case a = "A"
    case b = "B"
    case c = "C"
    case f = "F"
}
```

Create:

```swift
let grade = Grade.b

print(grade.rawValue)
```

Expected:

```text
B
```

---

## Activity 6

Create:

```swift
enum ModuleStatus: String
```

with:

```text
Not Started
In Progress
Completed
```

Create one value and print its raw value.

---

## 14. Exercise 06 – Structures

**Suggested time: 22 minutes.**

A `struct` groups related values together into a new type.

Example:

```swift
struct Student {

    var name: String
    var mark: Int
    var registered: Bool = true
}
```

Create:

```swift
let student = Student(
    name: "Amal",
    mark: 72
)
```

Print:

```swift
print(student.name)
print(student.mark)
print(student.registered)
```

Expected:

```text
Amal
72
true
```

Swift automatically creates a memberwise initializer for this struct.

---

## 15. Computed Properties

A stored property holds a value.

A computed property calculates a value whenever you access it.

Example:

```swift
struct Rectangle {

    var width: Double
    var height: Double

    var area: Double {
        return width * height
    }
}
```

Create:

```swift
let rectangle = Rectangle(
    width: 4,
    height: 3
)

print(rectangle.area)
```

Expected:

```text
12.0
```

`area` is not separately stored. It is calculated from `width` and `height`. This distinction becomes particularly important in SwiftUI because a view's `body` is itself a computed property.

---

## Add a Computed Grade

Create:

```swift
enum Grade: String {
    case a = "A"
    case b = "B"
    case c = "C"
    case f = "F"
}
```

Then:

```swift
struct Student {

    var name: String
    var mark: Int

    var grade: Grade {

        switch mark {

        case 75...100:
            return .a

        case 65..<75:
            return .b

        case 50..<65:
            return .c

        default:
            return .f
        }
    }
}
```

Test:

```swift
let student = Student(
    name: "Amal",
    mark: 72
)

print(student.name)
print(student.grade.rawValue)
```

Expected:

```text
Amal
B
```

This closely follows the integrated Student model from Lecture 04.

---

## 16. Methods

Functions defined inside a struct or class are called **methods**.

Example:

```swift
struct Student {

    var name: String
    var mark: Int

    func displayDetails() {
        print("\(name) received \(mark)")
    }
}
```

Create:

```swift
let student = Student(
    name: "Kamal",
    mark: 75
)

student.displayDetails()
```

Expected:

```text
Kamal received 75
```

---

## `mutating` Methods

If a struct method changes one of the struct's properties, it must use:

```swift
mutating
```

Example:

```swift
struct Counter {

    var count = 0

    mutating func increment() {
        count += 1
    }
}
```

Create:

```swift
var counter = Counter()

counter.increment()
counter.increment()

print(counter.count)
```

Expected:

```text
2
```

Lecture 04 emphasizes that modifying a struct from inside a method requires `mutating`.

---

## 17. Classes

A class can also contain:

- properties,
- methods,
- initializers.

Example:

```swift
class Lecturer {

    var name: String
    var module: String

    init(name: String, module: String) {

        self.name = name
        self.module = module
    }

    func introduce() {

        print("\(name) teaches \(module)")
    }
}
```

Create:

```swift
let lecturer = Lecturer(
    name: "Nushkan",
    module: "SE4041"
)

lecturer.introduce()
```

Expected:

```text
Nushkan teaches SE4041
```

Unlike the simple struct example, the class explicitly defines its initializer.

---

## 18. Struct vs Class – The Important Difference

This is one of the most important concepts in this practical.

A **struct is a value type**.

A **class is a reference type**.

---

## Struct Example

```swift
struct Point {
    var x = 0
}

var firstPoint = Point()

var secondPoint = firstPoint

secondPoint.x = 99

print(firstPoint.x)
print(secondPoint.x)
```

Expected:

```text
0
99
```

Why?

Because:

```swift
var secondPoint = firstPoint
```

creates a **copy**.

The two values are independent.

---

## Class Example

```swift
class CounterClass {
    var count = 0
}

let firstCounter = CounterClass()

let secondCounter = firstCounter

secondCounter.count = 99

print(firstCounter.count)
print(secondCounter.count)
```

Expected:

```text
99
99
```

Why?

Because both constants refer to the **same object**.

Changing the object using one reference is visible through the other reference.

This value-versus-reference distinction is identified in Lecture 04 as the central difference students should understand before SwiftUI.

---

## 19. Choosing Between Struct and Class

A useful rule from the lecture is:

| Requirement | Preferred Type |
|---|---|
| Model simple data | `struct` |
| Independent copies required | `struct` |
| Shared instance required | `class` |
| Inheritance required | `class` |
| Unsure which to use | `struct` |

For example:

```text
Student name and mark
```

is usually a good `struct`.

A shared application data store observed by several screens may be a `class`.

---

## 20. Knowledge Check

Before attempting the final task, make sure you can answer:

1. Why do we use functions?
2. What is a function parameter?
3. What does `-> String` mean?
4. What is an argument label?
5. What is a default parameter value?
6. What is the purpose of `guard`?
7. What is a tuple?
8. What does `filter` do?
9. What does `map` do?
10. What does `reduce` do?
11. What problem does an enum solve?
12. What is a raw value?
13. What is a struct?
14. What is a stored property?
15. What is a computed property?
16. When is `mutating` required?
17. What is a class?
18. What is the main difference between a struct and a class?

---

## 21. Final Practical Task – Student Management System

**Suggested time: 30 minutes.**

Create:

```text
FinalChallenge.swift
```

This is the final task that must be completed and submitted.

---

## Scenario

You are required to develop a small Swift-based **Student Management System**.

The program should model students using Swift types and use reusable functions and closures to process their results.

---

## Part A – Create a Grade Enum

Create:

```swift
enum Grade: String
```

Use the following cases:

```text
A
A-
B+
B
B-
C+
C
C-
F
```

You may choose suitable Swift case names such as:

```swift
case a = "A"
case aMinus = "A-"
```

---

## Part B – Create a Student Struct

Create:

```swift
struct Student
```

with stored properties:

```text
studentID
name
mark
```

Choose suitable Swift data types.

---

## Part C – Add a Computed Grade Property

Inside `Student`, create:

```swift
var grade: Grade
```

as a computed property.

Use:

```text
80...100 -> A
75..<80  -> A-
70..<75  -> B+
65..<70  -> B
60..<65  -> B-
55..<60  -> C+
45..<55  -> C
40..<45  -> C-
Below 40 -> F
```

Use a `switch`.

---

## Part D – Add a Method

Create:

```swift
func displayDetails()
```

that displays:

```text
ID: ITXXXXXXXX
Name: Kamal
Mark: 72
Grade: B+
```

---

## Part E – Create Students

Create at least **five students**.

Example:

```swift
let students = [
    Student(studentID: "IT001", name: "Amal", mark: 72),
    Student(studentID: "IT002", name: "Nimali", mark: 45),
    Student(studentID: "IT003", name: "Ruwan", mark: 68),
    Student(studentID: "IT004", name: "Sanduni", mark: 90),
    Student(studentID: "IT005", name: "Kasun", mark: 38)
]
```

---

## Part F – Display Students

Use a loop:

```swift
for student in students
```

and call:

```swift
student.displayDetails()
```

for each student.

---

## Part G – Use `filter`

Create an array containing only students with:

```text
mark >= 50
```

Example:

```swift
let passedStudents = students.filter {
    ...
}
```

Display their names.

---

## Part H – Use `map`

Create an array containing only student names.

Example:

```swift
let studentNames = students.map {
    ...
}
```

Display the resulting array.

---

## Part I – Use `reduce`

Use `reduce` to calculate the total of all marks.

Then calculate the class average.

Expected output:

```text
Class Average: 62.6
```

Your value will depend on the student marks you use.

---

## 22. Additional Challenge — Provisional

**Optional extension; complete after the two-hour session if needed.**

> This section could not be recovered from the finalized sheet. The following is a suggested extension, not a verified transcription.

Add a function that accepts an optional student name and an optional mark. Use `guard let` to unwrap both values, reject an empty name, and reject marks outside `0...100`.

Add a function that summarizes a non-empty student array using a tuple containing the minimum mark, maximum mark, and average. Decide how an empty array should be handled safely.

Finally, demonstrate independent copying of a `Student` struct and shared references to a class instance. Print the original and copied/referenced values after changing one of them, and explain the difference in comments.

## 23. Submission Requirements — Provisional

> The exact original submission wording was unavailable. These requirements follow the repository structure recovered from the sheet.

Your repository should contain:

```text
SE4041-Practical-03/
├── README.md
├── Exercise01.swift
├── Exercise02.swift
├── Exercise03.swift
├── Exercise04.swift
├── Exercise05.swift
├── Exercise06.swift
├── FinalChallenge.swift
└── screenshots/
    ├── 01-exercises.png
    └── 02-final-challenge.png
```

Include completed guided activities and a working Student Management System. Screenshots should clearly show the exercise output and final challenge output. Use the GitHub Classroom repository supplied by your instructor.

The final challenge's grade bands and `mark >= 50` filter are separate requirements from the original sheet. Preserve both: for example, a mark of 45 earns C under the stated grade bands but is excluded from the filtered array.

## 24. Final Git Commands

Run these commands from your local assignment repository:

```bash
git status
git add README.md Exercise01.swift Exercise02.swift Exercise03.swift Exercise04.swift Exercise05.swift Exercise06.swift FinalChallenge.swift screenshots/
git commit -m "Complete SE4041 Practical 03"
git push
git status
```

Open your GitHub Classroom repository and verify that your latest files and screenshots are visible.

## 25. Submission Checklist — Provisional

- [ ] All six exercise files are included and run independently.
- [ ] Functions demonstrate parameters, return values, argument labels, and defaults.
- [ ] Optional values are safely unwrapped using `guard let`.
- [ ] A function returns multiple values using a tuple.
- [ ] Closures demonstrate `map`, `filter`, and `reduce`.
- [ ] Enums and raw values are demonstrated.
- [ ] Structs demonstrate stored and computed properties.
- [ ] Methods and a `mutating` method are demonstrated.
- [ ] A class includes an initializer and a method.
- [ ] Value and reference semantics are demonstrated and understood.
- [ ] The knowledge-check questions have been reviewed.
- [ ] The final challenge includes a grade enum and a Student struct.
- [ ] The computed grade follows the specified grade bands.
- [ ] At least five students are created and displayed.
- [ ] The filtered student array uses `mark >= 50`.
- [ ] Student names are extracted with `map`.
- [ ] Marks are totaled with `reduce` and the class average is correct.
- [ ] The provided five-student sample produces an average of 62.6.
- [ ] Output screenshots are included.
- [ ] Changes are committed, pushed, and visible on GitHub.

## 26. Corrected Two-Hour Timing Plan

The exercise timings above follow this plan. Exercise 01 includes sections 5–8; Exercise 05 includes raw values; Exercise 06 includes sections 14–19.

| Session segment | Minutes | Elapsed time |
|---|---:|---|
| Environment and GitHub setup | 5 | 00:00–00:05 |
| Exercise 01 — Functions, parameters, return values, argument labels, defaults | 18 | 00:05–00:23 |
| Exercise 02 — `guard` | 8 | 00:23–00:31 |
| Exercise 03 — Tuples | 7 | 00:31–00:38 |
| Exercise 04 — Closures, `map`, `filter`, `reduce` | 12 | 00:38–00:50 |
| Exercise 05 — Enums and raw values | 8 | 00:50–00:58 |
| Exercise 06 — Structs, properties, methods, classes, value/reference semantics | 22 | 00:58–01:20 |
| Knowledge check | 5 | 01:20–01:25 |
| Final Student Management System challenge | 30 | 01:25–01:55 |
| Screenshots, GitHub submission, and checklist | 5 | 01:55–02:00 |
| **Total** | **120** | **2 hours** |

The optional additional challenge is outside the core 120-minute schedule.

