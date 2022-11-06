import SwiftUI

struct message_view: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    // @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack{
            titleRow().background(Color("AccentColor"))
            
            ScrollView{
                messageBubble(message: Message(id: "1", text: "Hello!", received: true, timestamp: Date()))
                messageBubble(message: Message(id: "1", text: "Hi!", received: false, timestamp: Date()))
            }.padding(.top , 10)
                .background(Color(.white))
            messageField().background(Color(.white))
            Spacer()
            
        VStack{
            
        }
            
            
        }
        
                
    }
                /*
                messageField().environmentObject(messagesManager)
                    .background(Color("Orange"))
                */

    }

struct message_view_Previews: PreviewProvider {
    static var previews: some View {
        message_view().environmentObject(ViewRouter())
    }
}
