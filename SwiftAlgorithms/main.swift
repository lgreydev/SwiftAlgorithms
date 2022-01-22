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

