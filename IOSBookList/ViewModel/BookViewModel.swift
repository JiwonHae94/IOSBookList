//
//  BookViewModel.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import Foundation

class BookViewModel : ObservableObject {
    @Published var books : [Book]
    
    init(){
        self.books = DataService.getLocalData(path: Bundle.main.path(forResource: "BookData", ofType: "json"))
    }
    
    func updateIsFavourite(
        forId : Int
    ){
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
        
    }
    
    func updateRating(
        forId : Int,
        rating : Int
    ){
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
            
        }
    
    }
    
    func updatePage(
        forId : Int,
        page : Int
    ){
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].currentPage = page
        }
        
    }
}
