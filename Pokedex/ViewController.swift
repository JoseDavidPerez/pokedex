//
//  ViewController.swift
//  Pokedex
//
//  Created by osx on 08/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tablaPokemon: UITableView!
    @IBOutlet weak var searchBarPokemon: UISearchBar!
    
    var pokemonManager = PokemonManager()
    var pokemons: [Pokemon] = []
    var pokemonSeleccionado: Pokemon?
    
    var pokemonFiltrados: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaPokemon.register(UINib(nibName: "CeldaPokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")
        pokemonManager.delegado = self
        tablaPokemon.delegate = self
        tablaPokemon.dataSource = self
        pokemonManager.verPokemon()
    }


}
//MARK: - Delagado Pokemon
extension ViewController: pokemonManagerDelegado {
    func mostrarListaPokemon(lista: [Pokemon]) {
        pokemons = lista
        DispatchQueue.main.async {
            self.tablaPokemon.reloadData()
        }
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pokemonFiltrados = []
        
        if searchText == "" {
            pokemonFiltrados = pokemons
        }else {
            for poke in  pokemons {
                if poke.name.lowercased().contains(searchText.lowercased()){
                    pokemonFiltrados.append(poke)
                }
            }
        }
        self.tablaPokemon.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaPokemon.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaPokemonTableViewCell
        celda.lblName.text = pokemons[indexPath.row].name
        celda.lblattack.text = "Ataque:\(pokemons[indexPath.row].attack)"
        celda.lbldefense.text = "Defensa:\(pokemons[indexPath.row].defense)"
        
        if let urlString = pokemons[indexPath.row].imageUrl as? String {
            if let imagenURL = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imagenData = try? Data(contentsOf: imagenURL) else {
                    return }
                    let image = UIImage(data: imagenData)
                    DispatchQueue.main.async {
                        celda.imgPokemon.image = image
                    }
                }
            }
        }
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokemonSeleccionado = pokemons[indexPath.row]
        performSegue(withIdentifier: "verPokemon", sender: self)
        tablaPokemon.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verPokemon" {
            let verPokemon = segue.destination as! DetallePokemonViewController
            verPokemon.pokemonMostrar = pokemonSeleccionado
        }
    }
}
