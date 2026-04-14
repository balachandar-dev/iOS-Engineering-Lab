//
//  Hashmap.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 14/04/26.
//

class Hashmap {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            var dictionary = [Int:Int]()

            for i in 0..<nums.count {
                let firstDifference = target - nums[i]
                if let index = dictionary[firstDifference] {
                    return [index, i]
                }
                dictionary[nums[i]] = i
            }
            return []
        }
}
