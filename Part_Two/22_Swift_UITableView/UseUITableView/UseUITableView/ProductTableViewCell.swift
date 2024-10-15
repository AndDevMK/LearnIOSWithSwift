//
//  ProductTableViewCell.swift
//  UseUITableView
//
//  Created by 彭明健 on 2024/10/15.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var saleCountLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
