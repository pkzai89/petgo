import SwiftUI

struct ShopView: View {
    @EnvironmentObject private var appState: AppState

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Shop")
                    .font(.largeTitle)
                    .fontWeight(.semibold)

                LazyVGrid(columns: columns, spacing: 16) {
                    Button(action: {
                        if appState.authStatus == .loggedOut {
                            appState.activeModal = .login
                        } else {
                            appState.activeModal = .addPet
                        }
                    }) {
                        productCard("Treats")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        if appState.authStatus == .loggedOut {
                            appState.activeModal = .login
                        } else {
                            appState.activeModal = .addPet
                        }
                    }) {
                        productCard("Toys")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        if appState.authStatus == .loggedOut {
                            appState.activeModal = .login
                        } else {
                            appState.activeModal = .addPet
                        }
                    }) {
                        productCard("Accessories")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        if appState.authStatus == .loggedOut {
                            appState.activeModal = .login
                        } else {
                            appState.activeModal = .addPet
                        }
                    }) {
                        productCard("Food")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(20)
        }
        .background(Color(.systemGroupedBackground))
    }

    private func productCard(_ title: String) -> some View {
        VStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 120)

            Text(title)
                .font(.headline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8)
    }
}
