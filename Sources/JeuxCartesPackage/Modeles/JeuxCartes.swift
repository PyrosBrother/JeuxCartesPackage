//
//  JeuxCartes.swift
//  MyTestApp
//
//  Created by Stéphane HACOUT on 07/08/2021.
//

import Foundation

protocol JeuCartesProtocol {
    func listerCouleursPossibles () -> [Carte.CouleurCarte]
    func listerValeursPossibles () -> [Carte.ValeurCarte]
    func genererCartesSpeciales ()
    func nombreJokers () -> Int
    func listerCouleursPossiblesJokers () -> [Carte.CouleurCarte]
}

class JeuCartes: JeuCartesProtocol {
    func nombreJokers() -> Int {
        return 0
    }
    
    func listerCouleursPossiblesJokers() -> [Carte.CouleurCarte] {
        return [.AucuneCouleur]
    }
    
    func listerCouleursPossibles() -> [Carte.CouleurCarte] {
        return []
    }
    
    func listerValeursPossibles() -> [Carte.ValeurCarte] {
        return []
    }
    
    func genererCartesSpeciales() {
        // aucune carte spéciale sur un jeu de cartes vide
    }
    
    func genererJokers() {
        for _ in 0 ..< nombreJokers () {
            if let carteJoker = Carte (couleur: .AucuneCouleur, valeur: .Joker) {
                cartes.append (carteJoker)
            }
        }
    }
    
    enum TypeJeuCartes: CaseIterable {
        case JeuCartesInconnu
        case Cartes32
        case Cartes54
    }
    let typeJeuCartes: TypeJeuCartes
    var cartes: [Carte] = []
    
    init? (typeJeuCartes: TypeJeuCartes = .JeuCartesInconnu) {
        guard typeJeuCartes != .JeuCartesInconnu else { return nil }
        self.typeJeuCartes = typeJeuCartes
        guard listerValeursPossibles().count > 0 else { return nil }
        guard listerValeursPossibles().count > 0 else { return nil }
        genererJeu ()
    }
    
    func genererJeu () {
        cartes.removeAll()
        for couleur in listerCouleursPossibles() {
            for valeur in listerValeursPossibles() {
                if let carte = Carte (couleur: couleur, valeur: valeur) {
                    cartes.append (carte)
                }
            }
        }
        genererJokers()
        genererCartesSpeciales ()
    }
    
    func melangerJeu () {
        cartes.shuffle()
    }
}

class Jeu32Cartes : JeuCartes {
    override func listerValeursPossibles() -> [Carte.ValeurCarte] {
        let listeValeurs: [Carte.ValeurCarte] = [.Sept, .Huit, .Neuf, .Dix, .Valet, .Dame, .Roi, .As]
        return listeValeurs
    }
    
    override func listerCouleursPossibles() -> [Carte.CouleurCarte] {
        return [.Pique, .Carreau, .Coeur, .Trefle]
    }
    
    
    init? () {
        super.init (typeJeuCartes: .Cartes32)
        genererJeu ()
    }
}

class Jeu32CartesAvecJokers : Jeu32Cartes {
    var _nombreJokers: Int
    var _jokerSansCouleur: Bool
    
    init? (nombreJokers: Int, jokerSansCouleur: Bool) {
        self._nombreJokers = nombreJokers
        self._jokerSansCouleur = jokerSansCouleur
        super.init()
    }
    
    override func nombreJokers() -> Int {
        return _nombreJokers
    }
    
    override func listerCouleursPossiblesJokers() -> [Carte.CouleurCarte] {
        return _jokerSansCouleur ? [.AucuneCouleur] : [.Rouge, .Noire]
    }
}
