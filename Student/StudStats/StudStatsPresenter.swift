//
//  StudStatsPresenter.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation

protocol StudStatsPresenterInput: StudStatsInteractorOutput {
    
}

protocol StudStatsPresenterOutput {
    
}

final class StudStatsPresenter: StudStatsPresenterInput {
    var output: StudStatsPresenterOutput?
}
