import ScrechKit

struct GridItemCard: View {
    @Bindable private var item: MultiboardItem
    
    init(_ item: MultiboardItem) {
        self.item = item
    }
    
    @State private var sheetEditor = false
    
    var body: some View {
        Button {
            sheetEditor = true
        } label: {
            VStack(alignment: .leading) {
                Text(item.name)
                
                if !item.content.isEmpty {
                    Text(item.content)
                        .lineLimit(2)
                        .footnote()
                        .foregroundStyle(.secondary)
                }
            }
            .foregroundStyle(.foreground)
            .frame(width: 200, height: 100)
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 16))
        }
        .sheet($sheetEditor) {
            NavigationView {
                ItemView(item)
            }
        }
        .contextMenu {
            CardContextMenu(item, sheetEditor: $sheetEditor)
        }
    }
}

//#Preview {
//    GridItemCard()
//}
