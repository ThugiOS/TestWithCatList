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
    
    private var catWikiLink = ""

    // MARK: - UI Components
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "questionmark.app")
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2549344003, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    // MARK: - UI Setup
    private func setupSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -4),
            
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - Public methods
    func configure(with imageId: String, buttonTitle: String, catLink: String) {
        let urlString = ("https://cdn2.thecatapi.com/images/\(imageId).jpg")
        let url = URL(string: urlString)
        imageView.sd_setImage(with: url)

        button.setTitle(buttonTitle, for: .normal)
        
        catWikiLink = catLink
    }
    
    // MARK: - Selectors
    @objc private func buttonTapped() {
        UIView.animate(withDuration: 0.08, animations: {
            self.button.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        }) { (_) in
            UIView.animate(withDuration: 0.08) {
                self.button.transform = CGAffineTransform.identity
            }
            if let url = URL(string: self.catWikiLink) {
                UIApplication.shared.open(url)
            }
        }
     }
}


