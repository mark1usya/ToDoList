//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 8.08.24.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss
   
    var body: some View {
        ZStack {
            //MARK: TextField
            LinearGradient(colors: [Color.tdBackground1,Color.tdBackground2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                
                //MARK: Textfield
              CustomTextField(placeHolder: "Enter Your New Task")
                
                //MARK: Add Task Button
                CustomButton(titleButton: "Add task") {
                    vm.addTask(task: vm.newTask)
                }
                .disabled(vm.newTask.isEmpty)
                Spacer()
                
            }
            .padding()
        }
        //MARK: - Navigation Bar
        .navigationTitle("Add Task")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading)
            {
                Button{
                    dismiss()
                }
            label:{
                Image(systemName: "chevron.left")
                    .font(.headline)
                    .foregroundColor(Color.tdAccesnt)
            }
            }
        }
        .onAppear{
            vm.newTask = ""
        }
    }
}
#Preview {
    AddTaskView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
