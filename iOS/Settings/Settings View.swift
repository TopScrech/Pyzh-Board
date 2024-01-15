import SwiftUI

struct SettingsView: View {
    @State private var showSafari = false
    @State private var safariUrl = ""
    
    var body: some View {
        List {
            Section {
                Button {
                    safariUrl = ""
                    showSafari = true
                } label: {
                    Text("GitHub")
                }
            }
        }
        .navigationTitle("Settings")
#if !os(macOS)
        .safariCover($showSafari, url: safariUrl)
#endif
    }
}

#Preview {
    SettingsView()
}
