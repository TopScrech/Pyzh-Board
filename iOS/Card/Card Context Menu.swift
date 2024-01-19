import ScrechKit

struct CardContextMenu: View {
    @Bindable private var item: MultiboardItem
    @Binding private var sheetEditor: Bool
    
    init(_ item: MultiboardItem, sheetEditor: Binding<Bool>) {
        self.item = item
        _sheetEditor = sheetEditor
    }
    
    var body: some View {
        MenuButton("Edit", icon: "pencil") {
            sheetEditor = true
        }
        
        Divider()
        
        MenuButton("Copy", icon: "doc.on.doc") {
            copy(item.content)
        }
        
        ShareLink(item: item.content) {
            Label("Share...", systemImage: "square.and.arrow.up")
        }
        
        Divider()
        
        MenuButton("Copy and Delete", role: .destructive, icon: "arrow.right.doc.on.clipboard") {
            item.modelContext?.delete(item)
        }
        
        MenuButton("Delete", role: .destructive, icon: "trash") {
            item.modelContext?.delete(item)
        }
    }
}
