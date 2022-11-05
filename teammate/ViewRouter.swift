//
//  ViewRouter.swift
//  teammate
//
//  Created by Ananya Garg on 11/5/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseCore


class ViewRouter: ObservableObject{
    @Published var currentPage: Page = .sign_in_view
    
    
    
}



enum Page{
    case sign_in_view
}
