//
//  DetailView.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import SwiftUI

struct DetailView: View {
	
	let text: String
	@Binding var path: NavigationPath
	
    var body: some View {
		
        VStack {
        	Text("Detail view showing")
			Text(text)
			
			Divider()
			
			NavigationLink("Link to 3", value: 3)
			NavigationLink("Link to C", value: "CCCC")
        }
		.navigationTitle(text)
		.navigationBarBackButtonHidden()
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Button {
					path.removeLast()
				} label: {
					Image(systemName: "chevron.left.circle")
				}
			}
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			DetailView(text: "CCCC", path: .constant(NavigationPath()))
		}
    }
}
