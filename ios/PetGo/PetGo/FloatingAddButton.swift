import SwiftUI

struct FloatingAddButton: View {
    @EnvironmentObject private var appState: AppState
    let action: () -> Void

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    if appState.authStatus == .loggedIn {
                        action()
                    }
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 56, height: 56)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 4)
                }
                .opacity(appState.authStatus == .loggedIn ? 1.0 : 0.4)
                .disabled(appState.authStatus != .loggedIn)
                .padding(.trailing, 20)
                .padding(.bottom, 90)
            }
        }
    }
}
