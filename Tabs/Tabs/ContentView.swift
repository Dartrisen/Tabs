//
//  ContentView.swift
//  Tabs
//
//  Created by Dartrisen on 03.10.2020.
//

import SwiftUI

enum Tabs: Hashable {
    case home
    case settings

    var title: String {
        switch self {
            case .home: return "Home"
            case .settings: return "Settings"
        }
    }

    var mode: NavigationBarItem.TitleDisplayMode {
        switch self {
            case .home: return .automatic
            case .settings: return .inline
        }
    }

    var imageName: String {
        switch self {
            case .home: return "house.fill"
            case .settings: return "gear"
        }
    }
}

// MARK: Main View
struct ContentView: View {
    @State private var selectedTab = Tabs.home

    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: Tabs.home.imageName)
                        Text(Tabs.home.title)
                }.tag(Tabs.home)

                SettingsView()
                    .tabItem {
                        Image(systemName: Tabs.settings.imageName)
                        Text(Tabs.settings.title)
                }.tag(Tabs.settings)
            }
            .navigationBarTitle(selectedTab.title,
                                displayMode: selectedTab.mode)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
