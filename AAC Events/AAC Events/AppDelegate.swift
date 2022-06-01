//
//  AppDelegate.swift
//  AAC Events
//
//  Created by Siar Noorzay on 1/2/18.
//  Copyright © 2018 Afghan American Conference. All rights reserved.
//

import UIKit
import CoreData
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var enrolledSessionIDs: [String] = []
    var allSessions: AllSessions!
    var conferenceEvaluationLink: String! = ""
    var allPeople: [PeopleList]!

    var isAppUnlocked: Bool = false
    var privacyPolicyAccepted: Bool = false
    
    func isEnrolledIn(sessionID: String) -> Bool {
        
        for id in enrolledSessionIDs {
            if sessionID == id {
                return true
            }
        }
        
        return false
    }
    func enrollInSession(sessionID: String) {
        enrolledSessionIDs.append(sessionID)
        UserDefaults.standard.set(enrolledSessionIDs, forKey: "enrolledSessions")
    }
    
    func removeSession(sessionID:String) {
        
        var removingIndex: Int?
        
        for i in 0...enrolledSessionIDs.count - 1 {
            let currentID = enrolledSessionIDs[i]
            if currentID == sessionID {
                removingIndex = i
            }
        }
        guard removingIndex != nil else {
            print("couldn't find enrolled session with ID: \(sessionID)")
            return
        }
        enrolledSessionIDs.remove(at: removingIndex!)
        UserDefaults.standard.set(enrolledSessionIDs, forKey: "enrolledSessions")

    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let unlocked = UserDefaults.standard.string(forKey: "isUnlocked")
        if unlocked != nil {
            self.isAppUnlocked = true
        }

        let accepted = UserDefaults.standard.bool(forKey: "privacyAccepted")
        self.privacyPolicyAccepted = accepted

        OneSignal.setRequiresUserPrivacyConsent(true)
        initOneSignalSDK()
        
        guard let sessions = UserDefaults.standard.array(forKey: "enrolledSessions") as? [String] else {
            print("no enrolled sessions to retrieve")
            return true
        }
        enrolledSessionIDs = sessions

        return true
    }

    private var launchOptions: [UIApplicationLaunchOptionsKey: Any]?

    func initOneSignalSDK() {
        OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
        OneSignal.initWithLaunchOptions(launchOptions)
        OneSignal.setAppId("70531d2d-609a-4093-9b66-b45b03731a4c")
        
        // promptForPushNotifications will show the native iOS notification permission prompt.
        // We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 8)
        OneSignal.promptForPushNotifications(userResponse: { accepted in
          print("User accepted notifications: \(accepted)")
        })
        print("one signal sdk init")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("*****")
        print("registered successfully for remote token")
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("device token: \(deviceTokenString)")


    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("*****")
        print("NOT WORK")
        print("ERROR: \(error)")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "AAC_Events")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

