//
//  main.swift
//  SwiftAlgorithms
//
//  Created by Sergey Lukaschuk on 22.01.2022.
//

import Algorithms
import Foundation

// MARK: - Chain
// Concatenates two collections with the same element type.

let numbers = chain([10, 20, 30], 1...5)
// Array(numbers) == [10, 20, 30, 1, 2, 3, 4, 5] // true

let letters = chain("abcde", "FGHIJ")
// String(letters) == "abcdeFGHIJ"

let allName = chain(["Steve", "Mike"], ["Jane", "Mary"])
// Array(allName) == ["Steve", "Mike", "Jane", "Mary"] // true

let outOfBounds = chain(0...20, 30...50)
// outOfBounds.contains(25) // false

let disallowed = chain(0...10, [15, 22, 30, 41])
//disallowed.contains(9) // true
//disallowed.contains(22) // true
//disallowed.contains(29) // false

// MARK: - Chunked
// Eager and lazy operations that break a collection into chunks based on either a binary predicate or when the result of a projection changes or chunks of a given count.

struct Student {
    let name: String
    let grade: String
}

let results = [
    Student(name: "Taylor", grade: "A"),
    Student(name: "Sophie", grade: "A"),
    Student(name: "Bella", grade: "B"),
    Student(name: "Rajesh", grade: "C"),
    Student(name: "Tony", grade: "C"),
    Student(name: "Theresa", grade: "D"),
    Student(name: "Boris", grade: "F"),
    Student(name: "Alex", grade: "B"),
]

let studentsByGrade = results.sorted { $0.grade < $1.grade}.chunked(on: \.grade)

for (grade, students) in studentsByGrade {
    print("Grade: \(grade)")
    for student in students {
        print("\t\(student.name)")
    }
}

/*
Grade: A
    Taylor
    Sophie
Grade: B
    Bella
    Alex
Grade: C
    Rajesh
    Tony
Grade: D
    Theresa
Grade: F
    Boris
*/

let names = ["David", "Kyle", "Karoy", "Nate"]
let evenly = names.chunks(ofCount: 2)
// equivalent to [["David", "Kyle"], ["Karoy", "Nate"]]

let remaining = names.chunks(ofCount: 3)
// equivalent to [["David", "Kyle", "Karoy"], ["Nate"]]
