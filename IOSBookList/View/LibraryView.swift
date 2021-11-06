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
                    
                LazyVStack{
                    ForEach(viewModel.books, id: \.self){ book in
                        
                        // MARK: Navigation Link
                        NavigationLink(
                            destination: BookDetailView(book: book).environmentObject(viewModel),
                            label: {
                                BookCard(book: book)
                            })
                    }
                }
            }
            
        }
        .navigationTitle("My Library")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
