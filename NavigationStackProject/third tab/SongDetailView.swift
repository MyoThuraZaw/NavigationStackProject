//
//  SongDetailView.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import SwiftUI

struct SongDetailView: View {
	
	let song: Song
	@EnvironmentObject var modelData: ModelDataManager
	@EnvironmentObject var navigationStateManager: NavigationStateManager
	
    var body: some View {
		VStack {
			Text("Song Detail")
			Text(song.artist)
				.bold()
			Text("\(song.year)")
			
			Divider()
			
			VStack(alignment: .leading) {
				Text("People Also Liked")
				
				ForEach(modelData.songs) { song in
					NavigationLink(value: SelectionState.song(song)) {
						Label(song.title, systemImage: "music.note")
					}
				}
			}
			
			Button(action: {
				navigationStateManager.popToRoot()
			}, label: {
				Text("go to root")
			})
		}
		.navigationTitle(song.title)
		.toolbar {
			ToolbarItem(placement: .primaryAction) {
				Button(action: {
					navigationStateManager.goToSettings()
				}, label: {
					Image(systemName: "gear")
				})
			}
		}
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			SongDetailView(song: Song(title: "Smells Like Teen Spirit", artist: "Nirvana", year: 1991))
				.environmentObject(ModelDataManager())
			.environmentObject(NavigationStateManager())
		}
    }
}

