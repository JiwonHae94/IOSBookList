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
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
                
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(book.title)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .padding([.leading, .bottom, .top], 10)
                    
                    Spacer()
                    
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.yellow)
                    }
                    
                }
                
                
                Text(book.author)
                    .font(.body)
                    .italic()
                    .foregroundColor(.black)
                    .padding([.leading, .bottom], 10)
                
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
                
        }
        .accentColor(.black)
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(book: Book(id: 1, title: "Amazing Words", author: "Sir Prise Party", content: [""], rating: 1, currentPage: 0, isFavourite: false))
    }
}
