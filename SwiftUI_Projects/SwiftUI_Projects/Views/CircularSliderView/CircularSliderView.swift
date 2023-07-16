//
//  CircularSliderView.swift
//  SwiftUI_Projects
//
//  Created by Erkut Bas on 7.07.2023.
//

import SwiftUI

struct CircularSliderView: View {

    @State private var sliderType: CarouselSliderType = .normal

    var body: some View {

        VStack {
            pickerContent
            Spacer()
            sliderContent
        }
        .background(Color.cyan.opacity(0.2))
        .ignoresSafeArea(.container, edges: .bottom)
        .toolbar(.hidden, for: .tabBar)
    }

    @ViewBuilder
    private var pickerContent: some View {
        Picker(
            "Carousel Slider Type",
            selection: $sliderType,
            content: {
                ForEach(
                    CarouselSliderType.allCases,
                    id: \.rawValue,
                    content: { index in
                        Text(index.rawValue)
                            .tag(index)
                    }
                )
            }
        )
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }

    @ViewBuilder
    private var sliderContent: some View {
        SliderView(sliderType: $sliderType)
    }

}

struct CircularSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CircularSliderView()
    }
}
