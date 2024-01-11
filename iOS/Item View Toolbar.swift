import ScrechKit

struct ItemViewToolbar: View {
    @Bindable private var item: MultiboardItem
    
    init(_ item: MultiboardItem) {
        self.item = item
    }
    
    var body: some View {
        Menu {
            Section {
                MenuButton("Delete", role: .destructive, icon: "trash") {
                    item.modelContext?.delete(item)
                }
            }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
    }
}

//#Preview {
//    ItemViewToolbar()
//}
