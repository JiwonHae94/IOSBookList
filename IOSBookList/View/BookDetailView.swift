//
//  BookDetailView.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var model: BookViewModel
    @State private var rating = 2
    
    var book: Book
    
    var body: some View {
        VStack(spacing: 20){
            NavigationLink(destination: BookContentView(book: book)) {
                
                VStack {
                    Text("Read Now!")
                        .font(.title)
                        .accentColor(.black)
                    
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()                }
            }
            .padding()
                
            
            Text("Mark for later!")
                .font(.headline)
            
            
            Button(action: {
                model.updateIsFavourite(forId: book.id)
            }, label:{
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }).accentColor(.yellow)
            
            
            Text("Rate \(book.title)")
                .bold()
                .padding([.top, .bottom], 20)
            Picker("", selection : $rating){
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }.pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
                .onChange(of: rating, perform: { value in
                    model.updateRating(forId: book.id, rating: value)
                })
            
        }
        
        .onAppear{ rating = book.rating }
        .navigationTitle(book.title)

    }
}

