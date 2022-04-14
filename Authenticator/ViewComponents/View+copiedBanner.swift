import SwiftUI

struct CopiedBannerModifier: ViewModifier {

    let code: String

    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                Text("Copied \"\(code)\"")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 40)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
            }
        }
    }

}

extension View {

    func copiedBanner(code: String, isPresented: Binding<Bool>) -> some View {
        self.modifier(CopiedBannerModifier(code: code, isPresented: isPresented))
    }

}
