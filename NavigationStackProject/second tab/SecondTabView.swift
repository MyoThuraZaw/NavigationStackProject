//
//  SecondTabView.swift
//  NavigationStackProject
//
//  Created by Myo Thura Zaw on 11/01/2023.
//

import SwiftUI

struct SecondTabView: View {
	
	let books: [Book] = Book.examples()
	@State private var selectedBookPath = [Book]()
	
    var body: some View {
		VStack {
			NavigationStack(path: $selectedBookPath) {
				List {
					ForEach(books) { book in
						NavigationLink(book.title, value: book)
					}
				}
				.navigationDestination(for: Book.self) { book in
					BookDestinationView(book: book)
				}
			}
			
			VStack {
				ForEach(selectedBookPath) { book in
					Text(book.title)
				}
				
				Button {
					guard let book = books.first else { return }
					selectedBookPath = [book]
				} label: {
					Text("go to favorite")
				}

			}
		}
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
