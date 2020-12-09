//
//  TimetablePresenter.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation

protocol TimetablePresenterInput: TimetableInteractorOutput {
    
}

protocol TimetablePresenterOutput {
    
}

final class TimetablePresenter: TimetablePresenterInput {
    var output: TimetablePresenterOutput?
    
    
}
