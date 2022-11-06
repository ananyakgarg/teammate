//
//  inbox-view.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import SwiftUI

struct inbox_view: View {
    var messages: [MessageInList] = [MessageInList(unreadIndicator: "unreadIndicator",name: "Jane Smith", messageSummary: "Hi! Nice to meet you. I'm so glad, I found...", timestamp: "9:30 PM"),MessageInList(unreadIndicator: "",name: "Ananya Garg", messageSummary: "Do you want to meet at Sitty for COMP210?", timestamp: "9:15 AM"),MessageInList(unreadIndicator: "",name: "Meliora Ho", messageSummary: "How did you do on the midterm?", timestamp: "8:40 AM"),MessageInList(unreadIndicator: "unreadIndicator",name: "Aniruddh Doki", messageSummary: "How are you with research?", timestamp: "11:40 PM")]
    let readIndicator = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    var body: some View {
        VStack{
            Spacer()
            Text("Inbox")
                .foregroundColor(Color("AccentColor"))
                .font(.system(size: 32, weight: .bold))
            
            List(messages) { item in
                            HStack {
                                ZStack {
                                    readIndicator
                                        .frame(width: 11, height: 11)
                                    Image(item.unreadIndicator)
                                }

                                VStack(alignment: .leading){
                                    HStack{
                                        Text("\(item.name)").font(.system(size:24, weight: .semibold))

                                        Spacer()

                                        Text("\(item.timestamp)")
                                    .font(.system(size:16, weight: .regular))
                                            .foregroundColor(.secondary)

                                        Image(systemName: "chevron.forward")
                                            .font(.headline)
                                            .foregroundColor(.secondary)
                                    }

                                    Text("\(item.messageSummary)")
                                        .font(.system(size:16, weight: .regular))
                                        .foregroundColor(.secondary)
                                
                                    
                                    Spacer()
                                }
                            }
                        }
            .padding().listStyle(.plain)
        }
    }
}

struct inbox_view_Previews: PreviewProvider {
    static var previews: some View {
        inbox_view()
    }
}
