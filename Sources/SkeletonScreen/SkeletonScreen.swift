// SkeletonScreen
// Bin Hua <https://tourcoder.com>

import SwiftUI

public struct SkeletonScreen: View {

    var skeletonColor: Color
    var skeletonHeight: CGFloat
    
    public init(skeletonColor: Color = .gray, skeletonHeight: CGFloat = 60) {
        self.skeletonColor = skeletonColor
        self.skeletonHeight = skeletonHeight
    }

    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 16) {
                ForEach([0.3, 0.8, 0.55], id: \.self) { widthPercentage in
                    SkeletonLine(widthPercentage: widthPercentage, 
                                 height: self.skeletonHeight, 
                                 color: self.skeletonColor, 
                                 geometry: geometry)
                }
            }
            .padding()
        }
    }
}

public struct SkeletonLine: View {
    var widthPercentage: CGFloat
    var height: CGFloat
    var color: Color
    var geometry: GeometryProxy

    @State private var isAnimating: Bool = false

    public var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(color)
            .frame(width: geometry.size.width * widthPercentage, 
                   height: height)
            .mask(
                LinearGradient(gradient: Gradient(colors: 
                    [Color.black.opacity(0.2), 
                     Color.black, 
                     Color.black.opacity(0.2)]), 
                              startPoint: .leading, 
                              endPoint: .trailing)
                    .offset(x: isAnimating ? 
                              geometry.size.width * widthPercentage : 
                             -(geometry.size.width * widthPercentage))
            )
            .onAppear {
                withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true)) {
                    isAnimating = true
                }
            }
    }
}
