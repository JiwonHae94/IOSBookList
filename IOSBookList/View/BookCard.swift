//
//  BookCard.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import SwiftUI

struct BookCard: View {
    var book : Book
    
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
