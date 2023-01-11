//
//  NavigationStateManager.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import Foundation

enum SelectionState: Hashable {
	case movie(Movie)
	case song(Song)
	case book(Book)
	case settings
}

class NavigationStateManager: ObservableObject {
	@Published var selectionPath = [SelectionState]()
	
	func popToRoot() {
		selectionPath = []
	}
	
	func goToSettings() {
		selectionPath = [SelectionState.settings]
	}
	
}
