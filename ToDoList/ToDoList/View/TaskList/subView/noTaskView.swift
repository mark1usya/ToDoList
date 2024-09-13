//
//  noTaskView.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 26.08.24.
//

import SwiftUI

struct NoTasksView: View {
    var body: some View {
        VStack{
            
            Spacer()
            Text("THERE ARE NO TASKS\nWOULD YOU LIKE\nTO ADD?")
                .multilineTextAlignment(.center)
                .font(.title)
                .foregroundColor(Color.tdPrimary)
                .opacity(0.5)
            
            Spacer()
            NavigationLink(destination: AddTaskView()) {
                
                
                ZStack {
                    Circle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.tdPrimary)
                        .opacity(0.5)
                    
                    Image(systemName: "plus")
                        .foregroundColor(Color.tdPrimary)
                }
            }
        }
    }
}


#Preview {
    NoTasksView()
        .preferredColorScheme(.dark)
    
}
