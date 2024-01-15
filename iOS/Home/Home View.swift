import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(animation: .default) private var items: [MultiboardItem]
    
    @AppStorage("grid_view") private var gridView = false
    
    @State private var sheetSettings = false
    
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
#if !os(macOS)
        .navigationBarItems(leading: EditButton())
#endif
        .sheet($sheetSettings) {
            SettingsView()
        }
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
                        .semibold()
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
