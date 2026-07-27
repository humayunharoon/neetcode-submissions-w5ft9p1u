import Collections

struct Item: Comparable {
    let count: Int
    let tweetId: Int
    let followeeId: Int
    let index: Int

    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.count < rhs.count
    }

}

class Twitter {
    // This is an unoptimized solution because
    // it iterates through all of the tweets just to find 10 valid ones. 
    var users: [Int: Set<Int>] // user, followees
    var tweetMap: [Int: [(Int, Int)]] // user, [(count, tweetId)]
    var count: Int

    init() {
        users = [:]
        tweetMap = [:]
        count = 0
    }

    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweetMap[userId, default:[]].append((count, tweetId))
        count += 1
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        var result: [Int] = []
        var maxHeap = Heap<Item>()


        users[userId, default: Set()].insert(userId)
        if let followees = users[userId] {
            for followee in followees {
                if let tweets = tweetMap[followee], !tweets.isEmpty {
                    let index = tweets.count - 1
                    let (cnt, tweetId) = tweets[index]
                    maxHeap.insert(Item(count: cnt, tweetId:tweetId, followeeId:followee, index: index - 1 ))
                }
            }
        }
        
        while !maxHeap.isEmpty && result.count < 10 {
            let item = maxHeap.removeMax()

            // store result
            result.append(item.tweetId)

            // pop back in
            if item.index >= 0 {
                let tweet = tweetMap[item.followeeId]![item.index]
                let item = Item(count:tweet.0, tweetId:tweet.1, followeeId:item.followeeId, index: item.index - 1)
                maxHeap.insert(item)
            }
        }

        return result
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        if followerId != followeeId {
            users[followerId, default:[]].insert(followeeId)
        }
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        users[followerId, default:[]].remove(followeeId)
    }
}
