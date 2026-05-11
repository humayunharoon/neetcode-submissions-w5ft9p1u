class LRUCache {

    var store: [Int]
    var keyStore: [Int: Int] // key, index
    var indexStore: [Int: (age: Int, index: Int, key: Int)] // index, tuple(age, index, key)
    var minIndex: Int
    var minKey: Int
    var age: Int

    init(_ capacity: Int) {
        store = Array(repeating:0, count:capacity)
        keyStore = [:]
        indexStore = [:]

        // loading dummy values
        age = 0
        for i in 0..<capacity {
            let dummyKey = -1 - i
            keyStore[dummyKey] = i
            indexStore[i] = (age: age, index:i, key:dummyKey)
            age += 1
        }
        minIndex = 0
        minKey = -1
        recordMin()
    }

    func get(_ key: Int) -> Int {
        if let index = keyStore[key] {
            let value = store[index]

            // update age
            var tuple = indexStore[index]!
            age += 1
            tuple.age = age
            indexStore[index] = tuple

            // sort and record older
            recordMin()

            return value
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        if let index = keyStore[key] {
            store[index] = value
            var tuple = indexStore[index]!
            age += 1
            tuple.age = age
            indexStore[index] = tuple
            recordMin()
            return
        }

        // remove value from store
        // create value for store
        store[minIndex] = value

        // remove value from keyStore
        keyStore[minKey] = nil

        // remove value from indexStore
        indexStore[minIndex] = nil

        // crete value for keyStore
        keyStore[key] = minIndex

        // create tuple for indexStore
        age += 1
        indexStore[minIndex] = (age: age, index: minIndex, key: key)

        recordMin()
    }

    func recordMin() {
        let oldest = indexStore.values.min{ $0.age < $1.age}!
        minIndex = oldest.index
        minKey = oldest.key
    }
}
