//class Solution {
//    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
//        var wordsIdx = 0
//        var result: [String] = []
//        var tempStr = ""
//        while wordsIdx < words.count {
//            let nowWord = words[wordsIdx]
//            let nowWordLength = nowWord.count
//            if tempStr.count + nowWordLength <= maxWidth {
//                tempStr += nowWord
//            }
//            var nextWord: String? = nil
//            if wordsIdx + 1 < words.count {
//                nextWord = words[wordsIdx + 1]
//            }
//            if let nextWord = nextWord {
//                if tempStr.count + nextWord.count + 1 <= maxWidth {
//                    tempStr += " "
//                    wordsIdx += 1
//                    continue
//                } else {
//                    var tempArr = tempStr.split(separator: " ")
//                    var addSpace = maxWidth - tempArr.reduce(0) { $0 + $1.count }
//                    if tempArr.count == 1 {
//                        result.append(tempStr + String(repeating: " ", count: addSpace))
//                    } else {
//                        var addSpaces = [String](repeating: String(repeating: " ", count: addSpace / (tempArr.count - 1)), count: tempArr.count - 1)
//                        addSpace -= addSpaces.count * addSpaces[0].count
//                        addSpaces.replaceSubrange(0..<addSpace, with: [String](repeating: addSpaces[0] + " ", count: addSpace))
//                        result.append(addSpaces.enumerated().reduce("") { partialResult, arg in
//                            return partialResult + tempArr[arg.offset] + arg.element
//                        } + tempArr[tempArr.count - 1])
//                    }
//                }
//            } else {
//                result.append(tempStr + String(repeating: " ", count: maxWidth - tempStr.count))
//            }
//            tempStr = ""
//            wordsIdx += 1
//        }
//        return result
//    }
//}
//
////var words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16
////var words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16
//var words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20
//
//for str in Solution().fullJustify(words, maxWidth) {
//    print(str," || count:",str.count)
//}
