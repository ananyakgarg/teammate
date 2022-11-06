//
//  bottomNavigationForm.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI

struct bottomNavigationForm: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        TabView{
            
            inbox_view().tabItem(){
                Image(systemName: "bubble.left.and.bubble.right.fill")
                Text("Chat")
            }
            stack_view().tabItem(){
                Image(systemName: "figure.stand.line.dotted.figure.stand")
                Text("Find your buddy")
            }
            bio_view().tabItem(){
                Image(systemName: "person.fill")
                Text("Bio")
            }
        }
}

struct bottomNavigationForm_Previews: PreviewProvider {
    static var previews: some View {
        bottomNavigationForm().environmentObject(ViewRouter())
    }
}
}
