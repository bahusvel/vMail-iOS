//
//  VMailCellTableViewCell.swift
//  vMail
//
//  Created by denis lavrov on 16/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

class VMailCell: UITableViewCell {
    
    @IBOutlet weak var previewLine: UILabel!
    @IBOutlet weak var subjectLine: UILabel!
    @IBOutlet weak var senderLine: UILabel!
    
    var mail: VMail?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setVMail(mail: VMail){
        self.mail = mail
        senderLine.text = mail.sender
        subjectLine.text = mail.subject
    }

}
