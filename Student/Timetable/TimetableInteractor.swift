//
// TimetableInteractor.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol TimetableInteractorInput: TimetableViewControllerOutput {
    
}

protocol TimetableInteractorOutput {
    
}

final class TimetableInteractor: TimetableInteractorInput {
    var output: TimetableInteractorOutput?
    let provider = TimetableProvider()
    
    
}
