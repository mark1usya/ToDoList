//
//  TaskListView.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 8.08.24.
//

import SwiftUI


struct TaskListView: View {
    
    @EnvironmentObject var vm: ViewModel
    @State private var isEditViewPresented = false
    //MARk: - Body
    var body: some View {
        NavigationView{
            ZStack{
                //MARK: Background
                BackgroundView()
                
                VStack{
                    
                    if vm.tasks.isEmpty{
                        
                        NoTasksView()
                    }
                    else {
                        List {
                            
                            ForEach(vm.tasks) { task in
                                Row(model: task) {
                                    vm.isCompletedTask(task: task)
                                }
                                .onTapGesture {
                                    vm.selectedTask = task
                                    isEditViewPresented = true
                                }
                            }
                            .onDelete(perform:vm.deleteTask)
                            
                            .sheet(isPresented: $isEditViewPresented, content: {
                                if let taskToEdit = vm.selectedTask{
                                    EditTaskView(task: taskToEdit)
                                }
                            })
                            
                        }
                        .listStyle(.plain)
                        
                        
                        ProgressView("Compelation Task", value: vm.comletionTasks)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(Color.tdPrimary)
                            .padding()
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                }
                
            }
            .navigationTitle("To Do List")
            .toolbar  {
                ToolbarItem(placement: .topBarTrailing)  {
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.tdPrimary)
                    }
                }
            }
        }
        
    }
    }


#Preview {
    TaskListView()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}

