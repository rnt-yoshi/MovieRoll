//
//  UserPerfilTableViewCell.swift
//  MovieRoll
//
//  Created by Renato Yoshinari on 03/06/22.
//

import UIKit

class UserPerfilTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUserCell(user: OptionsPerfil) {
        userImage.image = UIImage(named: user.imagem)
        userImage.layer.cornerRadius = userImage.frame.height / 2
        userImage.layer.borderWidth = 0.3
        userNameLabel.text = user.titulo
    }

}
