//
//  create-a-bio-view.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI

struct create_a_bio_view: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var majorOptions = ["Select","Computer Science","Statistics","Mathematics","Literature","Biology"]
    @State var classOptions = ["Select","COMP210","COMP283","MATH233","ENGL105i","LFIT100"]
    @State var majorCall = false
    @State var major = ""
    @State var classes = ""
    var classList: [String] = []
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                Spacer()
                Text("Hi John, tell us more about you").foregroundColor(Color("AccentColor"))
                    .font(.system(size: 32, weight: .bold))
                VStack (alignment: .leading) {
                    Text("Academics")
                        .font(.system(size: 24, weight: .semibold))
                    Text("What is your major?")
                        .font(.system(size: 16, weight: .semibold))
                    Picker("Select", selection: $viewRouter.major)
                    {
                        ForEach(majorOptions, id: \.self){
                            item in
                            Text(item).tag(item)
                        }
                    }
                    Text("What classes are you taking?")
                        .font(.system(size: 16, weight: .semibold))
                    Picker("Select", selection: $viewRouter.classes[0]) {
                        ForEach(classOptions, id: \.self){
                            item in
                            Text(item).tag(item)
                            
                        }
                        
                    }
                    
                    Picker("Select", selection: $viewRouter.classes[1]) {
                        ForEach(classOptions, id: \.self){
                            item in
                            Text(item).tag(item)
                            
                        }
                    }
                    Picker("Select", selection: $viewRouter.classes[2]) {
                        ForEach(classOptions, id: \.self){
                            item in
                            Text(item).tag(item)
                           
                        }
                       
                    }
                    
                    .foregroundColor(.black)
                    Picker("Select", selection: $viewRouter.classes[3]) {
                            ForEach(classOptions, id: \.self){
                                item in
                                Text(item).tag(item)
                                
                        }
                    }
                        
                }
                
                VStack (alignment: .leading){
                    
                }
                
                
            }.padding()
            Button(action: {
                                viewRouter.currentPage = .cards_view
                                }){
                                    Text("Find my teammate")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                }
        }.frame(maxWidth: .infinity)
        
        
    }
        
}
struct create_a_bio_view_Previews: PreviewProvider {
    static var previews: some View {
        create_a_bio_view().environmentObject(ViewRouter())
    }
}

