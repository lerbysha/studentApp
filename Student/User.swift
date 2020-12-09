//
//  User.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation

public protocol UserEntity: AnyObject {
    var userID: Int { get set }
    var teacherID: Int { get set }
    var subjectID: Int { get set }
    var timeInterval: Int { get set }
    var questionId: Int { get set }
    var answerId: Int { get set }
    var userSession: String { get set }
    
}

final class User: UserEntity {
    
    
    
    public static let shared = User()
    private let defaults = UserDefaults.standard
    
    var teacherID: Int {
        get { return defaults.integer(forKey: "teacherID") }
        set { defaults.set(newValue, forKey: "teacherID") }
    }
    
    var subjectID: Int {
        get { return defaults.integer(forKey: "subjectID") }
        set { defaults.set(newValue, forKey: "subjectID") }
    }
    
    var timeInterval: Int {
        get { return defaults.integer(forKey: "timeInterval") }
        set { defaults.set(newValue, forKey: "timeInterval") }
    }
    
    var questionId: Int {
        get { return defaults.integer(forKey: "questionId") }
        set { defaults.set(newValue, forKey: "questionId") }
    }
    
    var answerId: Int {
        get { return defaults.integer(forKey: "answerId") }
        set { defaults.set(newValue, forKey: "answerId") }
    }
    
    var userID: Int {
        get { return defaults.integer(forKey: "userID") }
        set { defaults.set(newValue, forKey: "userID") }
    }
    
    var userSession: String {
        get { return defaults.string(forKey: "userSession") ?? "" }
        set { defaults.set(newValue, forKey: "userSession") }
    }
    
    
}
