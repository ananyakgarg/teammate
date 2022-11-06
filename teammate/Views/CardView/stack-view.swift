//
//  stack-view.swift
//  teammate
//
//  Created by Clementine on 11/6/22.
//

import SwiftUI

struct stack_view: View {
    
    // 1
    /// List of users
    @State var users: [User] = [User(id: 1, firstName: "Jane", lastName: "Smith", major: "Computer Science", classes: ["COMP283","MATH435","ENGL105i","GEO208"], clubs: ["HackNC","CUSA","ASL"], interests: ["Reading"," Acting","Skiing"]),
        User(id: 2, firstName: "Jonathan", lastName: "Xing", major: "Economics", classes: ["MATH233","COMP110","ENGL105i","HIST365"], clubs: ["UNC PM","CUSA","KTP"], interests: ["Reading"," Acting","Skiing"]),User(id: 3, firstName: "Tomisin", lastName: "Brown", major: "Neuroscience", classes: ["COMP283","MATH435","COMP110","GEO208"], clubs: ["Neuroscience","BIT","DTH"], interests: ["AI","Coding","Baking"])
    ]
    
    // 2
    /// Return the CardViews width for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    // 3
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(users.count - 1 - id) * 10
    }
    
    private var maxID: Int {
         return self.users.map { $0.id }.max() ?? 0
     }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Find a buddy")
    .foregroundColor(Color("AccentColor"))
                .font(.system(size: 32, weight: .bold))
            
            Text("The profiles below are the people with the closest match to your classes and interests")
                .font(.system(size: 16, weight: .regular)).multilineTextAlignment(.center).padding(.bottom)
            
            // 4
            GeometryReader { geometry in
                // 5
                VStack {
                     // 6
                    ZStack {
                        
                        // 7
                        ForEach(self.users, id: \.self) { user in
                            if (self.maxID - 3)...self.maxID ~= user.id {
                                CardView(user: user, onRemove: { removedUser in
                                   // Remove that user from our array
                                   self.users.removeAll { $0.id == removedUser.id }
                                  })
                                  .animation(.spring()) // Animate our changes to our frame
                                  .frame(width: self.getCardWidth(geometry, id: user.id),
                                         height: 400)
                                  .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                            }
                            
                        }
                    }

                }
            }
            Image("Group 1").resizable()
                .scaledToFit() // 3
                .clipped()
            Spacer()
            
        }.padding()
    }
}

struct stack_view_Previews: PreviewProvider {
    static var previews: some View {
        stack_view()
    }
}

struct User: Hashable {
    var id: Int
    var firstName : String
    var lastName : String
    var major : String
    var classes : [String]
    var clubs : [String]
    var interests : [String]
    
}
