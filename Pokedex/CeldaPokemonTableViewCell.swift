//
//  CeldaPokemonTableViewCell.swift
//  Pokedex
//
//  Created by osx on 09/09/22.
//

import UIKit

class CeldaPokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lblattack: UILabel!
    
    @IBOutlet weak var lbldefense: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgPokemon.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
