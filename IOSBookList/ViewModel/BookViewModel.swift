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
    
}
