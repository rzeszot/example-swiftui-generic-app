import SwiftUI

@main
struct TheApp: App {
  var body: some Scene {
    WindowGroup {
      RootView.build()
    }
  }
}

extension Array where Element == FeedItem {
  static var oceans: [FeedItem] {
    [
      FeedItem(name: "Pacific"),
      FeedItem(name: "Atlantic"),
      FeedItem(name: "Indian"),
      FeedItem(name: "Southern"),
      FeedItem(name: "Arctic")
    ]
  }
  static var colors: [FeedItem] {
    [
      FeedItem(name: "Blue"),
      FeedItem(name: "Red"),
      FeedItem(name: "Yellow"),
      FeedItem(name: "Pink"),
      FeedItem(name: "White")
    ]
  }
}

extension FeedView {
  init() {
    self.items = Bool.random() ? .oceans : .colors
    self.build = { item in
      if Bool.random() {
        return AnyView(
          FeedView()
            .navigationTitle(item.name)
        )
      } else {
        return AnyView(
          DetailsView(item: item)
        )
      }
    }
  }
}

extension MainView {
  static func build(logout: @escaping () -> Void) -> MainView {
    MainView(logout: logout) { id in
      switch id {
      case .dashboard:
        return AnyView(
          DashboardView()
        )
      case .feed:
        return AnyView(
          NavigationView {
            FeedView()
              .navigationTitle("Feed")
          }
        )
      case .profile:
        return AnyView(
          ProfileView(logout: logout)
        )
      }
    }
  }
}

extension GuestView {
  static func build(login: @escaping () -> Void) -> GuestView {
    GuestView(login: login) { id, change in
      let back = { change(nil) }
      let remind = { change(.request) }

      switch id {
      case .signin:
        return AnyView(SignInView(back: back, login: login, remind: remind))
      case .signup:
        return AnyView(SignUpView(back: back, register: login))
      case .request:
        return AnyView(RequestPasswordResetView(back: back))
      case .confirm:
        return AnyView(ConfirmPasswordResetView(back: back, login: login))
      }
    }
  }
}

extension RootView {
  static func build() -> RootView {
    RootView { id, change in
      let guest = { change(.guest) }
      let main = { change(.main) }

      switch id {
      case .main:
        return AnyView(MainView.build(logout: guest))
      case .guest:
        return AnyView(GuestView.build(login: main))
      }
    }
  }
}
