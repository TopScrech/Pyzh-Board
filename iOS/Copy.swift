import SwiftUI

func copy(_ text: String) {
#if os(macOS)
    NSPasteboard.general.setString(text.content, forType: .string)
#else
    UIPasteboard.general.string = text
#endif
}
