import SwiftUI

struct ItemCard: View {
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
        }
        .sheet($sheetEditor) {
            NavigationView {
                ItemView(item)
            }
        }
    }
}

//#Preview {
//    ItemCard()
//}
