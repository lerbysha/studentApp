//
//  TimetableAPI.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import Moya

public enum TimetableAPI {
    
}

extension TimetableAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://portal-dis.kpfu.ru/e-ksu/")!
    }

    public var path: String {
        return "/timetable/"
    }

    public var method: Moya.Method {
        return .post
    }

    public var sampleData: Data {
        return Data()
    }

    public var validationType: ValidationType {
        return .successCodes
    }

    public var task: Task {
        switch self {
        default: break
        }
    }

    public var headers: [String: String]? {
        return [:]
    }
}
