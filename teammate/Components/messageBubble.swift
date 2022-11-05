import SwiftUI

struct messageBubble: View {
    
    var message: Message //from models
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Orange") : Color(.systemGray6)) //depend on received
                    .cornerRadius(20)
            }
            .frame(maxWidth:300 , alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            //Click show !
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing , 25)
            }
            
        }
        .frame(maxWidth:.infinity , alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal , 10)
    }
}

struct messageBubble_Previews: PreviewProvider {
    static var previews: some View {
        messageBubble(message: Message(id: "1", text: "Hello!", received: true, timestamp: Date()))
    }
}
