//
//  ViewModel.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 8.08.24.
//

import Foundation

class ViewModel:ObservableObject {
    //MARK: Propreties
    @Published var newTask = ""
    @Published var selectedTask: TaskModel?
    @Published var tasks: [TaskModel] = []
 
    { didSet{
        saveTask()
    }}
    
    let keyUD = "keyUD"
    
    var comletionTasks: Double{
        let totalTasks = tasks.count
        let completionTasks = tasks.filter{$0.isCompleted}.count
        return totalTasks > 0 ? Double(completionTasks) / Double(totalTasks) : 0
    }
    
    
    //MARK: INIT
    
    
    init(){
        
     getTasks()
    }
    //MARK: Methods
    func saveTask(){
        do{
            let encodeTask = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodeTask, forKey: keyUD)
            
        }
        catch{
            print("Error saving task: \(error)")
        }
        
        
    }
    func getTasks(){
        guard let data = UserDefaults.standard.data(forKey: keyUD) else
        {return}
        do{
            let decodeTasks = try JSONDecoder().decode([TaskModel].self, from: data)
            DispatchQueue.main.async{
                self.tasks = decodeTasks}
        }
        catch{
            print("Error loading task: \(error)")
        }
    }
    
    func addTask(task:String){
        let newTask = TaskModel(title:task)
        tasks.append(newTask)
    }
    
    func isCompletedTask(task:TaskModel){
        if let index = tasks.firstIndex(where: {$0.id == task.id}){
            tasks[index].isCompleted.toggle()
        }
    }
    func deleteTask(task:IndexSet){
        tasks.remove(atOffsets: task)
    }
    
    func updateTask(id: UUID, title: String)
    {
        if let index = tasks.firstIndex(where: {$0.id == id}){
            tasks[index].title = title }
       
    }
}
