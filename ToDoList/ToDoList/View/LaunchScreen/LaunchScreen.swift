//
//  LaunchScreen.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 27.08.24.
//

import SwiftUI

struct LaunchScreen: View {
    @Binding var isPresented: Bool
    @State var progress: CGFloat = 0.0
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.tdBackground1,Color.tdBackground2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color.tdPrimary.opacity(0.25))
                    .frame(width: 100,height: 100)
                Image(systemName: "checkmark")
                    .font(.largeTitle)
                    .foregroundColor(Color.tdPrimary)
                VStack{
                    Spacer()
                    CustomProgressView(initprogress: $progress, color: Color.tdPrimary)
                        .frame(height:8)
                        .onReceive([self.progress].publisher) { _ in
                            if self.progress >= 1.0 {
                                self.isPresented = false
                            }
                            
                        }
                }.padding(.bottom,30)
                    .padding(.horizontal, 40)
            }
        }
        .onAppear{
            self.startTimer()
        }
    }
    func startTimer(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
            self.progress += 0.05
        }
    }
}

#Preview {
    LaunchScreen(isPresented: .constant(true))
}
