//
//  CatListViewController.swift
//  test
//
//  Created by Никитин Артем on 1.09.23.
//

import UIKit

class CatListViewController: UIViewController {
    
    // MARK: - UI Components
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CatCell.self, forCellWithReuseIdentifier: CatCell.reuseIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Private Properties
    private let viewModel = CatListViewModel()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCats()
    }

    // MARK: - UI Components
    private func setupUI() {
        title = "Cat List"
        view.backgroundColor = .systemBackground

        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Private Methods
    private func fetchCats() {
        viewModel.fetchCats { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}


// MARK: - Extensions
extension CatListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(viewModel.numberOfCats, 10)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCell.reuseIdentifier, for: indexPath) as? CatCell else {
            return UICollectionViewCell()
        }

        let cat = viewModel.cat(at: indexPath.row)
        cell.configure(with: cat.referenceImageID ?? "", buttonTitle: cat.name, catLink: cat.wikipediaURL ?? "")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.08, height: collectionView.frame.height / 3)
    }
}
