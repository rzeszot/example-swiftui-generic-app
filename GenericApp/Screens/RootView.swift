import SwiftUI

struct RootView: View {
  enum Subview: String, Identifiable {
    case guest
    case main

    var id: String {
      rawValue
    }
  }

  let content: (Subview, @escaping (Subview) -> Void) -> AnyView

  @State
  var subview: Subview? = nil

  var body: some View {
    if let subview = subview {
      content(subview, change)
    } else {
      VStack {

        Spacer()
        Divider()

        HStack {
          Button(action: { subview = .guest }) {
            Text("Guest").padding(5)
          }
          Button(action: { subview = .main }) {
            Text("Main").padding(5)
          }
        }
        .buttonStyle(.borderedProminent)

        Divider()
        Text("RootView")
      }
    }
  }

  func change(_ id: Subview) {
    subview = id
  }
}
