//
//  QuestionnairePresenter.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation

protocol EstimationPresenterInput: EstimationInteractorOutput {
    
}

protocol EstimationPresenterOutput {
    
}

final class EstimationPresenter: EstimationPresenterInput {
    var output: EstimationPresenterOutput?
}
