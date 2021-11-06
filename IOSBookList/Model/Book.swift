//
//  Book.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import Foundation

struct Book : Decodable, Identifiable {
    
    var id = 1
    var title = "Title"
    var author = "Author"
    var content = ["I am a test book."]
    var isFavourite = false
    var rating = 2
    var currentPage = 0
    
}
