//
//  bio-view.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI

struct bio_view: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var clubs : [String] = ["HackNC","SEASA","DTH"]
    @State var interests : [String] = ["Reading"," Coding","Baking"]
    
    var body: some View {
        VStack{
            Spacer()
            Image("logo")
            Text(viewRouter.getFirstName() + " " + viewRouter.getLastName())
    .foregroundColor(Color("AccentColor"))
                .font(.system(size: 32, weight: .bold))
            Text(viewRouter.getMajor())
                .font(.system(size: 24, weight: .semibold))
            VStack {
                Text("Classes")
                    .font(.system(size: 16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Text(viewRouter.getClasses()[0])
            .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color(
                "AccentColor").opacity(0.25)).cornerRadius(10)
                    Text(viewRouter.getClasses()[1])
            .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color("AccentColor").opacity(0.25)).cornerRadius(10)
                }
                HStack{
                    Text(viewRouter.getClasses()[2])
            .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color("AccentColor").opacity(0.25)).cornerRadius(10)
                    
                    Text(viewRouter.getClasses()[3])
            .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color("AccentColor").opacity(0.25)).cornerRadius(10)
                }
                

            }.padding()
            VStack {
                Text("Interests")
                    .font(.system(size: 16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    ForEach(interests, id: \.self) { interest in
                                    Text(interest)
                            .frame(maxWidth: .infinity, alignment: .center).padding().background(Color("Orange")).cornerRadius(10)
                                        
                                }
                }

            }.padding()
            VStack {
                Text("Clubs")
                    .font(.system(size: 16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    ForEach(clubs, id: \.self) { club in
                                    Text(club)
                            .frame(maxWidth: .infinity, alignment: .center).padding().background(Color("Orange")).cornerRadius(10)
                                        
                                }
                }
               

            }.padding()
            Spacer()
        }
    }
}

struct bio_view_Previews: PreviewProvider {
    static var previews: some View {
        bio_view().environmentObject(ViewRouter())
    }
}
