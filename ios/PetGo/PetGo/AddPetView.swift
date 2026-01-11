import SwiftUI

struct AddPetView: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var appState: AppState

    @State private var petName: String = ""
    @State private var petType: String = "Dog"

    var body: some View {
        VStack(spacing: 24) {

            // Header
            VStack(alignment: .leading, spacing: 6) {
                Text("Add Your Pet")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Create a profile to personalise PetGo")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)

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

            Spacer()

            // Primary action
            Button {
                appState.completeOnboarding()
                dismiss()
            } label: {
                Text("Save Pet")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(14)
                    .fontWeight(.semibold)
            }
        }
        .padding(20)
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    AddPetView()
        .environmentObject(AppState())
}
