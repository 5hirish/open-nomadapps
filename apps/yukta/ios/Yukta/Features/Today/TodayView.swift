import SwiftUI
import YuktaKit

/// Placeholder until the "This week" board from Claude Design is synced into
/// design/yukta/ (spec: docs/yukta/design/design-brief.md).
struct TodayView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView {
                Label("Learning your numbers", systemImage: "scalemass")
            } description: {
                Text("Log what you eat and weigh in a few times a week. Your expenditure estimate appears after about two weeks.")
            }
            .navigationTitle("This week")
        }
    }
}

#Preview {
    TodayView()
}
