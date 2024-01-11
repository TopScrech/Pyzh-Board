import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(animation: .default) private var items: [MultiboardItem]
    
    @State private var sheetSettings = false
    
    var body: some View {
        List {
            ForEach(items) { item in
                ItemCard(item)
            }
            .onDelete(perform: deleteItems)
            
            Section {
                Button("Add") {
                    createItem()
                }
            }
        }
        .navigationTitle("Multiboard")
        .sheet($sheetSettings) {
            SettingsView()
        }
#if !os(macOS)
        .navigationBarItems(leading: EditButton())
#endif
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    sheetSettings = true
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
    HomeView()
        .modelContainer(for: MultiboardItem.self, inMemory: true)
}
