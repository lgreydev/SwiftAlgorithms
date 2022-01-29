# Swift Algorithms

Swift Algorithms is an open-source package of sequence and collection algorithms, along with their related types.

Read more about the package, and the intent behind it, in the [announcement on swift.org](https://swift.org/blog/swift-algorithms/).



## Chain

`chain(_:_:)`: Concatenates two collections with the same element type.<br>
This operation is available for any two sequences by calling the `chain(_:_:)` function.

``` swift

let numbers = chain([10, 20, 30], 1...5)
// Array(numbers) == [10, 20, 30, 1, 2, 3, 4, 5]

let letters = chain("abcde", "FGHIJ")
// String(letters) == "abcdeFGHIJ"

```



## Chunked

`chunked(by:), chunked(on:), chunks(ofCount:)`: Eager and lazy operations that break a collection into chunks based on either a binary predicate or when the result of a projection changes or chunks of a given count.

Break a collection into subsequences where consecutive elements pass a binary predicate, or where all elements in each chunk project to the same value.

Also includes a `chunks(ofCount:)` that breaks a collection into subsequences of a given `count`.

There are two variations of the chunked method: `chunked(by:)` and `chunked(on:)`. `chunked(by:)` uses a binary predicate to test consecutive elements, separating chunks where the predicate returns `false`. For example, you can chunk a collection into ascending sequences using this method:

``` swift

let numbers = [10, 20, 30, 10, 40, 40, 10, 20]
let chunks = numbers.chunked(by: { $0 <= $1 })
// [[10, 20, 30], [10, 40, 40], [10, 20]]

```

The `chunked(on:)` method, by contrast, takes a projection of each element and separates chunks where the projection of two consecutive elements is not equal. The result includes both the projected value and the subsequence that groups elements with that projected value:

``` swift

let names = ["David", "Kyle", "Karoy", "Nate"]
let chunks = names.chunked(on: \.first!)
// [("D", ["David"]), ("K", ["Kyle", "Karoy"]), ("N", ["Nate"])] 

```

The `chunks(ofCount:)` method takes a `count` parameter (greater than zero) and separates the collection into chunks of this given `count`. If the count parameter is evenly divided by the count of the base `Collection`, all the chunks will have a count equal to the parameter. Otherwise, the last chunk will contain the remaining elements.

``` swift

let names = ["David", "Kyle", "Karoy", "Nate"]
let evenly = names.chunks(ofCount: 2)
// equivalent to [["David", "Kyle"], ["Karoy", "Nate"]] 

let remaining = names.chunks(ofCount: 3)
// equivalent to [["David", "Kyle", "Karoy"], ["Nate"]]

```

The `chunks(ofCount:)` is the subject of an [existing SE proposal](https://github.com/apple/swift-evolution/pull/935).

When "chunking" a collection, the entire collection is included in the result, unlike the `split` family of methods, where separators are dropped. Joining the result of a chunking method call recreates the original collection.

``` swift

c.elementsEqual(c.chunked(...).joined())
// true

```



## Random Sampling

Operations for randomly selecting `k` elements without replacement from a sequence or collection.

Use these methods for sampling multiple elements from a collection, optionally maintaining the relative order of the elements. Each method has an overload that takes a `RandomNumberGenerator` as a parameter.

``` swift

var source = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]

source.randomSample(count: 4)
// e.g. [30, 10, 70, 50]
source.randomStableSample(count: 4)
// e.g. [20, 30, 80, 100]

var rng = SplitMix64(seed: 0)
source.randomSample(count: 4, using: &rng)

```



## Stride

Step over the elements of a sequence elements by a specified amount.

This is available through the `striding(by:)` method on any `Sequence`.


``` swift

(0...10).striding(by: 2) // == [0, 2, 4, 6, 8, 10]

```


## Unique

Methods to strip repeated elements from a sequence or collection.

The `uniqued()` method returns a sequence, dropping duplicate elements from a sequence. The `uniqued(on:)` method does the same, using the result of the given closure to determine the "uniqueness" of each element.

``` swift

let numbers = [1, 2, 3, 3, 2, 3, 3, 2, 2, 2, 1]

let unique = numbers.uniqued()
// Array(unique) == [1, 2, 3]

```

``` swift

let cityAndCountry  = [
    "Hamburg": "Germany",
    "Kyoto": "Japan",
    "Osaka": "Japan",
    "Naples": "Italy",
    "Rome": "Italy"
]

let selectedCities2 = cityAndCountry.uniqued(on: \.value)
selectedCities2.forEach { print($0.key, $0.value) }
//Hamburg Germany
//Kyoto Japan
//Naples Italy

```



### 🛡️ License

This project is licensed under the MIT License - see the [`LICENSE`](https://github.com/lgreydev/SwiftAlgorithms/blob/main/License) file for details.

### 🙏 Support

This project needs a ⭐️ from you. Don't forget to leave a star ⭐️

### 😎 Contributing
Sergey Lukaschuk ✉️ s.lukaschuk@yahoo.com
