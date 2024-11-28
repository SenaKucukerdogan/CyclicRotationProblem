import UIKit

/*
 
 An array A consisting of N integers is given. Rotation of the array means that each element is shifted
 right by one index, and the last element of the array is moved to the first place. For example, the
 rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and
 6 is moved to the first place).

 The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.

 Write a function:

 public func solution(_ A : inout [Int], _ K : Int) -> [Int]

 that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.

 ********
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 
 
 ********
 
 For another example, given

     A = [0, 0, 0]
     K = 1
 the function should return [0, 0, 0]

 Given

     A = [1, 2, 3, 4]
     K = 4
 the function should return [1, 2, 3, 4]

 Assume that:

 N and K are integers within the range [0..100];
 each element of array A is an integer within the range [−1,000..1,000].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the
 assessment.
 
 */

func solution(A: [Int], K: Int) -> [Int] {  // For time complexity start looking from here
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    for _ in 1...K { // O(n)
        result = rotateRightOnce(A: result) // and jump this func and we find O(n) too. And
    }                                       //because of that our time complexity is O(n^2) or quadratic
    
    return result
}

func rotateRightOnce(A: [Int]) -> [Int] {
    var newArray = Array<Int>(repeating: 0, count: A.count)
    
    for i in 0..<A.count - 1 { // O(n)
        newArray[i + 1] = A[i]
    }
    newArray[0] = A.last!
    
    return newArray
}

rotateRightOnce(A: [1,2,3,4,5])

solution(A: [1,2,3,4,5], K: 1) // 5 1 2 3 4
solution(A: [1,2,3,4,5], K: 2) // 4 5 1 2 3
solution(A: [1,2,3,4,5], K: 3) // 3 4 5 1 2

solution(A: [3,8,9,7,6], K: 3) // 9 7 6 3 8

solution(A: [], K: -1)
