import SwiftUI

struct MemoryView: View {
  @Binding var memory: Double
  var geometry: GeometryProxy

  var body: some View {
      #if !targetEnvironment(macCatalyst)
      let memorySwipe = DragGesture(minimumDistance: 20)
          .onEnded { _ in
              memory = 0.0
          }
      #else
      let doubleTap = TapGesture(count: 2)
          .onEnded { _ in
              memory = 0.0
          }
      #endif
      
      
      
    HStack {
      Spacer()
        #if !targetEnvironment(macCatalyst)
      Text("\(memory)")
            .accessibilityIdentifier("memoryDisplay")
        .padding(.horizontal, 5)
        .frame(
          width: geometry.size.width * 0.85,
          alignment: .trailing
        )
        .overlay(
          RoundedRectangle(cornerRadius: 8)
            .stroke(lineWidth: 2)
            .foregroundColor(Color.gray)
        )
        .gesture(memorySwipe)
        #else
        Text("\(memory)")
              .accessibilityIdentifier("memoryDisplay")
          .padding(.horizontal, 5)
          .frame(
            width: geometry.size.width * 0.85,
            alignment: .trailing
          )
          .overlay(
            RoundedRectangle(cornerRadius: 8)
              .stroke(lineWidth: 2)
              .foregroundColor(Color.gray)
          )
        .gesture(doubleTap)
        #endif
      Text("M")
    }.padding(.bottom).padding(.horizontal, 5)
  }
}
