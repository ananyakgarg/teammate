//
//  teammateApp.swift
//  teammate
//
//  Created by Ananya Garg on 11/5/22.
//

import SwiftUI

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct teammateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ParentView().environmentObject(viewRouter)
        }
    }
}
