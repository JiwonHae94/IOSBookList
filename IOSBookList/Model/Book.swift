//
//  Book.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import Foundation

struct Book : Identifiable, Decodable, Hashable {
    var id : Int
    var title, author : String
    var content : [String]
    var rating : Int
    var currentPage : Int
    var isFavourite : Bool
}
