import SwiftUI

struct ContentView: View {
    @StateObject var appViewModel = AppViewModel()
    @State var selectedServer: String?

    var body: some View {
       switch appViewModel.screen {
       case .loading:
           ProgressView()
               .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .onboarding:
            OnboardingView(accountController: appViewModel.accountController)
                .transition(
                    .move(edge: .bottom)
                )
                .zIndex(100)
        case .timeline(let controller):
            MastodonTimelineView(controller: controller)
                .environmentObject(appViewModel.accountController)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
