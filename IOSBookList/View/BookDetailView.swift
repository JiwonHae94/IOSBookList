//
//  BookDetailView.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import SwiftUI

struct BookDetailView: View {
    var book : Book
    @State var isToggleOn : Bool
    @State var ratingSelected : Int
    
    init(book : Book){
        self.book = book
        self.ratingSelected = book.rating
        self.isToggleOn = book.isFavourite
    }
    
    var body: some View {
        VStack(alignment: .center){
            Text("Read Now!")
                .font(.title)
            
            Image("cover1")
                .resizable()
                .frame(width: 300, height: 400)
                .scaledToFill()
                
            Text("Mark for later!")
            Toggle(isOn: $isToggleOn){
                Image(systemName: "star")
            }.toggleStyle(ButtonToggleStyle())
            
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
            
        }.navigationTitle(book.title)

    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: Book(id: 1, title: "Amazing Words", author: "Sir Prise Party", content: [""], rating: 1, currentPage: 0, isFavourite: false))

    }
}
