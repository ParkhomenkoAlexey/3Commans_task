//
//  ListCell.swift
//  3Commans_task
//
//  Created by Алексей on 30.10.2022.
//

import UIKit
import SDWebImage

final class ListCell: UITableViewCell {
    
    static let reuseId = "ListCell"
    
    private let mainImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupElements()
        setupConstraints()
    }
    
    func configureWith(imageString: String) {
        if let url = URL(string: imageString) {
            mainImageView.sd_setImage(with: url)
        }
    }
    
    private func setupElements() {
        backgroundColor = .lightGray
        mainImageView.contentMode = .scaleToFill
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        addSubview(mainImageView)
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
