import SwiftUI

struct AddPetView: View {

    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) private var dismiss

    @State private var petName: String = ""
    @State private var petType: String = "Dog"

    var body: some View {
        VStack(spacing: 24) {

            // Header
            HStack {
                Text("Add Pet")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)

            // Form
            VStack(spacing: 16) {
                TextField("Pet name", text: $petName)
                    .textFieldStyle(.roundedBorder)

                Picker("Pet type", selection: $petType) {
                    Text("Dog").tag("Dog")
                    Text("Cat").tag("Cat")
                }
                .pickerStyle(.segmented)
            }
            .padding(.horizontal)

            Spacer()

            // Save button (UI-only for now)
            Button {
                // Phase 5.4 will persist to Firestore
                dismiss()
            } label: {
                Text("Save Pet")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
        }
        .padding(.top)
        .background(Color(.systemGroupedBackground))
    }
}
