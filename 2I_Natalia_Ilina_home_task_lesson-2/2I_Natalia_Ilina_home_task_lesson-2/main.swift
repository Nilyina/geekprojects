import Foundation

//MARK: - Домашнее задание к Уроку 6 (Дженерики. Замыкания. Subscripting. Функции высшего порядка.)

//Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//*Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

protocol Containable {
    var fats: Double { get set }
    var carbs: Double {get set}
    var proteins: Double { get set }
    var caloric: Double { get set }
    var weight: Double { get set }
}


class Vegetables: Containable {
    var fats: Double
    var carbs: Double
    var proteins: Double
    var caloric: Double
    var weight: Double
    
    var fibers: Double
    
    init(fats: Double, carbs: Double, caloric: Double, proteins: Double, weight: Double, fibers: Double) {
        self.fats = fats
        self.carbs = carbs
        self.proteins = proteins
        self.caloric = caloric
        self.weight = weight
        self.fibers = fibers
        
        func calculateEatenCalories() -> Double {
            return weight * caloric
        }
    }
}


struct Queue <T: Containable> {
    var elements: [T] = []
    var weight: Double
    var caloric: Double
    var fats: Double
    var carbs: Double
    var proteins: Double
    
    var totalCaloric: Double {
        var caloric = 0.0
        for element in elements {
            caloric += element.caloric
        }
        return caloric
    }
    var totalWeight: Double {
        var weight = 0.0
        for element in elements {
            weight += element.weight
        }
        return weight
    }
    
    var totalFats: Double {
        var fats = 0.0
        for element in elements {
            fats += element.fats
        }
        return fats
    }
    
    var totalCarbs: Double {
        var carbs = 0.0
        for element in elements {
            carbs += element.carbs
        }
        return carbs
    }
    
    var totalProteins: Double {
        var proteins = 0.0
        for element in elements {
            proteins += element.proteins
        }
        return proteins
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        elements.removeFirst()
    }
    
    func calculateEatenCalories() -> Double {
        return weight * caloric
    }
        
    func filterSpecificWeight(indices: Int...) -> Double {
        var totalSpecificWeight = 0.0
        for index in indices where index >= 0 && Int(index) < elements.count && elements[Int(index)].weight <= 70 {
            totalSpecificWeight += elements[index].weight
        }
        return totalSpecificWeight
    }
    
    func filterSpecifiCaloric(predicate: (T) -> Bool) -> [T] {
        var specificCaloricNewArray:[T] = []
        
        for index in elements {
            if predicate(index) {
                specificCaloricNewArray.append(index)
            }
        }
        return specificCaloricNewArray
    }
    
    subscript (index: Int) -> Double? {
        guard index >= 0 && index < elements.count else {return nil}
        return elements[index].proteins
    }
    
    subscript (indices: UInt...) -> Double {
        var caloric = 0.0
        for index in indices where index < self.elements.count {
            caloric += self.elements[Int(index)].caloric
        }
        return caloric
    }
}

extension Vegetables {
    var toText: String {
        "Количество протеина меньше 30 \(proteins)"
    }
}
var queue = Queue<Vegetables>(weight: 0.0, caloric: 0.0, fats: 0.0, carbs: 0.0, proteins: 0.0)
queue.push(Vegetables(fats: 110.45, carbs: 55.5, caloric: 48.0, proteins: 34.1, weight: 100.0, fibers: 12.4))
queue.push(Vegetables(fats: 120.6, carbs: 76.1, caloric: 59.0, proteins: 32.1, weight: 90.0, fibers: 35.4))
queue.push(Vegetables(fats: 100.4, carbs: 88.4, caloric: 54.0, proteins: 30.1, weight: 59.0, fibers: 33.4))

queue.pop()
queue.pop()

queue.push(Vegetables(fats: 120.6, carbs: 76.1, caloric: 59.0, proteins: 32.1, weight: 90.0, fibers: 35.4))
queue.push(Vegetables(fats: 100.4, carbs: 88.4, caloric: 54.0, proteins: 36.1, weight: 22.0, fibers: 33.4))
queue.push(Vegetables(fats: 120.6, carbs: 76.1, caloric: 59.0, proteins: 32.1, weight: 47.0, fibers: 35.4))
queue.push(Vegetables(fats: 100.4, carbs: 88.4, caloric: 54.0, proteins: 18.1, weight: 21.0, fibers: 33.4))

print(queue.totalWeight)
print(queue.totalCaloric)
print(queue.totalFats)
print(queue.totalCarbs)
print(queue.totalProteins)


print(queue[0])
print(queue.filterSpecificWeight(indices: 0,1,2,3,4,5,6,7))

var lowCalorie = queue.filterSpecifiCaloric() { elements in elements.caloric <= 55.0 }

lowCalorie.forEach { print($0.toText)}


//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
