import SwiftUI
import SwiftData

struct GridView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(animation: .default) private var items: [MultiboardItem]
    
    @State private var sheetSettings = false
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(
                .adaptive(minimum: 200)
            )
        ], spacing: 16) {
            ForEach(items) { item in
                GridItemCard(item)
            }
            .onDelete(perform: deleteItems)
            
            Button("Add") {
                createItem()
            }
            .foregroundStyle(.green)
            .frame(width: 200, height: 100)
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
            
        }
        Spacer()
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
    GridView()
        .modelContainer(for: MultiboardItem.self)
}
