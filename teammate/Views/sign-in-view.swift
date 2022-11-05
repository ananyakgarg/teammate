//
//  sign-in-view.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//
import SwiftUI
import MapKit
import Firebase
import FirebaseFirestore
import FirebaseCore



struct sign_in_view: View {
    
    
    @State  var email = ""
    @State private var password = ""
    @State var signInProcess = false
    @State var signInError = ""
    
    var body: some View {
        
        VStack{
                        Spacer()
                        Image("logo")
                        Text("Welcome Back!")
                .foregroundColor(Color("AccentColor"))
                            .font(.system(size: 32, weight: .bold))
            signInFields(email: $email, password: $password)
            Button(action: {
                                userIn(email: email, password: password)
                                
                            }){
                                Text("Login")
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 380, height: 50)
                                    .background(Color("AccentColor"))
                                    .cornerRadius(10)
                            }
                            .disabled(!signInProcess && !email.isEmpty && !password.isEmpty ? false : true)
            Button(action: {
                                    //viewRouter.currentPage = .signUpPage
                                }){
                                    Text("Don't have an account? Click here to sign up")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    
                                }
            Spacer()
            
        }
    }
    
    
    // to be changed to accept only .edu email
    func userIn(email: String, password: String){
            signInProcess = true
            Auth.auth().signIn(withEmail: email, password: password){
                authResult, error in
                guard error == nil else{
                    signInProcess = false
                    signInError = error!.localizedDescription
                    return
                }
                switch authResult{
                case .none:
                    print("We couldn't sign you in, try again.")
                case .some(_):
                    print("Welcome to the party!")
                    signInProcess = false
    //                viewRouter.currentPage = .requestPage
                }
            }
        }
}


struct sign_in_view_Previews: PreviewProvider {
    static var previews: some View {
        sign_in_view()
    }
}




struct signInFields: View{
    @Binding var email: String
    @Binding var password: String
    
    var body: some View{
        VStack
        {
            
            Text("Email").font(.system(size:16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)

            TextField("Email", text: $email)
                .padding()
                .font(.system(size:16, weight: .regular))
                .background(Color.white)
                .textFieldStyle(.roundedBorder)
            // format this however
            Text("Password").font(.system(size:16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
            
            SecureField("Password", text: $password)
                .padding()
                .font(.system(size:16, weight: .regular))
                .background(Color.white)
                .textFieldStyle(.roundedBorder)
            // format this however
        }.padding()
    }
}
