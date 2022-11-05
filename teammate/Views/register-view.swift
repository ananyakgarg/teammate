//
//  register-view.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI
import MapKit
import FirebaseAuth
import FirebaseFirestore


struct sign_up_view: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var signUpProcessing = false
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("logo")
            Text("Register")
                .foregroundColor(Color("AccentColor"))
                .font(.system(size: 32, weight: .bold))
            Spacer()
            
            SignUpFields(firstName: $firstName, lastName: $lastName, email: $email, password: $password, passwordConfirm: $passwordConfirm)
            Button(action: {
                  signUpUser(firstname: firstName, lastname: lastName, userEmail: email, userPassword: password)
                                
                            }){
                                Text("Login")
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 380, height: 50)
                                    .background(Color("AccentColor"))
                                    .cornerRadius(10)
                            }
                            .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !passwordConfirm.isEmpty && password == passwordConfirm ? false: true)
            Button(action: {
                                    //viewRouter.currentPage = .signUpPage
                                }){
                                    Text("Have an account? Click here to sign in")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    
            }
            Spacer()
        }
        
        
    }
    
    
    func signUpUser(firstname: String, lastname: String, userEmail: String, userPassword: String){
            print("testing ")
            signUpProcessing = true
            Auth.auth().createUser(withEmail: userEmail, password: userPassword) {authResult,
                error in
                guard error == nil else{
                    signUpProcessing = false
                    return
                }
                    switch authResult{
                    case .none:
                        print("Could not create account.")
                        signUpProcessing = false
                    case .some(_):
                        print("User created")
                        signUpProcessing = false
                        guard let UserID = Auth.auth().currentUser?.uid else{
                            return
                        }
                        let db = Firestore.firestore()
                        let userDocRef = db.collection("riders")
                        // Creates new document in the rider's database, sets the data of the riders
                        userDocRef.document(UserID).setData([
                            "name": firstname,
                            "lastname": lastname,
                            "email": email,
                            "password": password,
                            "id": UserID
                        ])
                        // viewRouter.currentPage = .rideSchedulePage
                    
                }
            
            }
}

struct sign_up_view_Previews: PreviewProvider {
    static var previews: some View {
        sign_up_view().environmentObject(ViewRouter())
    }
}

struct SignUpFields: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordConfirm: String
    var body: some View {
        VStack {
                Group {
                    HStack {
                        VStack {
                            Text("First Name").font(.system(size:16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                            TextField("First Name", text: $firstName)
                                .padding()
                                .font(.system(size:16, weight: .regular))
                                .background(Color.white)
                                .textFieldStyle(.roundedBorder)
                        }
                        VStack{
                            Text("Last Name").font(.system(size:16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                            TextField("Last Name", text: $lastName)
                                .padding()
                                .font(.system(size:16, weight: .regular))
                                .background(Color.white)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                    }
                    Text("UNC Email").font(.system(size:16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                    TextField("UNC Email", text: $email)
                        .padding()
                        .font(.system(size:16, weight: .regular))
                        .background(Color.white)
                        .textFieldStyle(.roundedBorder)
                    Text("Password").font(.system(size:16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                    SecureField("Password", text: $password)
                        .padding([.leading, .bottom, .trailing])
                        .textFieldStyle(.roundedBorder)
                    Text("Confirm Password").font(.system(size:16, weight: .semibold)).frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                    SecureField("Confirm Password", text: $passwordConfirm)
                        .padding([.leading, .bottom, .trailing])
                        .textFieldStyle(.roundedBorder)
                }
            }
        }
    }
    
}
