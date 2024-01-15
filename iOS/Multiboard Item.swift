import Foundation
import SwiftData

@Model
final class MultiboardItem {
    var name = "New Item"
    var content = ""
    var createdAt = Date()
    var modifiedAt: Date?
    
    init(content: String = "") {
        self.content = content
    }
}
