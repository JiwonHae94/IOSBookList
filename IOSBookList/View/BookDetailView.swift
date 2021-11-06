//
//  BookDetailView.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var model : BookViewModel
    @State var ratingSelected : Int
    @State var isFavourite : Bool
    
    var book : Book
    
    init(book : Book){
        self.book = book
        self.isFavourite = book.isFavourite
        self.ratingSelected = book.rating
    }
    
    var body: some View {
        VStack(alignment: .center){
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
                model.updateIsFavourite(book.id)
            }, label:{
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            })
            
            
            Text("Rate Amazing Words")
                .bold()
                .padding([.top, .bottom], 20)
            Picker("", selection : $ratingSelected){
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }.pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
                .onChange(of: ratingSelected, perform: { value in
                    model.updateRating(forId: book.id, rating: value)
                })
            
        }.navigationTitle(book.title)

    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: Book(id: 1, title: "Amazing Words", author: "Sir Prise Party", content: [""], rating: 1, currentPage: 0, isFavourite: false))

    }
}
