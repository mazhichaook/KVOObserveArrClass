//
//  ArrayClass.swift
//  KVOObserveArrClass
//
//  Created by 马志超 on 2017/4/3.
//  Copyright © 2017年 ziqiang. All rights reserved.
//

import UIKit

class ArrayClass: NSObject {

    var modelArr: [Any]? // 需要观察的对象
    var name: String?
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print(key)
    }
    
    override var description: String{
        let keys = [ "modelArr" , "name" ]
        
        return dictionaryWithValues(forKeys: keys).description
    }
}
