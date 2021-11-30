import SwiftUI

struct MainView: View {
  let logout: () -> Void
  let build: (Subview) -> AnyView

  enum Subview: String, Identifiable {
    case dashboard
    case feed
    case profile

    var id: String {
      rawValue
    }
  }

  var body: some View {
    TabView {
      build(.dashboard)
        .tabItem {
          Image(systemName: "house")
          Text("Dashboard")
        }
      build(.feed)
        .tabItem {
          Image(systemName: "rectangle.grid.1x2")
          Text("Feed")
        }
      build(.profile)
        .tabItem {
          Image(systemName: "person")
          Text("Profile")
        }
    }
    .background(.mint)
  }
}

