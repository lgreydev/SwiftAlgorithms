# Swift Algorithms

Swift Algorithms is an open-source package of sequence and collection algorithms, along with their related types.

Read more about the package, and the intent behind it, in the [announcement on swift.org](https://swift.org/blog/swift-algorithms/).

## Contents

### Chain

`chain(_:_:)`: Concatenates two collections with the same element type.<br>
This operation is available for any two sequences by calling the `chain(_:_:)` function.

``` swift

let numbers = chain([10, 20, 30], 1...5)
// Array(numbers) == [10, 20, 30, 1, 2, 3, 4, 5]

let letters = chain("abcde", "FGHIJ")
// String(letters) == "abcdeFGHIJ"

```


### 🛡️ License

This project is licensed under the MIT License - see the [`LICENSE`](https://github.com/lgreydev/SwiftAlgorithms/blob/main/License) file for details.

### 🙏 Support

This project needs a ⭐️ from you. Don't forget to leave a star ⭐️

### 😎 Contributing
Sergey Lukaschuk ✉️ s.lukaschuk@yahoo.com
