//
//  ThirdTabView.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import SwiftUI

struct ThirdTabView: View {
	
	@StateObject var modelDataManager = ModelDataManager()
	@StateObject var navigationStateManager = NavigationStateManager()

	@SceneStorage("navigationState") var navigationStateData: Data?
	
    var body: some View {
		NavigationStack(path: $navigationStateManager.selectionPath) {
			RootView(modelData: modelDataManager)
				.navigationDestination(for: SelectionState.self) { state in
					switch state {
					case .song(let song):
						SongDetailView(song: song)
					case .movie(let movie):
						MovieDetailView(movie: movie)
					case .book(let book):
						BookDetailView(book: book)
					case .settings:
						SettingsView()
					}
				}
		}
		.environmentObject(modelDataManager)
		.environmentObject(navigationStateManager)
		.environment(\.colorScheme, .dark)
//		.task {
//			// reset during launch
//			navigationStateManager.data = navigationStateData
//
//			// save state to userdefaults
//			for await _ in navigationStateManager.objectWillChangeSequence {
//				navigationStateData = navigationStateManager.data
//			}
//		}
		
//		.onReceive(navigationStateManager.$selectionPath.dropFirst()) { updatedPath in
		// save state to userdefaults
//			navigationStateData = navigationStateManager.data
//		}
		.onReceive(navigationStateManager.objectWillChange.dropFirst(), perform: { _ in
			// save state to userdefaults
			navigationStateData = navigationStateManager.data
		})
		.onAppear {
			// reset during launch
			navigationStateManager.data = navigationStateData
		}
    }
}

struct ThirdTabView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdTabView()
    }
}
