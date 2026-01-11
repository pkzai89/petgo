import SwiftUI

struct RootView: View {

    @EnvironmentObject private var appState: AppState
    @State private var showAddMenu = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                AppTopBar()
                TabView {
                    HomeView()
                        .environmentObject(appState)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    ExploreView()
                        .environmentObject(appState)
                        .tabItem {
                            Image(systemName: "map")
                            Text("Explore")
                        }
                    EmptyView()
                        .tabItem {
                            Image(systemName: "plus.circle.fill")
                            Text("")
                        }
                    ShopView()
                        .environmentObject(appState)
                        .tabItem {
                            Image(systemName: "bag.fill")
                            Text("Shop")
                        }
                    MemoriesView()
                        .environmentObject(appState)
                        .tabItem {
                            Image(systemName: "photo.on.rectangle")
                            Text("Memories")
                        }
                }
            }
            // Floating Add Button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        Color.clear.frame(width: 0, height: 0)
                        Button(action: {
                            showAddMenu = true
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 64, height: 64)
                                .background(Circle().fill(Color.accentColor))
                                .shadow(color: Color.black.opacity(0.15), radius: 8, y: 2)
                        }
                        .accessibilityLabel("Add")
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                }
                .padding(.bottom, 24)
            }
            // Overlay Menu
            FloatingAddMenu(isPresented: $showAddMenu)
        }
    }
}
