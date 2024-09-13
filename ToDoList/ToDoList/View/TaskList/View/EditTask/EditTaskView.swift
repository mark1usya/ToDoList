//
//  EditTaskView.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 18.08.24.
//

import SwiftUI

struct EditTaskView: View {
    @EnvironmentObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss
    var task: TaskModel
    
    var body: some View {
        VStack{
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/ ){
            Text("Edit Task")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .topLeading) {
                        Button{
                            
                        } label: {
                            Text("Cancel")
                                .frame(width: 56)
                                .foregroundColor(Color.tdAccesnt)
                        }
                    }.padding(.vertical)
               
            
                }
            CustomTextField(placeHolder: "Enter Your New Task")
            CustomButton(titleButton: "Save") {
                vm.updateTask(id: task.id, title: vm.newTask)
              
            }
            Spacer()
        }
        .padding()
        .background(  BackgroundView())
        .onAppear{
                vm.newTask = task.title
            }
        
    }
}
#Preview {
    EditTaskView(task: TaskModel(title: "Task1"))
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
