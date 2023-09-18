class Solution {
    func addBinary(_ a: String, _ b: String) -> String {

        var aStr = Array(a)
        var bStr = Array(b)
        var aIdx = aStr.count - 1
        var bIdx = bStr.count - 1
        var result = ""
        var adder = 0

        // Add two numbers
        while aIdx >= 0 && bIdx >= 0 {
            guard let aNum = Int("\(aStr[aIdx])") else { break }
            guard let bNum = Int("\(bStr[bIdx])") else { break }

            let tempResult = aNum + bNum + adder
            result = "\(tempResult % 2)" + result
            adder = tempResult / 2
            aIdx -= 1
            bIdx -= 1
        }
        // Attach left nuber
        while aIdx >= 0 {
            guard let aNum = Int("\(aStr[aIdx])") else { break }

            let tempResult = aNum + adder
            result = "\(tempResult % 2)" + result
            adder = tempResult / 2
            aIdx -= 1
        }

        while bIdx >= 0 {
            guard let bNum = Int("\(bStr[bIdx])") else { break }

            let tempResult = bNum + adder
            result = "\(tempResult % 2)" + result
            adder = tempResult / 2
            bIdx -= 1
        }

        // Attach last adder
        if adder > 0 {
            result = "\(adder % 2)" + result
            adder /= 2
        }

        return result
    }
}
//var a = "11", b = "1"
//var a = "1010", b = "1011"
var a = "1010101010100011010"
var b = "10111101000101010"
print(Solution().addBinary(a, b))
