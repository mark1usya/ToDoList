//
//  CustomButton.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 18.08.24.
//

import SwiftUI

struct CustomButton: View {
    @EnvironmentObject var vm: ViewModel
    @Environment (\.dismiss) private var dismiss
    let titleButton: String
    let action: () -> ()
    var body: some View {
        Button{
            vm.addTask(task: vm.newTask)
            dismiss()
        }
    label:{
        Text(titleButton)
            .font(.headline)
            .padding()
            .foregroundColor(Color.toDoBackground1)
            .frame(maxWidth: .infinity)
            .background(Color.tdAccesnt)
            .cornerRadius(10)
    }
    }
}
#Preview {
CustomButton(titleButton:"save"){} .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
