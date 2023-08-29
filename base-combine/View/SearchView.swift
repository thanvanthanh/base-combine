//
//  SearchView.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 29/08/2023.
//

import SwiftUI
import Combine

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State var searchText: String = ""
    var dataItem: ItemSearchResponse? {
        viewModel.data
    }
    
    var body: some View {
        ZStack {
            VStack {
                SearchBarView(text: $searchText)
                    .onSubmit {
                        if !searchText.isEmpty {
                            viewModel.callSearchService(username: searchText)
                        }
                    }
                Spacer()
                List {
                    ForEach(viewModel.data?.items ?? []) { item in
                        Text(item.login)
                    }
                }
            }
            
            if viewModel.loadingPublished == .load {
                ZStack {
                    ActivityIndicator()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.orange)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.3))
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: .init())
    }
}
