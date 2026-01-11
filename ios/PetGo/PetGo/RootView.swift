import SwiftUI

struct RootView: View {

    @EnvironmentObject private var appState: AppState

    var body: some View {
        TabView {

            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "map")
                }

            Color.clear
                .tabItem {
                    Label("Add", systemImage: "plus")
                }

            ShopView()
                .tabItem {
                    Label("Shop", systemImage: "bag")
                }

            MemoriesView()
                .tabItem {
                    Label("Memories", systemImage: "heart")
                }
        }
        .sheet(item: $appState.activeModal) { modal in
            switch modal {

            case .addPet:
                AddPetView()

            case .addMemory:
                AddMemoryView()

            case .addReminder:
                AddReminderView()

            case .petDetail:
                PetDetailPlaceholderView()

            case .reminderDetail:
                ReminderDetailPlaceholderView()

            case .placeDetail:
                PlaceDetailPlaceholderView()

            case .productDetail:
                ProductDetailPlaceholderView()

            case .memoryDetail:
                MemoryDetailPlaceholderView()

            case .profile:
                ProfileView()

            case .settings:
                SettingsView()

            case .notifications:
                NotificationsView()

            case .help:
                HelpView()
            }
        }
    }
}
