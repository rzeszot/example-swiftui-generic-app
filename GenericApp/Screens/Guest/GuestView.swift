import SwiftUI

struct GuestView: View {
  let login: () -> Void
  var content: (Subview, @escaping (Subview?) -> Void) -> AnyView

  enum Subview: String, Identifiable {
    case signin
    case confirm
    case request
    case signup

    var id: String {
      rawValue
    }
  }

  @State
  var subview: Subview?

  var body: some View {
    VStack {
      Spacer()

      Text("Welcome")
        .font(.largeTitle)

      Spacer()

      HStack {
        Button(action: { subview = .signin }) {
          Text("Sign in").padding(10)
        }
        Button(action: { subview = .signup }) {
          Text("Sign up").padding(10)
        }
      }
      .buttonStyle(.borderedProminent)

      Spacer()
      Divider()

      HStack {
        Button(action: { subview = .request }) {
          Text("Request password reset").padding(5)
        }
        Button(action: { subview = .confirm }) {
          Text("Confirm password reset").padding(5)
        }
      }
      .buttonStyle(.borderedProminent)
      Divider()
      Text("GuestView")
    }
    .background(Color.teal)
    .sheet(item: $subview) { id in
      content(id, self.change)
    }
  }

  func change(_ id: Subview?) {
    self.subview = id
  }
}
