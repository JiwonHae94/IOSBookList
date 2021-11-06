//
//  ContentView.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var viewModel : BookViewModel
    @State var isNavigationActive = true
    
    var body: some View {
        NavigationView{
            ScrollView {
                    
                LazyVStack{
                    ForEach(viewModel.books){ book in
                        
                        // MARK: Navigation Link
                        NavigationLink(destination: BookDetailView(book: book)) {
                                BookCard(book: book).padding([.leading, .trailing], 20)
                            }
                    }
                }.padding(.top)
            }
            
            .navigationTitle("My Library")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView().environmentObject(BookViewModel())
    }
}
