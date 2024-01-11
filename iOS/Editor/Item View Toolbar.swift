import ScrechKit

struct ItemViewToolbar: View {
    @Bindable private var item: MultiboardItem
    private let dismiss: () -> ()
    
    init(_ item: MultiboardItem, dismiss: @escaping () -> ()) {
        self.item = item
        self.dismiss = dismiss
    }
    
    var body: some View {
        Menu {
            Section {
                MenuButton("Delete", role: .destructive, icon: "trash") {
                    item.modelContext?.delete(item)
                    dismiss()
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
