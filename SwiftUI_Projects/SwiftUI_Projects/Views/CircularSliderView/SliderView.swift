//
//  SliderView.swift
//  SwiftUI_Projects
//
//  Created by Erkut Bas on 8.07.2023.
//

import SwiftUI

struct SliderView: View {

    @State private var activeId: Int?
    @Binding var sliderType: CarouselSliderType

    var body: some View {

        GeometryReader { proxy in

            let size = proxy.size
            let componentPadding = max((size.width - 100) / 2, 0)

            ScrollView(.horizontal) {
                HStack(spacing: 36) {
                    ForEach(1...12, id: \.self) { index in
                        AsyncImage(url: URL(string: "https://picsum.photos/200"))
//                        Image("\(index)")
//                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(.circle)
                            .shadow(
                                color: Color.black.opacity(0.5),
                                radius: 5,
                                x: 0,
                                y: 5
                            )
                            .visualEffect { view, proxy in
                                view
                                    .offset(y: getOffset(proxy))
                                    .offset(y: getScale(proxy) * 15)
                            }
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
//                                view
//                                    .offset(y: phase.isIdentity && activeId == index ? 15 : 0)
                                view
                                    .scaleEffect(phase.isIdentity && activeId == index && sliderType == .scaled ? 1.2 : 1, anchor: .bottom)
                            }

                    }
                }
                .frame(height: size.height)
                .offset(y: -30)
//                .padding(.horizontal, componentPadding)
                .scrollTargetLayout()
            }
            .background {
                if sliderType == .normal {
                    Circle()
                        .fill(.white.shadow(.drop(color: .black.opacity(0.2), radius: 5)))
                        .frame(width: 115, height: 115)
                        .offset(y: -15)
                }
            }
            .safeAreaPadding(.horizontal, componentPadding)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $activeId)
//            .background(Color.yellow)

        }
//        .background(Color.red)
        .frame(height: 240)

    }

    private func getOffset(_ proxy: GeometryProxy) -> CGFloat {
        let progress = movementProgress(proxy)
        return progress < 0 ? progress * -30 : progress * 30
    }

    private func movementProgress(_ proxy: GeometryProxy) -> CGFloat {
        let viewWidth = proxy.size.width
        let minX = (proxy.bounds(of: .scrollView)?.minX ?? 0)
        return minX / viewWidth
    }

    private func getScale(_ proxy: GeometryProxy) -> CGFloat {
        let progress = min(max(movementProgress(proxy), -1), 1)
        return progress < 0 ? 1 + progress : 1 - progress
    }

}

#Preview {
    SliderView(sliderType: .constant(.normal))
}
