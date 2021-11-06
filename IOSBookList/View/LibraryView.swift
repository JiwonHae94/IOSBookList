//
//  ContentView.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import SwiftUI

struct LibraryView: View {
    @ObservedObject var viewModel = BookViewModel()
    
    var body: some View {
        Text("My Library")
            .font(.title)
            .foregroundColor(.black)
        
        ScrollView{
            VStack{
                ForEach(viewModel.books, id: \.self){ book in
                    
                    NavigationLink(destination: Text("destination"), isActive: <#T##Binding<Bool>#>, label: <#T##() -> _#>)
                    
                    BookCard(book: book)
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
