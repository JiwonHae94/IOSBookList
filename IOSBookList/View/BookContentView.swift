//
//  BookPageView.swift
//  IOSBookList
//
//  Created by Jiwon_Hae on 2021/11/07.
//

import SwiftUI

struct BookContentView: View {
    @EnvironmentObject var model : BookViewModel
    @State private var page = 0
    @State var book : Book
    
    var body: some View {
        TabView{
            ForEach(book.content.indices, id: \.self){ index in
                VStack(alignment: .center) {
                    Text(book.content[index])
                        .tag(index)
                    
                    Spacer()
                    Text("\(page + 1)")
                }
                .padding()
            }
        }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .onChange(of: page, perform: { value in
                model.updatePage(forId: book.id, page: page)
            })
            .onAppear {
                page = book.currentPage
            }
    }
}
