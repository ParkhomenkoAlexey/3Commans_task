//
//  DetailInfoViewController.swift
//  3Commans_task
//
//  Created by Алексей on 31.10.2022.
//

import UIKit
import SDWebImage

class DetailInfoViewController: UIViewController {
    
    private let mainImageView = UIImageView()
    private let nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
        setupConstraints()
    }
    
    func configureWith(imageString: String, name: String) {
        if let url = URL(string: imageString) {
            mainImageView.sd_setImage(with: url)
        }
        
        nameLabel.text = name
    }
    
    // MARK: - Setup
    private func setupElements() {
        view.backgroundColor = .white
        
        mainImageView.backgroundColor = .lightGray
        mainImageView.contentMode = .scaleToFill
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
    }
    
    private func setupConstraints() {
        view.addSubview(mainImageView)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 300),
            mainImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
    }
}
