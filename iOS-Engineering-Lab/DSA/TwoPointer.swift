//
//  TwoPointer.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 13/04/26.
//

class TwoPointer {
    func getMinDistance(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
          var distance = 0
            while true {
                let left = start - distance
                let right = start + distance
            
                if left >= 0 && nums[left] == target {
                    return distance
                }
                if right < nums.count && nums[right] == target {
                return distance
                }
                distance += 1
            }
        }
}
