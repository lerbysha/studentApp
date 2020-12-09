//
//  StudStatsInteractor.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation

protocol StudStatsInteractorInput: StudStatsViewControllerOutput {
    func authorize(login: String, password: String)
}

protocol StudStatsInteractorOutput {
    
}

final class StudStatsInteractor: StudStatsInteractorInput {
    var output: StudStatsInteractorOutput?
//    let provider = SchoolsProvider()
    
    func authorize(login: String, password: String) {
        
    }
}
