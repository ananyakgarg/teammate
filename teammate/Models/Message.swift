import Foundation

//Idetifiable Protocol - each message can be unique
//Codable - encodable , decodable
struct Message : Identifiable , Codable{
    var id : String
    var text : String
    var received : Bool
    var timestamp : Date
}

