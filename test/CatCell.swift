//
//  CatCell.swift
//  test
//
//  Created by Никитин Артем on 1.09.23.
//

import UIKit
import SDWebImage

class CatCell: UICollectionViewCell {
    static let reuseIdentifier = "CatCell"

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "questionmark.app")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }

    private func setupSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: button.topAnchor),
            
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    func configure(with imageId: String, buttonTitle: String) {
        let urlString = ("https://cdn2.thecatapi.com/images/\(imageId).jpg")
        let url = URL(string: urlString)
        imageView.sd_setImage(with: url)

        button.setTitle(buttonTitle, for: .normal)
    }
}



