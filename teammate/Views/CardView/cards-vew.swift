//
//  CardsView.swift
//  teammate
//
//  Created by Ananya Garg on 11/5/22.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        Text("Hello World")
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().environmentObject(ViewRouter())
    }
}
