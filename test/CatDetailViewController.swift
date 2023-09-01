//
//  CatDetailViewController.swift
//  test
//
//  Created by Никитин Артем on 1.09.23.
//

import UIKit
import SafariServices

class CatDetailViewController: UIViewController {
    var wikipediaURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Добавьте здесь UI-элементы и настройте их, если необходимо
        
        if let url = wikipediaURL, let wikipediaURL = URL(string: url) {
            let safariVC = SFSafariViewController(url: wikipediaURL)
            present(safariVC, animated: true, completion: nil)
        }
    }
}

