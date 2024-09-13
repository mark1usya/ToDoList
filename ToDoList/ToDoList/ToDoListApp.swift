//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 8.08.24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = true
    @StateObject var vr = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContainerView()
                .environmentObject(vr)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
