import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(animation: .default) private var items: [MultiboardItem]
    
    @State private var sheetSettings = false
    @AppStorage("grid_view") private var gridView = false
    
    var body: some View {
        VStack {
            if gridView {
                GridView()
            } else {
                ListView()
            }
        }
        .animation(.default, value: gridView)
        .navigationTitle("Pyzh Board")
        .sheet($sheetSettings) {
            SettingsView()
        }
#if !os(macOS)
        .navigationBarItems(leading: EditButton())
#endif
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button {
                        gridView.toggle()
                    } label: {
                        Label("View Style", systemImage: "rectangle.grid.2x2.fill")
                    }
                    
                    Divider()
                    
                    Button {
                        sheetSettings = true
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
    
    func createItem() {
        modelContext.insert(
            MultiboardItem()
        )
    }
    
    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(items[index])
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .modelContainer(for: MultiboardItem.self, inMemory: true)
    }
}
