//
//  Row.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 15.08.24.
//

import SwiftUI

struct Row: View {
    var model: TaskModel
    let action: () -> ()
    var body: some View {
       
            
            HStack{
                model.isCompleted ? Text(model.title).strikethrough().foregroundColor(Color.tdPrimary.opacity(0.5)) : Text(model.title)
                Spacer()
                Button{
                    action()
                }
            label: {Image(systemName:model.isCompleted ? "checkmark.circle.fill" : "circle").foregroundColor(Color.tdAccesnt)
                
            }
            .buttonStyle(.borderless)
            } .font(.headline)
            
                .padding()
                .background(model.isCompleted ? Color.tdPrimary.opacity(0.3) : Color.tdPrimary.opacity(0.25))
                .cornerRadius(10)
               
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .padding(.vertical, 6)
        }
    
}
#Preview {
    
    List{
    Row(model: TaskModel(title: "Task1", isCompleted: false
                        )){ }
    Row(model: TaskModel(title: "Task2", isCompleted: true
                        )){ }
}
.listStyle(.plain)
.preferredColorScheme(.dark)
}
