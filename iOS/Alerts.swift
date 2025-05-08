import Foundation

#if canImport(AlertKit)
import AlertKit

final class SystemAlert {
    static func copied() {
        AlertKitAPI.present(
            title: NSLocalizedString("Copied", comment: ""),
            icon: .done,
            style: .iOS17AppleMusic,
            haptic: .success
        )
    }
}
#endif
