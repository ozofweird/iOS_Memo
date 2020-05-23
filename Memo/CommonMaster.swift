//
//  CommonMaster.swift
//  Memo
//
//  Created by Ahn on 2020/05/23.
//  Copyright © 2020 ozofweird. All rights reserved.
//


// 1.
struct Content {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

protocol ContentProtocol {
    func addSend(data: String)
    func detailSend(data: String, row: Int)
}
