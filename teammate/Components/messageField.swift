import SwiftUI

struct messageField: View {
    
    // @EnvironmentObject var messagesManager : MessagesManager
    @State private var message = ""
    
    var body: some View {
        
        HStack{
            CustomTextField(placeholder: Text("Enter your message.."), text:  $message).textFieldStyle(.roundedBorder)
            
            Button{
                // messagesManager.sendMessage(text: message)
                message = ""
            }label:{
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.black)
                    .padding(10)
                    
                
            }
        }
        .padding()
        .background(Color("Green"))
        .cornerRadius(20)
    }
}

struct messageField_Previews: PreviewProvider {
    static var previews: some View {
        messageField()
            
        //.environmentObject(MessagesManager())
    }
}

struct CustomTextField:View{
    var placeholder : Text
    @Binding var text : String
    var editingChanged : (Bool) -> () = { _ in}
    var commit : () -> () = { }
    
    var body : some View {
        ZStack(alignment:.leading){
            if text.isEmpty{
                placeholder
                    .opacity(0.5)
            }
            TextField("",text:$text,onEditingChanged: editingChanged , onCommit: commit)
        }
    }
}
