
import Foundation
struct Question: Codable {
    var question: String
    var content: [String]
    var correct: Int
}
typealias Questions = [Question]
