//
//  TableViewCell.swift
//  TodolistFinal
//
//  Created by Gabriel Kameni on 10/12/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
