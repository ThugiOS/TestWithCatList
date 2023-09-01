//
//  CatListViewModel.swift
//  test
//
//  Created by Никитин Артем on 1.09.23.
//

import Foundation

protocol CatListViewModelProtocol {
    var numberOfCats: Int { get }
    func fetchNextPage(completion: @escaping () -> Void)
    func cat(at index: Int) -> Cat
}

class CatListViewModel {
    private var cats: [Cat] = []
    private let networkService = NetworkService()
    private var currentPage = 1
    private let itemsPerPage = 10 // Количество котов на странице
    var hasMoreData = true // Флаг для определения наличия дополнительных данных

    var numberOfCats: Int {
        return cats.count
    }

    func fetchNextPage(completion: @escaping () -> Void) {
        guard hasMoreData else {
            completion()
            return
        }

        networkService.fetchCats(page: currentPage, itemsPerPage: itemsPerPage) { [weak self] cats in
            if let cats = cats {
                if cats.isEmpty {
                    self?.hasMoreData = false
                } else {
                    self?.cats.append(contentsOf: cats)
                    self?.currentPage += 1
                }
            }

            completion()
        }
    }

    func cat(at index: Int) -> Cat {
        return cats[index]
    }
}


