//
//  ContentView.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import SwiftUI

struct LibraryView: View {
    @ObservedObject var viewModel = BookViewModel()
    @State var isNavigationActive = true
    
    var body: some View {
        NavigationView{
            ScrollView {
                Text("My Library")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    
                LazyVStack{
                    ForEach(viewModel.books, id: \.self){ book in
                        
                        // MARK: Navigation Link
                        NavigationLink(
                            destination: BookDetailView(book: book),
                            label: {
                                BookCard(book: book)
                            })
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
