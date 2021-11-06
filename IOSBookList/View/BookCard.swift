//
//  BookCard.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import SwiftUI

struct BookCard: View {
    var book : Book
    
    init(book : Book){
        self.book = book
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 20)
                
            VStack(alignment: .leading){
                Text(book.title)
                    .font(.largeTitle)
                    .bold()
                    .padding([.leading, .bottom, .top], 10)
                
                Text(book.author)
                    .font(.body)
                    .italic()
                    .padding([.leading, .bottom], 10)
                
                Image("cover\(Int.random(in: 1...5))")
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
                
        }.padding()
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(book: Book(id: 1, title: "Amazing Words", author: "Sir Prise Party", content: [""], rating: 1, currentPage: 0, isFavourite: false))
    }
}
