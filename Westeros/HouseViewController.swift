//
//  HouseViewController.swift
//  Westeros
//
//  Created by Administrador on 10/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    
    @IBOutlet weak var wordsView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    let model: House
    
    // MARK: Initializers
    init(model: House){
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        title = "House \(model.name)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Sync View <-> Model
    
    func syncViewWithModel(){
        // model -> View
        
        
        sigilImageView.image = model.sigil.image
        
        wordsView.text = model.words
    }
    
    func setupUI(){
        // Creamos un boton de la barra de navegación
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain, target: self, action: #selector(displayWiki))
        let membersButton = UIBarButtonItem(title: "Members",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayMembers))
        
        
        // Añadimos el botón al controlador de navegación
        navigationItem.rightBarButtonItems = [wikiButton, membersButton]
    }
    
    @objc func displayWiki(){
        // Creamos un wikiVC y lo cargamos en el NavController
        let wikiVC = WikiViewController(model: model)
        
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @objc func displayMembers(){
        
        // Creamos el membersVC
        let membersVC = MembersViewController(model: model.sortedMembers())
        
        // LO pusheamos
        navigationController?.pushViewController(membersVC, animated: true)
        
        
    }
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
    }
}
