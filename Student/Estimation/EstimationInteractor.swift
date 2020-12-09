//
//  QuestionnaireInteractor.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation


protocol EstimationInteractorInput: EstimationViewControllerOutput {
    func authorize(login: String, password: String)
}

protocol EstimationInteractorOutput {
    
}

final class EstimationInteractor: EstimationInteractorInput {
    func submit(questionnaireModel: EstimationModel) {
        
    }
    
    var output: EstimationInteractorOutput?
    let provider = EstimationProvider()
    
    func authorize(login: String, password: String) {
        let result = provider.emailEstimation(email: login, password: password)
        print(result)
    }
}
