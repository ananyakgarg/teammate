import SwiftUI

struct titleRow: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var name = "John Doe"
    var body: some View {
        HStack(spacing: 20){
            Button{
                viewRouter.currentPage = .inbox_view
            } label: {
                Image(systemName: "multiply")
                                .foregroundColor(.white)
            }
            
            Spacer()
            Text(name).font(.system(size: 24, weight: .semibold)).foregroundColor(.white)
            Image(systemName:"")
            Spacer()

        }.frame(maxWidth: .infinity, alignment: .leading).padding()
        
    }
}

struct titleRow_Previews: PreviewProvider {
    static var previews: some View {
        titleRow().background(Color("AccentColor")).environmentObject(ViewRouter())
    }
}
