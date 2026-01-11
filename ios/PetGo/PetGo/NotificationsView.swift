import SwiftUI

struct NotificationsView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                HStack(alignment: .center) {
                    Text("Notification Preferences")
                        .font(.largeTitle).bold()
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.title2.bold())
                            .foregroundColor(.secondary)
                            .padding(8)
                    }
                }
                VStack(spacing: 16) {
                    NotificationCard(icon: "bell.badge", title: "Reminders", subtitle: "Enabled by default")
                    NotificationCard(icon: "photo.on.rectangle", title: "Memories", subtitle: "Enabled by default")
                    NotificationCard(icon: "cart", title: "Product Updates", subtitle: "Enabled by default")
                    NotificationCard(icon: "mappin.and.ellipse", title: "Nearby Places", subtitle: "Enabled by default")
                }
                Spacer(minLength: 24)
            }
            .padding(.horizontal, 20)
            .padding(.top, 32)
            .padding(.bottom, 40)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

private struct NotificationCard: View {
    let icon: String
    let title: String
    let subtitle: String
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.blue)
                .frame(width: 32, height: 32)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.blue)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color(.black).opacity(0.06), radius: 4, x: 0, y: 2)
    }
}
