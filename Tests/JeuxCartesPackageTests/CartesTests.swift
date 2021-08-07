//
//  CartesTests.swift
//  MyTestAppTests
//
//  Created by Stéphane HACOUT on 06/08/2021.
//

import XCTest
@testable import JeuxCartesPackage

class CartesTests: XCTestCase {
    var carteValetPique: Carte!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        carteValetPique = Carte (couleur: .Pique, valeur: .Valet)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        jeu32Cartes = nil
//        jeu32CartesAvecJokers = nil
        carteValetPique = nil
        try super.tearDownWithError()
    }

    func testInitialisationCartesNonValides () {
        XCTAssertNil(Carte ())
        XCTAssertNil(Carte (couleur: .AucuneCouleur, valeur: .AucuneValeur))
        XCTAssertNil(Carte (couleur: .Pique, valeur: .Joker))
        XCTAssertNil(Carte (couleur: .Carreau, valeur: .Excuse))
        XCTAssertNil(Carte (couleur: .Rouge, valeur: .Valet))
        XCTAssertNil(Carte (couleur: .AucuneCouleur, valeur: .Valet))
        XCTAssertNil(Carte (couleur: .Pique, valeur: .AucuneValeur))
        }
    
    func testInitialisationJokers () {
        XCTAssertNotNil(Carte (couleur: .AucuneCouleur, valeur: .Joker))
        XCTAssertNotNil(Carte (couleur: .Rouge, valeur: .Joker))
        XCTAssertNotNil(Carte (couleur: .Noir, valeur: .Joker))
    }
    
    func testInitialisationExcuse () {
        XCTAssertNotNil(Carte (couleur: .AucuneCouleur, valeur: .Excuse))
    }

    func testInitialisationsCartesValides () {
        // Carte Valet de pique
        XCTAssertNotNil(carteValetPique)
        XCTAssertEqual(carteValetPique?.couleur, .Pique, "La couleur de la carte ne correspond pas")
        XCTAssertEqual(carteValetPique?.valeur, .Valet, "La valeur de la carte ne correspond pas")
        
    }
    
    func testToutesLesProprietesCartes () {
        XCTAssertEqual(Carte.CouleurCarte.allCases.count, 8, "Le nombre de couleurs possibles est invalide")
        XCTAssertEqual(Carte.ValeurCarte.allCases.count, 17, "Le nombre de valeurs possibles est invalide")
    }
    
    func testFonctionsPubliquesCartes () {
        XCTAssertEqual(carteValetPique?.texteValeur (), "Valet", "Le texte de la valeur ne correspond pas")
        XCTAssertEqual(carteValetPique?.texteCouleur() , "Pique", "Le texte de la couleur ne correspond pas")
    }

}
