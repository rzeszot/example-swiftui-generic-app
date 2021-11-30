import SwiftUI

struct DetailsView: View {
  let item: FeedItem

  var body: some View {
    VStack {
      Spacer()
      Text(item.name)
      Spacer()
      Divider()
    }
  }
}
