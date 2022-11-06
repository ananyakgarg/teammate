//
//  bottomNavigationForm.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI

struct bottomNavigationForm: View {
    var body: some View {
        TabView{
            Text("").tabItem(){
                Image(systemName: "house")
                Text("Home")
            }
            inbox_view().tabItem(){
                Image(systemName: "bubble.left.and.bubble.right.fill")
                Text("Chat")
            }
            Text("Favourites Screen").tabItem(){
                Image(systemName: "figure.stand.line.dotted.figure.stand")
                Text("Find your buddy")
            }
            Text("Favourites Screen").tabItem(){
                Image(systemName: "person.fill")
                Text("Bio")
            }
        }
}

struct bottomNavigationForm_Previews: PreviewProvider {
    static var previews: some View {
        bottomNavigationForm()
    }
}
}
