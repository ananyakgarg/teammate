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
            CardsView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}

