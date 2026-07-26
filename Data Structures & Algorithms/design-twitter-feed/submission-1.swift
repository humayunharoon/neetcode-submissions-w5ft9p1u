class Twitter {
    // This is an unoptimized solution because
    // it iterates through all of the tweets just to find 10 valid ones. 
    var users: [Int: Set<Int>]
    var tweets: [(Int, Int)]

    init() {
        users = [:]
        tweets = []
    }

    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweets.append((userId, tweetId))
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        var newsfeed: [Int] = []
        var count = tweets.count - 1
        var validSet = Set<Int>()
        validSet.insert(userId)

        if let following = users[userId] {
            validSet.formUnion(following)
        } 

        while newsfeed.count < 10 && count >= 0 {
            if validSet.contains(tweets[count].0) {
                newsfeed.append(tweets[count].1)
            }
            count -= 1
        } 

        return newsfeed
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        users[followerId, default:[]].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        users[followerId, default:[]].remove(followeeId)
    }
}
