import SwiftUI

struct RootView: View {

    @EnvironmentObject private var appState: AppState
    @State private var showAddMenu: Bool = false

    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                ExploreView()
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Explore")
                    }
                Color.clear
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                        Text("Add")
                    }
                ShopView()
                    .tabItem {
                        Image(systemName: "bag.fill")
                        Text("Shop")
                    }
                MemoriesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Memories")
                    }
            }

            FloatingAddButton {
                if appState.authStatus == .loggedOut {
                    appState.activeModal = .profile // will be replaced with .login modal below
                    appState.activeModal = nil // ensure modal resets
                    appState.activeModal = .login
                } else {
                    showAddMenu = true
                }
            }

            // Defensive: Only show menu if logged in
            if appState.authStatus == .loggedIn {
                FloatingAddMenu(isPresented: $showAddMenu)
                    .environmentObject(appState)
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
            case .login:
                LoginView().environmentObject(appState)
            }
        }
    }
}
