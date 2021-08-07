//
//  JeuxCartesTests.swift
//  MyTestAppTests
//
//  Created by Stéphane HACOUT on 07/08/2021.
//

import XCTest
@testable import JeuxCartesPackage

class JeuxCartesTests: XCTestCase {
        var jeu32Cartes: Jeu32Cartes!
        var jeu32CartesAvec2JokersSansCouleur: Jeu32CartesAvecJokers!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        jeu32Cartes = Jeu32Cartes ()
        jeu32CartesAvec2JokersSansCouleur = Jeu32CartesAvecJokers (nombreJokers: 2, jokerSansCouleur: true)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        jeu32Cartes = nil
        jeu32CartesAvec2JokersSansCouleur = nil
        try super.tearDownWithError()
    }

    func testInitialisationsJeuxCartesNonValides () {
        XCTAssertNil(JeuCartes ())
    }

    func testInitialisationsJeuxCartesValides () {
        // jeu de 32 cartes
        XCTAssertEqual(jeu32Cartes.cartes.count, 32, "Le nombre de cartes d'un jeu de 32 cartes est invalide")
        
        // jeu de 32 cartes avec Jokers
        XCTAssertEqual(jeu32CartesAvec2JokersSansCouleur.cartes.count, 34, "Le nombre de cartes d'un jeu de 32 cartes avec 2 Jokers est invalide")

    }
}
