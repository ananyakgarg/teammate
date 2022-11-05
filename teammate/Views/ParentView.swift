//
//  ContentView.swift
//  teammate
//
//  Created by Ananya Garg on 11/5/22.
//

import SwiftUI

struct ParentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage{
        case .sign_in_view:
            sign_in_view()
        // case .sign_up_view:
            /// add page after pull
        }
    }
}


struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView().environmentObject(ViewRouter())
    }
}
