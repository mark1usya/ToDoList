//
//  ContentView.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 8.08.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskListView()
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
