import SwiftUI

struct ItemViewOverlay: View {
    @Bindable private var item: MultiboardItem
    
    init(_ item: MultiboardItem) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            ShareLink(item: item.content) {
                Image(systemName: "square.and.arrow.up")
                    .frame(width: 60, height: 70)
                    .background(.blue.gradient, in: .rect(cornerRadius: 16))
            }
            
            Spacer()
            
            Button {
                copy(item.content)
            } label: {
                Image(systemName: "doc.on.doc")
                    .frame(width: 60, height: 70)
                    .background(.green.gradient, in: .rect(cornerRadius: 16))
            }
        }
        .foregroundStyle(.white)
        .title2(.bold)
        .padding()
    }
}

//#Preview {
//    ItemViewOverlay()
//}
