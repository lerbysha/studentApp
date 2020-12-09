//
//  ApplicationFillingInteractor.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ApplicationFillingInteractorInput: ApplicationFillingViewControllerOutput {
  
}

protocol ApplicationFillingInteractorOutput {
    
}

final class ApplicationFillingInteractor: ApplicationFillingInteractorInput {
    var output: ApplicationFillingInteractorOutput?
    let provider = ApplicationFillingProvider()
    let user: UserEntity = User.shared
    
   
    }

