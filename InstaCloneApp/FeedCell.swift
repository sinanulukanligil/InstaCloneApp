//
//  FeedCell.swift
//  InstaCloneApp
//
//  Created by Yusuf Sinan Ulukanligil on 2020-08-17.
//  Copyright © 2020 Yusuf Sinan Ulukanligil. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    
    @IBOutlet var feedImage: UIImageView!
    @IBOutlet var feedEmail: UILabel!
    @IBOutlet var feedComment: UILabel!
    @IBOutlet var numberoFlikes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func likeClicked(_ sender: Any) {
    }
    
  
}
