//
//  ContentView.swift
//  teammate
//
//  Created by Ananya Garg on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        switch viewRouter.currentPage{
        case .sign_in_view:
            sign_in_view()
        case .sign_up_view:
            sign_up_view()
        case .message_view:
            message_view()
        case .inbox_view:
            inbox_view()
        case .cards_view:

            CardView()
        case .bio_view:
            bio_view()
        case .create_a_bio_view:
            create_a_bio_view()
        case .successful_match_view:
            successful_match_view()
        case .stack_view:
            stack_view()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}

