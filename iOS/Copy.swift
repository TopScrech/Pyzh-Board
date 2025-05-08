import SwiftUI

func copy(_ text: String) {
#if os(macOS)
    NSPasteboard.general.setString(text, forType: .string)
#else
    UIPasteboard.general.string = text
#endif
    
#if canImport(AlertKit)
    SystemAlert.copied()
#endif
}
