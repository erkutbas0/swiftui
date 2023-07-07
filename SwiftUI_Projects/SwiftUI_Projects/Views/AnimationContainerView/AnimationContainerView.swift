//
//  AnimationContainerView.swift
//  SwiftUI_Projects
//
//  Created by Erkut Bas on 7.07.2023.
//

import SwiftUI

struct AnimationContainerView: View {

    @StateObject private var viewModel = AnimationContainerViewModel()

    var body: some View {

        NavigationStack {
            MasterAnimationContainerView(
                animationRelatedViews: viewModel.animationRelatedViewsData,
                dynamicIslandAnimationData: viewModel.dynamicIslandAnimationsData
            )
            .navigationDestination(
                for: RouteForAnimationContainers.self,
                destination: { router in
                    route(with: router)
                }
            )
        }

    }

    @ViewBuilder
    private func route(with routerType: RouteForAnimationContainers) -> some View {
        switch routerType {
        case .animationViews(let animationRelatedViewsData):
            Text("Zoko")
        case .dynamicIslandViews(let dynamicIslandAnimationsData):
            Text("Moko")
        }
    }

}

struct AnimationContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationContainerView()
    }
}
