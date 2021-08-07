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

public class JeuCartes: JeuCartesProtocol {
    public func nombreJokers() -> Int {
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
    
    public enum TypeJeuCartes: CaseIterable {
        case JeuCartesInconnu
        case Cartes32
        case Cartes54
    }
    public let typeJeuCartes: TypeJeuCartes
    public var cartes: [Carte] = []
    
    public init? (typeJeuCartes: TypeJeuCartes = .JeuCartesInconnu) {
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
    
    public func melangerJeu () {
        cartes.shuffle()
    }
}

public class Jeu32Cartes : JeuCartes {
    override func listerValeursPossibles() -> [Carte.ValeurCarte] {
        let listeValeurs: [Carte.ValeurCarte] = [.Sept, .Huit, .Neuf, .Dix, .Valet, .Dame, .Roi, .As]
        return listeValeurs
    }
    
    override func listerCouleursPossibles() -> [Carte.CouleurCarte] {
        return [.Pique, .Carreau, .Coeur, .Trefle]
    }
    
    
    public init? () {
        super.init (typeJeuCartes: .Cartes32)
        genererJeu ()
    }
}

public class Jeu32CartesAvecJokers : Jeu32Cartes {
    var _nombreJokers: Int
    var _jokerSansCouleur: Bool
    
    public init? (nombreJokers: Int, jokerSansCouleur: Bool) {
        self._nombreJokers = nombreJokers
        self._jokerSansCouleur = jokerSansCouleur
        super.init()
    }
    
    override public func nombreJokers() -> Int {
        return _nombreJokers
    }
    
    override func listerCouleursPossiblesJokers() -> [Carte.CouleurCarte] {
        return _jokerSansCouleur ? [.AucuneCouleur] : [.Rouge, .Noir]
    }
}
