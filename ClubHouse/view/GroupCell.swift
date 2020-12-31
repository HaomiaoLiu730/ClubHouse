//
//  GroupCellTableViewCell.swift
//  ClubHouse
//
//  Created by Haomiao Liu on 12/29/20.
//

import UIKit

class GroupCell: UITableViewCell {
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var groupName: UILabel!
    
    @IBOutlet weak var numberOfMembers: UILabel!
    
    @IBOutlet weak var numberOfMessages: UILabel!
    

    @IBOutlet weak var firstPerson: UILabel!
    
    @IBOutlet weak var secondPerson: UILabel!
    
    @IBOutlet weak var thirdPerson: UILabel!
    
    @IBOutlet weak var imageOne: UIImageView!
    
    @IBOutlet weak var imageTwo: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bottomView.layer.cornerRadius = bottomView.frame.size.height / 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
