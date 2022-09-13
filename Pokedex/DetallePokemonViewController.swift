//
//  DetallePokemonViewController.swift
//  Pokedex
//
//  Created by osx on 09/09/22.
//

import UIKit

class DetallePokemonViewController: UIViewController {

    var pokemonMostrar: Pokemon?
    
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var txtaPokemon: UITextView!
    @IBOutlet weak var lbltype: UILabel!
    @IBOutlet weak var lblataque: UILabel!
    @IBOutlet weak var lbldefensa: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        imgPokemon.loadFrom(URLAddres: pokemonMostrar?.imageUrl ?? "")
        lbltype.text = "Tipo :\(pokemonMostrar!.type)"
        lblataque.text = "Ataque :\(pokemonMostrar!.attack)"
        lbldefensa.text = "Defensa :\(pokemonMostrar!.defense)"
        txtaPokemon.text = pokemonMostrar?.description ?? ""
    }

}


extension UIImageView {
    
    func loadFrom(URLAddres: String) {
        
        guard let url = URL(string: URLAddres) else { return }
        
            DispatchQueue.main.async {
                if let imagenData = try? Data(contentsOf: url) {
                    if let loadedImage = UIImage(data: imagenData){
                        self.image = loadedImage
                }
            }
        }
    }
}

