import SwiftUI

struct ItemView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Bindable private var item: MultiboardItem
    
    init(_ item: MultiboardItem) {
        self.item = item
    }
    
    var body: some View {
        List {
            TextField("Title", text: $item.name)
                .title3(.semibold)
                .frame(height: 40)
            
            TextEditor(text: $item.content)
                .frame(minHeight: 50)
            
            Section {
                Button(role: .destructive) {
                    item.modelContext?.delete(item)
                    dismiss()
                } label: {
                    Text("Delete")
                }
            }
        }
        .toolbar {
            ItemViewToolbar(item) {
                dismiss()
            }
        }
        .overlay(alignment: .bottom) {
            ItemViewOverlay(item)
        }
    }
}

//#Preview {
//    NavigationView {
//        ItemView(
//            .init("Preview Title", content: "Preview", createdAt: Date())
//        )
//    }
//}
