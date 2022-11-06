//
//  CardsView.swift
//  teammate
//
//  Created by Ananya Garg on 11/5/22.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        GeometryReader { geometry in
                                
                    // 2
                    VStack(alignment: .leading) {
                        Image("logo")
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.75) // 3
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(viewRouter.getFirstName())
                                    .font(.title)
                                    .bold()
                                Text(viewRouter.getLastName())
                                    .font(.subheadline)
                                    .bold()
                                Text("13 Mutual Friends")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer() // Add a spacer to push our HStack to the left and the spacer fill the empty space
                        }.padding(.horizontal)
                    }
                    // Add padding, corner radius and shadow with blur radius
                    .padding(.bottom)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView().environmentObject(ViewRouter())
    }
}
