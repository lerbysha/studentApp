//
//  ExamsAPI.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import Moya

public enum StatsAPI {
    
}

extension StatsAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://portal-dis.kpfu.ru/e-ksu/")!
    }

    public var path: String {
        return "/e-ksu/portal_pg_mobile.get_rated_subjects?p_user_id=1&p2=1&p_date=05.02.2020/"
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
