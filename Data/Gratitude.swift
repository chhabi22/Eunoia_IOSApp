//
//  Gratitude.swift
//  EunoiaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

struct Gratitude {
    var name : String
    var date : Date
}

var gratitudes = [Gratitude]()

let configuredate = DateFormatter()
var fixed = populatefixed()

func populatefixed() -> [Gratitude] {
    configuredate.dateFormat = "EEEE, MMM d, yyyy"
    var gg = [Gratitude]()
    gg.append(Gratitude(name: "", date: Date()))
    gg.append(Gratitude(name: "", date: Date().yesterday))
    return gg
}
