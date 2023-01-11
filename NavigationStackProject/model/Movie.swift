//
//  Movie.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import Foundation

struct Movie: Identifiable, Hashable {
	var title: String
	let id: UUID
	
	init(title: String) {
		self.title = title
		self.id = UUID()
	}
	
	static func examples() -> [Movie] {
		[
			Movie(title: "Titanic"),
			Movie(title: "Avatar"),
			Movie(title: "Lord of the Ring"),
		]
	}
}
