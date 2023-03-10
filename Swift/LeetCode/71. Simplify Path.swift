//class Solution {
//    func simplifyPath(_ path: String) -> String {
//        let arrOfPath = path.split(separator: "/")
//        var totalPath: [String] = []
//        for token in arrOfPath {
//            switch token {
//            case ".":
//                break
//            case "..":
//                totalPath.popLast()
//            default:
//                totalPath.append("\(token)")
//            }
//        }
//        return "/" + totalPath.joined(separator: "/")
//    }
//}
//
////var path = "/home/"
////var path = "/../"
//var path = "/home//foo/"
//print(Solution().simplifyPath(path))
