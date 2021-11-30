import SwiftUI

struct FeedItem: Identifiable {
  let name: String
  var id: String { name }
}

struct FeedView: View {
  let items: [FeedItem]
  let build: (FeedItem) -> AnyView

  var body: some View {
    List(items) { item in
      NavigationLink(item.name, destination: build(item))
    }
  }

}
