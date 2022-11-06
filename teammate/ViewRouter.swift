//
//  ViewRouter.swift
//  teammate
//
//  Created by Ananya Garg on 11/5/22.
//

import Foundation



class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .sign_in_view
    @Published var classArray = []
    
}



enum Page{
    case sign_in_view
}
