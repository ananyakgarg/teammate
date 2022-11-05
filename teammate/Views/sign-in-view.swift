//
//  sign-in-view.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseCore



struct sign_in_view: View {
    
    @EnvironmentObject  var viewRouter: ViewRouter
    
    @State  var email = ""
    
    @State private var password = ""
    
    @State var signInProcess = false
    
    @State var signInError = ""
    
    var body: some View {
        Color(red: 0, green: 0, blue: 0)
                        .ignoresSafeArea()
        
        VStack{
        Spacer()
        Text("Welcome Back!")
            .foregroundColor(.white)
            .font(.system(size: 40, weight: .bold))
    }
}
}

struct sign_in_view_Previews: PreviewProvider {
    static var previews: some View {
        sign_in_view().environmentObject(ViewRouter())
    }
}
