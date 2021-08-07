//
//  cartes.swift
//  MyTestApp
//
//  Created by Stéphane HACOUT on 06/08/2021.
//

import Foundation

public class Carte {
    public enum CouleurCarte: CaseIterable {
        case AucuneCouleur
        case Pique
        case Coeur
        case Carreau
        case Trefle
        case Atout
        case Rouge
        case Noir
    }
    
    //    enum ValeurCarte: CaseIterable, Comparable, Strideable {
    public enum ValeurCarte: CaseIterable {
        case AucuneValeur
        case Deux
        case Trois
        case Quatre
        case Cinq
        case Six
        case Sept
        case Huit
        case Neuf
        case Dix
        case Valet
        case Dame
        case Roi
        case As
        case Joker
        case Cavalier
        case Excuse
    }
    
    public var couleur: CouleurCarte
    public var valeur: ValeurCarte
    
    public init? (couleur: CouleurCarte = .AucuneCouleur, valeur: ValeurCarte = .AucuneValeur) {
        if couleur == .AucuneCouleur && valeur == .AucuneValeur { return nil }
        self.couleur = couleur
        self.valeur = valeur
        if !carteValide () {
            return nil
        }
    }
    
    public func carteValide () -> Bool {
        return carteSansCouleurValide () || carteCouleurValide ()
    }
    
    private func carteSansCouleurValide () -> Bool {
        guard couleur == .AucuneCouleur else { return false }
        // les seules cartes sans couleur valides sont l'excuse et le joker
        guard valeur == .Excuse || valeur == .Joker else {
            return false
        }
        return true
    }
    
    private func carteCouleurValide () -> Bool {
        guard couleur != .AucuneCouleur else { return false }
        switch valeur {
        case .AucuneValeur:
            return false
        case .Joker:
            // les jokers de couleur ne peuvent être que rouges ou noirs
            return couleur == .Rouge || couleur == .Noire
        case .Excuse:
            return false
        default:
            return couleur == .Pique ||  couleur == .Carreau ||  couleur == .Coeur || couleur == .Trefle
        }
    }
}
