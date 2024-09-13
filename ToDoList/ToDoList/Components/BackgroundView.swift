//
//  BackgroundView.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 1.09.24.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [Color.tdBackground1,Color.tdBackground2], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
