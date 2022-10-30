//
//  ListCell.swift
//  3Commans_task
//
//  Created by Алексей on 30.10.2022.
//

import UIKit

final class ListCell: UITableViewCell {
    
    static let reuseId = "ListCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
