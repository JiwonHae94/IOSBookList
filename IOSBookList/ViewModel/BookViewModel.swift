//
//  BookViewModel.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import Foundation

class BookViewModel : ObservableObject{
    @Published var books : [Book]
    
    init(){
        books = DataService.getLocalData(path: Bundle.main.path(forResource: "BookData", ofType: "json"))
    }
    
    private func getBook(_ forId : Int) -> Book?{
        return books.first{ b in
            b.id == forId
        }
    }
    
    func updateCurrentPage(
        forId : Int,
        page : Int
    ){
        var target = getBook(forId)
        
        if target != nil{
            target!.currentPage = page
        }
    }
    
    func updateIsFavourite(
        _ forId : Int,
    ){
        
        var target = getBook(forId)
        if target != nil{
            target!.isFavourite = !target!.isFavourite
        }
    }
}
