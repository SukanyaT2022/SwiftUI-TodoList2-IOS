//
//  CustomTableViewCell.swift
//  Feb2TableViewCellPractice
//
//  Created by Tiparpron Sukanya on 2/2/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var studentImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
//    this function make image circle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.studentImageView.layer.cornerRadius =  self.studentImageView.frame.width / 2
        self.studentImageView.layer.masksToBounds = true
    }
}
