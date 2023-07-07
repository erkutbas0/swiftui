//
//  MasterAnimationContainerView.swift
//  SwiftUI_Projects
//
//  Created by Erkut Bas on 7.07.2023.
//

import SwiftUI

struct MasterAnimationContainerView: View {

    let animationRelatedViews: [AnimationRelatedViewsData]
    let dynamicIslandAnimationData: [DynamicIslandAnimationsData]

    var body: some View {

        List {

            Section(
                "Animation Related Views",
                content: {
                    ForEach(animationRelatedViews) { view in
                        NavigationLink(
                            value: RouteForAnimationContainers.animationViews(view),
                            label: {
                                Text(view.title)
                            }
                        )
                    }
                }
            )

            Section(
                "Dynamic Islan Views",
                content: {
                    ForEach(dynamicIslandAnimationData) { view in
                        NavigationLink(
                            value: RouteForAnimationContainers.dynamicIslandViews(view),
                            label: {
                                Text(view.title)
                            }
                        )
                    }
                }
            )

        }
        .navigationTitle("Main Animation Container")
        //.navigationBarTitleDisplayMode(.inline)

    }

}

struct MasterAnimationContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MasterAnimationContainerView(
            animationRelatedViews: [.init(title: "Sample1"), .init(title: "Sample2")],
            dynamicIslandAnimationData: [.init(title: "Sample3"), .init(title: "Sample4")])
    }
}
