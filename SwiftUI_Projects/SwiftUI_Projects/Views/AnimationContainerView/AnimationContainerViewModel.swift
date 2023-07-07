//
//  AnimationContainerViewModel.swift
//  SwiftUI_Projects
//
//  Created by Erkut Bas on 7.07.2023.
//

import Foundation

final class AnimationContainerViewModel: ObservableObject {

    var animationRelatedViewsData: [AnimationRelatedViewsData] = [
        .init(title: "Circular Carousel Slider")
    ]

    var dynamicIslandAnimationsData: [DynamicIslandAnimationsData] = [
        .init(title: "Sample Dynamic Island")
    ]

}
