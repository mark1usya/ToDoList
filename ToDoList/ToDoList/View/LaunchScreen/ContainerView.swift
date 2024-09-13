//
//  ContainerView.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 27.08.24.
//

import SwiftUI

struct ContainerView: View {
    @State private var isLaunchScreenViewPresented = true
    var body: some View {
        if !isLaunchScreenViewPresented{
            ContentView()
        }
        else{
            LaunchScreen(isPresented: $isLaunchScreenViewPresented)
        }
    }
}

#Preview {
    ContainerView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
