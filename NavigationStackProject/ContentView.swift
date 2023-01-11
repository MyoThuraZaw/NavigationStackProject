//
//  ContentView.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView {
			FirstTabView()
				.tabItem {
					Label("First", systemImage: "plus")
				}
		
			SecondTabView()
				.tabItem {
					Label("Second", systemImage: "plus")
				}
			
			ThirdTabView()
				.tabItem {
					Label("Third", systemImage: "plus")
				}
			
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
