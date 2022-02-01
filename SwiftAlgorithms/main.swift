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
//    print("Grade: \(grade)")
    for student in students {
//        print("\t\(student.name)")
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

// MARK: - Random Sampling
// Operations for randomly selecting `k` elements without replacement from a sequence or collection.

let lotteryBalls = 1...50
let winningNumbers = lotteryBalls.randomSample(count: 7)
// [45, 9, 40, 4, 39, 12, 32] // 7 elements, randomly selects

let people = ["Steve", "Kitty", "Mike", "Json"]
let selected = people.randomStableSample(count: 2)
// ["Steve", "Mike"] // 2 elements, maintaining their relative order

// MARK: - Stride
// Step over the elements of a sequence elements by a specified amount.

let inputString = "a1b2c3d4e5"
var letters2 = inputString.striding(by: 2)

//letters2.forEach { print($0) }
// a, b, c, d, e

let evenNumbers = (0...10).striding(by: 2)
//evenNumbers.forEach { print($0) } // == [0, 2, 4, 6, 8, 10]

// MARK: - Unique
// Methods to strip repeated elements from a sequence or collection.

struct City {
    let name: String
    let country: String
}

let destinations = [
    City(name: "Hamburg", country: "Germany"),
    City(name: "Kyoto", country: "Japan"),
    City(name: "Osaka", country: "Japan"),
    City(name: "Naples", country: "Italy"),
    City(name: "Rome", country: "Italy")
]

let selectedCities = destinations.uniqued(on: \.country)
//selectedCities.forEach { print($0.name, $0.country) }
//Hamburg Germany
//Kyoto Japan
//Naples Italy

let cityAndCountry  = [
    "Hamburg": "Germany",
    "Kyoto": "Japan",
    "Osaka": "Japan",
    "Naples": "Italy",
    "Rome": "Italy"
]

let selectedCities2 = cityAndCountry.uniqued(on: \.value)
//selectedCities2.forEach { print($0.key, $0.value) }
//Hamburg Germany
//Kyoto Japan
//Naples Italy

// MARK: - Compacted
// A convenience method that lazily flattens the nils out of a sequence or collection.

let allNumbers = [30, nil, nil, 10, 22, nil]
let safeNumbers = allNumbers.compacted().map { $0 }
// safeNumbers == [30, 10, 22]

