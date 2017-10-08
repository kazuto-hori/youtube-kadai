//
//  File.swift
//  youtube-kadai
//
//  Created by 堀　和人 on 2017/10/08.
//  Copyright © 2017 kazuto.hori. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object{
    dynamic var id = 0
    
    dynamic var title = ""
    
    dynamic var contents = ""
    
    override static func primaryKey() -> String?{
        return "id"
    }
}
