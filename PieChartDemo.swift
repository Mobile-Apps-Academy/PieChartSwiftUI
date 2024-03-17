//
// Created By: Mobile Apps Academy
// Subscribe : https://www.youtube.com/@MobileAppsAcademy?sub_confirmation=1
// Medium Blob : https://medium.com/@mobileappsacademy
// LinkedIn : https://www.linkedin.com/company/mobile-apps-academy
// Twitter : https://twitter.com/MobileAppsAcdmy
// Lisence : https://github.com/Mobile-Apps-Academy/MobileAppsAcademyLicense/blob/main/LICENSE.txt
//

import SwiftUI
import Charts

var monthlyExpenses = [
    (expense: "Rent", amount: 350),
    (expense: "Food", amount: 300),
    (expense: "Electricity", amount: 100),
    (expense: "Internet", amount: 50),
    (expense: "Fuel", amount: 100),
    (expense: "Misc", amount: 100)
]

struct PieChartDemo: View {
    var body: some View {
        ZStack {
            Chart {
                ForEach(monthlyExpenses, id: \.expense) { expense in
                    SectorMark(
                        angle: .value("Expense", expense.amount),
                        innerRadius: .ratio(0.6),
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Type", expense.expense))
                    .cornerRadius(10.0)
                    .annotation(position: .overlay) {
                        Text("\(expense.amount)$")
                            .font(.system(size: 14))
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
            }
        }
        .frame(height: 500)
        .padding(30)
    }
}

#Preview {
    PieChartDemo()
}
