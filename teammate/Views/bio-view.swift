//
//  bio-view.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI

struct bio_view: View {
    @State var firstName : String = "John"
    @State var lastName : String = "Doe"
    @State var major : String = "Computer Science"
    @State var classes : [String] = ["COMP283: Discrete Structures","COMP210: Data Structures","ENGL105i: Writing in Science","HIST365: Queer History"]
    @State var clubs : [String] = ["HackNC","SEASA","DTH"]
    @State var interests : [String] = ["Reading"," Coding","Baking"]
    
    var body: some View {
        VStack{
            Spacer()
            Text(firstName + " " + lastName)
    .foregroundColor(Color("AccentColor"))
                .font(.system(size: 32, weight: .bold))
            Text(major)
                .font(.system(size: 24, weight: .semibold))
            VStack {
                Text("Classes")
                    .font(.system(size: 16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Text(classes[0])
            .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color(
                "AccentColor").opacity(0.25)).cornerRadius(10)
                    Text(classes[1])
            .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color("AccentColor").opacity(0.25)).cornerRadius(10)
                }
                HStack{
                    Text(classes[2])
            .frame(maxWidth: .infinity, alignment: .leading).padding().background(Color("AccentColor").opacity(0.25)).cornerRadius(10)
                    
                    Text(classes[3])
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
        bio_view()
    }
}
