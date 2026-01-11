import SwiftUI

struct ShopView: View {
    @EnvironmentObject private var appState: AppState

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Shop")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                LazyVGrid(columns: columns, spacing: 16) {
                    ShopCard(title: "Pet Toys", icon: "ball.fill", loggedIn: appState.authStatus == .loggedIn)
                    ShopCard(title: "Food & Treats", icon: "fork.knife", loggedIn: appState.authStatus == .loggedIn)
                    ShopCard(title: "Accessories", icon: "bag.fill", loggedIn: appState.authStatus == .loggedIn)
                    ShopCard(title: "Health", icon: "cross.case.fill", loggedIn: appState.authStatus == .loggedIn)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}

private struct ShopCard: View {
    let title: String
    let icon: String
    let loggedIn: Bool

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.blue.opacity(0.15))
                    .frame(height: 90)
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
            }
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            if loggedIn {
                Button(action: {}) {
                    Text("Buy now")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            } else {
                Text("Sign in to purchase")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 6)
    }
}
