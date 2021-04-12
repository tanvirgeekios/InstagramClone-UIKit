//
//  FeedTableViewCell.swift
//  InstagramFirebase
//
//  Created by MD Tanvir Alam on 12/4/21.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var useremailLabel: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
