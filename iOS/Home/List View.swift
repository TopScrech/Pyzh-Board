import SwiftUI
import SwiftData

struct ListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(animation: .default) private var items: [MultiboardItem]
    
    @State private var sheetSettings = false
    @State private var alertExists = false
    
    var body: some View {
        List {
            ForEach(items) { item in
                ItemCard(item)
            }
            .onDelete(perform: deleteItems)
            
            Section {
                Button("Paste") {
                    if let string = UIPasteboard.general.string {
                        attemptItemCreation(string)
                    }
                }
                
                Button("Add") {
                    attemptItemCreation()
                }
                .foregroundStyle(.green)
            }
        }
        .alert("Already exists", isPresented: $alertExists) {
            Button("Yes", role: .destructive) {
                if let string = UIPasteboard.general.string {
                    createItem(string)
                }
            }
        } message: {
            Text("You already have a note with the same content. Are you sure you want to add it?")
        }
    }
    
    func attemptItemCreation(_ content: String = "") {
        guard !items.map ({
            $0.content
        }).contains(content) else {
            alertExists = true
            return
        }
        
        createItem(content)
    }
    
    func createItem(_ content: String = "") {
        modelContext.insert(
            MultiboardItem(content: content)
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
