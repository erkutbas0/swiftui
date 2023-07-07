//
//  MainView.swift
//  SwiftUI_Projects
//
//  Created by Erkut Bas on 7.07.2023.
//

import SwiftUI

struct MainView: View {

    @State private var selectedTab: Int = 0

    var body: some View {

        TabView(
            selection: $selectedTab,
            content: {

                Text("First Tab")
                    .tabItem {
                        Label("First", systemImage: "1.circle")
                    }
                    .tag(0)

                Text("Second Tab")
                    .tabItem {
                        Label("Second", systemImage: "2.circle")
                    }
                    .tag(1)

                Text("Third Tab")
                    .tabItem {
                        Label("Third", systemImage: "3.circle")
                    }
                    .tag(2)

            }
        )

    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
