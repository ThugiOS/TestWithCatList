//
//  ViewController.swift
//  test
//
//  Created by Никитин Артем on 31.08.23.
//

import UIKit

class CatListViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CatCell.self, forCellWithReuseIdentifier: CatCell.reuseIdentifier)
        return collectionView
    }()
    
    private let viewModel = CatListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCats()
        print(viewModel.numberOfCats)
    }

    private func setupUI() {
        title = "Cat List"
        view.backgroundColor = .white

        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func fetchCats() {
        viewModel.fetchCats { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

extension CatListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCats
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCell.reuseIdentifier, for: indexPath) as? CatCell else {
            return UICollectionViewCell()
        }

        let cat = viewModel.cat(at: indexPath.row)
        cell.configure(with: cat.referenceImageID ?? "", buttonTitle: cat.name)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.08, height: collectionView.frame.height / 3) // Размер ячейки
    }
}









//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        fetchCatBreeds { result in
//            switch result {
//            case .success(let catBreeds):
//                for catBreed in catBreeds {
//                    print("Cat Breed Name: \(catBreed.name)")
//                    print("\(catBreed.wikipediaURL)")
//                    print("https://cdn2.thecatapi.com/images/\(catBreed.referenceImageID ?? "?").jpg")
//                    print("============================")
//
//                }
//            case .failure(let error):
//                print("Error fetching cat breeds: \(error)")
//            }
//        }
//    }
//
//
//}

