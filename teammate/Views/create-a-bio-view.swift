//
//  create-a-bio-view.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI

struct create_a_bio_view: View {
    @State var majorOptions = ["Select","Computer Science","Statistics","Mathematics","Literature","Biology"]
    @State var classOptions = ["Select","COMP210","COMP283","MATH233","ENGL105i","LFIT100"]
    @State var interestOptions = ["Select","Competitive Programming","Painting","Baking","Reading","Wrestling"]
    @State var clubOptions = ["Select","HackNC","UNC ACM","UNC AR/VR","Carolina Data Science","Pearl Hacks"]
    @State var major = ""
    @State var classes = ""
    @State var interest = ""
    @State var club = ""

    var body: some View {
        ScrollView(.vertical){
            VStack (alignment: .leading){
                Spacer()
                Text("Hi, tell us more about you").foregroundColor(Color("AccentColor"))
                    .font(.system(size: 32, weight: .bold))
                Spacer()
                VStack (alignment: .leading) {
                    Text("Academics")
                        .font(.system(size: 24, weight: .semibold))
                    Text("What is your major?")
                        .font(.system(size: 16, weight: .semibold))
                    Picker("Select", selection: $major) {
                        ForEach(majorOptions, id: \.self){
                            item in
                            Text(item)
                        }
                    }
                    
                    Text("What classes are you taking?")
                        .font(.system(size: 16, weight: .semibold))
                    Picker("Select", selection: $classes) {
                        ForEach(classOptions, id: \.self){
                            item in
                            Text(item).tag(item)
                            
                        }
                        
                    }
                    Picker("Select", selection: $classes) {
                        ForEach(classOptions, id: \.self){
                            item in
                            Text(item).tag(item)
                            
                        }
                    }
                    Picker("Select", selection: $classes) {
                        ForEach(classOptions, id: \.self){
                            item in
                            Text(item).tag(item)
                           
                        }
                       
                    }
                
                    Picker("Select", selection: $classes) {
                            ForEach(classOptions, id: \.self){
                                item in
                                Text(item).tag(item)
                                
                        }
                    }
                        
                }
                Spacer()
                Spacer()
                VStack (alignment: .leading){
                    Text("Personal")
                        .font(.system(size: 24, weight: .semibold))
                    Text("What are your interests?")
                        .font(.system(size: 16, weight: .semibold))
                    Picker("Select", selection: $interest) {
                            ForEach(interestOptions, id: \.self){
                                item in
                                Text(item).tag(item)
                                
                        }
                    }
                    Picker("Select", selection: $interest) {
                            ForEach(interestOptions, id: \.self){
                                item in
                                Text(item).tag(item)
                                
                        }
                    }
                    Picker("Select", selection: $interest) {
                            ForEach(interestOptions, id: \.self){
                                item in
                                Text(item).tag(item)
                                
                        }
                    }
                    Text("What clubs are you in?")
                        .font(.system(size: 16, weight: .semibold))
                    Picker("Select", selection: $club) {
                            ForEach(clubOptions, id: \.self){
                                item in
                                Text(item).tag(item)
                                
                        }
                    }
                    Picker("Select", selection: $club) {
                            ForEach(clubOptions, id: \.self){
                                item in
                                Text(item).tag(item)
                                
                        }
                    }
                    Picker("Select", selection: $club) {
                            ForEach(clubOptions, id: \.self){
                                item in
                                Text(item).tag(item)
                                
                        }
                    }
                }
                Button(action: {}){
                                    Text("Complete")
                                        .foregroundColor(.white)
                                        .bold()
                                        .frame(width: 380, height: 50)
                                        .background(Color("AccentColor"))
                                        .cornerRadius(10)
                                }
                
            }.padding()
        }.frame(maxWidth: .infinity)
        
        
    }
        
}

struct create_a_bio_view_Previews: PreviewProvider {
    static var previews: some View {
        create_a_bio_view()
    }
}

