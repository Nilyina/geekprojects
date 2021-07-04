import UIKit
import Foundation


protocol Weightable {
    var weight: Double { get set }
}



class Rectangle: Weightable {
    var sideA: Double
    var sideB: Double
    var weight: Double
    func calculatePerimeter() -> Double {
        return sideA + sideB
    }
    init(sideA:Double, sideB:Double, weight: Double) {
        self.sideA = sideA
        self.sideB = sideB
        self.weight = weight
    }
}

class Circle: Weightable {
    var radius: Double
    var weight: Double
    func calculatePerimeter() -> Double {
        return 2.0 * Double.pi * radius
    }
    
    init(radius:Double, weight: Double) {
        self.radius = radius
        self.weight = weight
    }
}

struct Stack <T: Weightable>: CustomStringConvertible {
    var elements: [T] = []
    var weight: Double
    var description: String {
        return "\(elements)"
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        elements.removeLast()
    }
    var totalWeight: Double {
        var weight = 0.0
        for element in elements {
            weight += element.weight
        }
        return weight
    }
    subscript (indices: UInt...) -> Double {
        var weight = 0.0
        for index in indices where index < self.elements.count {
            weight += self.elements[Int(index)].weight
        }
        return weight
    }
}

var stack = Stack<Circle>(weight: 2)
stack.push(Circle(radius: 2, weight: 2))
stack.push(Circle(radius: 3, weight: 5))
stack.push(Circle(radius: 5, weight: 7))
stack.push(Circle(radius: 8, weight: 11))


print(stack)

