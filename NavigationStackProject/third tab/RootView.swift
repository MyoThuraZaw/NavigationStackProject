//
//  RootView.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import SwiftUI

struct RootView: View {
	
	@ObservedObject var modelData: ModelDataManager
	
    var body: some View {
		List {
			Section("Songs") {
				ForEach(modelData.songs) { song in
					NavigationLink(song.title, value: SelectionState.song(song))
				}
			}
			
			Section("Movies") {
				ForEach(modelData.movies) { movie in
					NavigationLink(movie.title, value: SelectionState.movie(movie))
				}
			}
			
			Section("Books") {
				ForEach(modelData.books) { book in
					NavigationLink(book.title, value: SelectionState.book(book))
				}
			}
			
			NavigationLink("Settings", value: SelectionState.settings)
		}
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(modelData: ModelDataManager())
    }
}
