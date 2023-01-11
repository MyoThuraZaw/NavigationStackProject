//
//  ModelDataManager.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import Foundation

class ModelDataManager: ObservableObject {
	@Published var books = Book.examples()
	@Published var songs = Song.examples()
	@Published var movies = Movie.examples()
}
