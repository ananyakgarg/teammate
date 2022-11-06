//
//  ViewRouter.swift
//  teammate
//
//  Created by Ananya Garg on 11/5/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore



class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .sign_in_view
    @Published var classArray = []
    @Published var name = ""
    @Published var lastname = ""
    @Published var major = ""
    @Published var classes = []
    private var db = Firestore.firestore()
    
    
    func getFirstName() -> String{
        
        let currentUserID = Auth.auth().currentUser?.uid
        
        let selfRef = db.collection("users").document(currentUserID!)
        selfRef.getDocument(){ (document, error) in
                        guard error == nil else{
                            print("error", error ?? "")
                            return
                        }
                        if let document = document, document.exists{
                            let data = document.data()
                            if let data = data{
                                self.name = data["name"] as? String ?? ""
                            }
                        }
        
                    }
                    return name
    }
    func getLastName() -> String{
        
        let currentUserID = Auth.auth().currentUser?.uid
        
        let selfRef = db.collection("users").document(currentUserID!)
        selfRef.getDocument(){ (document, error) in
                        guard error == nil else{
                            print("error", error ?? "")
                            return
                        }
                        if let document = document, document.exists{
                            let data = document.data()
                            if let data = data{
                                self.lastname = data["lastname"] as? String ?? ""
                            }
                        }
        
                    }
                    return lastname
    }
    
    
    
}



enum Page{
    case sign_in_view
    case sign_up_view
    case message_view
    case inbox_view
    case cards_view
    
}
