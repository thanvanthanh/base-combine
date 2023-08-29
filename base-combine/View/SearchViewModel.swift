//
//  SearchViewModel.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 29/08/2023.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject, searchViewModel {
    
    @Published var data: ItemSearchResponse?
    
    private var getSearchData: SearchServiceProtocol
    
    var loadingState = CurrentValueSubject<ViewModelStatus, Never>(.dismissLoading)
    @Published var loadingPublished: ViewModelStatus = .dismissLoading
    
    var subscriber = Set<AnyCancellable>()
    
    init(getSearchData: SearchServiceProtocol = SearchRequest()) {
        self.getSearchData = getSearchData
        loadingState.assign(to: \.loadingPublished, on: self).store(in: &subscriber)
    }
}

extension SearchViewModel {
    func callSearchService(username: String) {
        self.loadingState.send(.load)
        self.getSearchData.search(username: username)
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .finished:
                    self.loadingState.send(.dismissLoading)
                case .failure(let error):
                    self.loadingState.send(.error(error.localizedDescription))
                }
            } receiveValue: { data in
                guard let data = data else { return }
                self.data = data
            }
            .store(in: &subscriber)

    }
}
