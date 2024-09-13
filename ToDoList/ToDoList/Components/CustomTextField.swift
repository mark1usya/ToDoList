//
//  CustomTextField.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 18.08.24.
//

import SwiftUI

struct CustomTextField: View {
    @EnvironmentObject var vm: ViewModel
    let placeHolder: String
    var body: some View {
        TextField(placeHolder, text: $vm.newTask)
            .font(.headline)
            .padding(30)
            .background(Color.tdPrimary.opacity(0.15))
            .cornerRadius(10)
    }
}

#Preview {
    CustomTextField(placeHolder: "Enter Your New Task")
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
