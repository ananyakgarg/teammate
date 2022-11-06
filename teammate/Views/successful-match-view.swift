//
//  successful-match-view.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI

struct successful_match_view: View {
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Text("🎉").font(.system(size: 60, weight: .bold))
            Text("Congratulations!").foregroundColor(Color("AccentColor")) .font(.system(size: 30, weight: .bold))
            Text("You've matched with") .foregroundColor(Color("AccentColor")) .font(.system(size: 30, weight: .bold)).padding(.bottom)
                                                        
            Text("Jane Smith")
                .font(.system(size: 24, weight: .semibold)).padding(.bottom)
            Text("You can now chat with them in inbox to get to know one another, form study groups, and learn from one another!")
                .font(.system(size: 16, weight: .regular))
            Button(action: {
                                //userIn(email: email, password: password)
                                
                            }){
                                Text("Take me to inbox")
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 380, height: 50)
                                    .background(Color("AccentColor"))
                                    .cornerRadius(10)
                            }
            Spacer()
        }.padding()
        
    }
}

struct successful_match_view_Previews: PreviewProvider {
    static var previews: some View {
        successful_match_view()
    }
}
