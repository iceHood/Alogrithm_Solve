final class Solution {
    func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        var truckTime = [(M: Int, P: Int, G: Int)](repeating: (0,0,0), count: garbage.count)
        var MTravelTime = 0, PTravelTime = 0, GTravelTime = 0
        truckTime[0].M = garbage[0].filter({$0 == "M"}).count
        truckTime[0].P = garbage[0].filter({$0 == "P"}).count
        truckTime[0].G = garbage[0].filter({$0 == "G"}).count
        print(truckTime[0])
        for i in 1..<garbage.count {
            let trash = garbage[i]
            let prevTime = truckTime[i-1]
            let travelTime = travel[i-1]
            MTravelTime += travelTime
            PTravelTime += travelTime
            GTravelTime += travelTime
            let Mnum = trash.filter({$0 == "M"}).count
            if Mnum > 0 {
                truckTime[i].M = prevTime.M + Mnum + MTravelTime
                MTravelTime = 0
            } else {
                truckTime[i].M = prevTime.M
            }
            let Pnum = trash.filter({$0 == "P"}).count
            if Pnum > 0 {
                truckTime[i].P = prevTime.P + Pnum + PTravelTime
                PTravelTime = 0
            } else {
                truckTime[i].P = prevTime.P
            }
            let Gnum = trash.filter({$0 == "G"}).count
            if Gnum > 0 {
                truckTime[i].G = prevTime.G + Gnum + GTravelTime
                GTravelTime = 0
            } else {
                truckTime[i].G = prevTime.G
            }
            print(truckTime[i])
        }
        let lastTime = truckTime.last!
        return lastTime.M + lastTime.P + lastTime.G
    }
}
