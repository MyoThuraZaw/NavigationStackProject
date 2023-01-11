//
//  FirstTabView.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import SwiftUI

struct FirstTabView: View {
	
	@State private var showSettings = false
	@State private var path = NavigationPath()
	
    var body: some View {
		VStack {
			NavigationStack(path: $path) {
				List {
					Text("Root View")
					
					NavigationLink("Go to detail A", value: "Show AAAA")
					
					NavigationLink("Go to B", value: "Show BBBB")
					
					NavigationLink("Go to number 1", value: 1)
					
					Button {
						path.append("GGG")
					} label: {
						Text("Show Favorite")
					}
					
					Button(action: {
						showSettings.toggle()
					}, label: {
						Text("Settings")
					})
					
					Section("Old") {
						NavigationLink("Old link with destination") {
							Text("old navigation link")
							NavigationLink("Go to 2", value: 2)
						}
					}
				}
				.navigationDestination(for: String.self) { textValue in
					DetailView(text: textValue, path: $path)
				}
				.navigationDestination(for: Int.self) { numberValue in
					Text("Detail with \(numberValue)")
				}
				.navigationDestination(isPresented: $showSettings) {
					Text("Settings")
				}
				
			}
			
			VStack {
				Text("Path")
				Text("number of detail views on the stack: \(path.count)")
				
				Button {
					path.removeLast()
				} label: {
					Text("go back one view")
				}
				
				Button {
//					path = NavigationPath()
					path.removeLast(path.count)
				} label: {
					Text("go to root view")
				}

			}
		}
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
