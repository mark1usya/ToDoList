//
//  CustomProgressView.swift
//  ToDoList
//
//  Created by Mark Pashukevich on 27.08.24.
//

import SwiftUI

struct CustomProgressView: View {
    //MARK: - Propreties
    @Binding var progress: CGFloat
    private var barColor: Color
    private var animationTime: TimeInterval = 0.3
    
    public init(initprogress: Binding<CGFloat>, color: Color) {
        self._progress = initprogress
        self.barColor = color
      
    }
    var body: some View{
        GeometryReader{
            geo in
       
            ZStack(alignment: .leading)
        {
            Rectangle()
                .fill(barColor.opacity(0.3))
            
            Rectangle()
                .fill(barColor)
                .frame(width: min(geo.size.width, geo.size.width * progress))
                .animation(.linear)
        }
        .cornerRadius(20)
    }
    }
}
//#Preview {
//    CustomProgressView(progress: 10, barColor: .blue, animationTime: 2)
//}
