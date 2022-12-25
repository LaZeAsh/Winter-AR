//
//  FirebaseSetUp.swift
//  Winter-AR
//
//  Created by Brayton Lordianto on 12/24/22.
//

import Foundation
import Firebase
import UIKit
import FirebaseStorage


func uploadImage(image: UIImage) {
    let storageRef = Storage.storage().reference()
    let imageData = image.jpegData(compressionQuality: 0.8)
    guard let imageData = imageData else { return }
    let fileRef = storageRef.child("\(UUID().uuidString).jpg")
    let metadata = StorageMetadata()
    metadata.contentType = ".jpg"
    let uploadTask = fileRef.putData(imageData, metadata: metadata) { metadata, error in
        // optinoally add to the database. this is the completion func.
    }
}



let a = """
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
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
"""
