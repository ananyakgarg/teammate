//
//  CardsView.swift
//  teammate
//
//  Created by Ananya Garg on 11/5/22.
//

import SwiftUI


struct CardView: View {
    @State private var translation: CGSize = .zero
    
    // 1
    private var user: User
    private var onRemove: (_ user: User) -> Void
    
     // 2
    private var thresholdPercentage: CGFloat = 0.5 // when the user has draged 50% the width of the screen in either direction
    
    // 3
    init(user: User, onRemove: @escaping (_ user: User) -> Void) {
        self.user = user
        self.onRemove = onRemove
    }
    
     // 4
    /// What percentage of our own width have we swipped
    /// - Parameters:
    ///   - geometry: The geometry
    ///   - gesture: The current gesture translation value
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack {
                    VStack{
                        Text(self.user.firstName + " " + self.user.lastName)
                            .font(.system(size: 24, weight: .bold))
                        
                        VStack {
                            Text("Classes")
                                .font(.system(size: 16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                            HStack{
                                Text(self.user.classes[0])
                        .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color(
                            "AccentColor").opacity(0.25)).cornerRadius(10)
                                Text(self.user.classes[1])
                                    .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color("AccentColor").opacity(0.25)).cornerRadius(10)
                            }
                            HStack{
                                Text(self.user.classes[2])
                        .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color("AccentColor").opacity(0.25)).cornerRadius(10)
                                
                                Text(self.user.classes[3])
                        .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color("AccentColor").opacity(0.25)).cornerRadius(10)
                            }
                            

                        }.padding()
                        VStack {
                            Text("Interests")
                                .font(.system(size: 16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                            HStack{
                                Text(self.user.interests[0])
                        .frame(maxWidth: .infinity, alignment: .center).padding().background(Color("Orange")).cornerRadius(10)
                                Text(self.user.interests[1])
                                    .frame(maxWidth: .infinity, alignment: .center).padding().background(Color("Orange")).cornerRadius(10)
                                Text(self.user.interests[2])
                        .frame(maxWidth: .infinity, alignment: .center).padding().background(Color("Orange")).cornerRadius(10)

                        }.padding()
                        VStack {
                            Text("Clubs")
                                .font(.system(size: 16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                            HStack{
                                Text(self.user.clubs[0])
                        .frame(maxWidth: .infinity, alignment: .center).padding().background(Color("Orange")).cornerRadius(10)
                                Text(self.user.clubs[1])
                                    .frame(maxWidth: .infinity, alignment: .center).padding().background(Color("Orange")).cornerRadius(10)
                                Text(self.user.clubs[2])
                        .frame(maxWidth: .infinity, alignment: .center).padding().background(Color("Orange")).cornerRadius(10)
                            }
                           

                        }.padding()
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .offset(x: self.translation.width, y: 0) 
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                    }.onEnded { value in
                        // 6
                        // determine snap distance > 0.5 aka half the width of the screen
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.user)
                        } else {
                            self.translation = .zero
                        }
                    }
            )
        }
}
}



// 7
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(user: User(id: 1, firstName: "Jonathan", lastName: "Xing", major: "Economics", classes: ["MATH233","COMP110","ENGL105i","HIST365"], clubs: ["UNC PM","CUSA","KTP"], interests: ["Reading"," Acting","Skiing"]),
                 onRemove: { _ in
                    // do nothing
            })
            .frame(height: 400)
            .padding()
    }
}

}
