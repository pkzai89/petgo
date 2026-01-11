import SwiftUI

struct RootView: View {

    @EnvironmentObject private var session: AppSession

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            Text("Explore")
                .tabItem {
                    Image(systemName: "map")
                    Text("Explore")
                }

            Text("Add")
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Add")
                }

            Text("Shop")
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Shop")
                }

            Text("Memories")
                .tabItem {
                    Image(systemName: "photo.on.rectangle")
                    Text("Memories")
                }
        }
    }
}
