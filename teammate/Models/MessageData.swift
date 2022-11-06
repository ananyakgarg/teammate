//
//  MessageData.swift
//  teammate
//
//  Created by Clementine on 11/5/22.
//

import Foundation

struct MessageInList: Identifiable{
    var id = UUID()
    var unreadIndicator: String
    var name : String
    var messageSummary: String
    var timestamp: String
}

