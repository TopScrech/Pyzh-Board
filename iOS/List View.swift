import SwiftUI
import SwiftData

struct ListView: View {
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
                .foregroundStyle(.green)
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
    ListView()
        .modelContainer(for: MultiboardItem.self)
}
