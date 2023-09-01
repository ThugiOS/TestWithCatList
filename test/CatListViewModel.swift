//
//  CatListViewModel.swift
//  test
//
//  Created by Никитин Артем on 1.09.23.
//

import Foundation

class CatListViewModel {
    private var cats: [Cat] = []
    private let networkService = NetworkService()
    
    var numberOfCats: Int {
        return cats.count
    }
    
    func fetchCats(completion: @escaping () -> Void) {
        networkService.fetchCats { [weak self] (cats) in
            if let cats = cats {
                self?.cats = cats
            }
            completion()
        }
    }
    
    func cat(at index: Int) -> Cat {
        return cats[index]
    }
}
