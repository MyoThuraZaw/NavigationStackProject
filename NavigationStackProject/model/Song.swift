//
//  Song.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import Foundation

struct Song: Identifiable, Hashable {
	var title: String
	var artist: String
	var year: Int
	let id: UUID
	
	init(title: String, artist: String, year: Int) {
		self.title = title
		self.artist = artist
		self.year = year
		self.id = UUID()
	}
	
	static func examples() -> [Song] {
		[
			Song(title: "Fight the Power", artist: "Public Enimy", year: 1989),
			Song(title: "Like a Roling Stone", artist: "Bob Dylan", year: 1965),
			Song(title: "Smells Like Teen Spirit", artist: "Nirvana", year: 1991)
		]
	}
}
