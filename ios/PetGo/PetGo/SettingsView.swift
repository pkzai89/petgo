import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                HStack(alignment: .center) {
                    Text("Settings")
                        .font(.largeTitle).bold()
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.title2.bold())
                            .foregroundColor(.secondary)
                            .padding(8)
                    }
                }
                // General Section
                SettingsSection(title: "General", rows: [
                    SettingsRow(icon: "paintbrush", title: "Appearance"),
                    SettingsRow(icon: "globe", title: "Language"),
                    SettingsRow(icon: "location", title: "Region")
                ])
                // Preferences Section
                SettingsSection(title: "Preferences", rows: [
                    SettingsRow(icon: "bell", title: "Notifications"),
                    SettingsRow(icon: "lock", title: "Privacy"),
                    SettingsRow(icon: "externaldrive", title: "Data & Storage")
                ])
                // Support Section
                SettingsSection(title: "Support", rows: [
                    SettingsRow(icon: "doc.text", title: "Terms of Service"),
                    SettingsRow(icon: "shield", title: "Privacy Policy")
                ])
                Spacer(minLength: 24)
            }
            .padding(.horizontal, 20)
            .padding(.top, 32)
            .padding(.bottom, 40)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

private struct SettingsSection: View {
    let title: String
    let rows: [SettingsRow]
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 2)
            VStack(spacing: 1) {
                ForEach(0..<rows.count, id: \ .self) { i in
                    rows[i]
                }
            }
        }
        .padding(.bottom, 8)
    }
}

private struct SettingsRow: View, Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.blue)
                .frame(width: 32, height: 32)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
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
