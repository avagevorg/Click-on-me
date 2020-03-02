//
//  HealthManager.swift
//  Simple Clicker Game
//
//  Created by Ruslan Tereshchenko on 11.06.2018.
//  Copyright © 2018 Ruslan Tereshchenko. All rights reserved.
//

import Foundation
import HealthKit

class HealthManager
{
    public let healthStore = HKHealthStore()
    
    public func requestPermissions()
    {
        if #available(iOS 10.0, *)
        {
            let hkTypesToWrite = Set([HKSampleType.categoryType(forIdentifier: .mindfulSession)!])
            
            healthStore.requestAuthorization(toShare: hkTypesToWrite, read: nil, completion: { (success, error) in
                if success
                {
                    print("Authorization complete")
                }
                else
                {
                    print("Authorization error: \(String(describing: error?.localizedDescription))")
                }
            })
        }
        else
        {
            // Fallback on earlier versions
        }
    }
    
    func saveMeditation()
    {
        if #available(iOS 10.0, *)
        {
            let mindfulType = HKCategoryType.categoryType(forIdentifier: .mindfulSession)
            let mindfulSample = HKCategorySample(type: mindfulType!, value: 0, start: Date.init(timeIntervalSinceNow: -30), end: Date())
            healthStore.save(mindfulSample) { success, error in
                if(error != nil)
                {
                    print("abort")
                }
            }
        }
        else
        {
            // Fallback on earlier versions
        }
    }
}
