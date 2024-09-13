//
//  TaskRow.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 15.08.24.
//

import SwiftUI
struct TaskRow: View {
    var model: TaskModel
    
    var body: some View {
        HStack{
            
        }
}

#Preview {
    List{
        TaskRow(model: TaskModel(title: "Task 1", isCompleted: true))
        TaskRow(model: TaskModel(title: "Task 1", isCompleted: false))
    }
    .listStyle(.plain)
}
