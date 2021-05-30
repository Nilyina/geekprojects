
import Foundation
//
//  Написать функцию, которая определяет, четное число или нет.


func checkEvenOrOdd(value: Int) -> String {
    if value % 2 == 0 {
        let res = "\(value) Четное число"
    return res

    } else {
        return ("\(value) нечетное число")
    }
}
 var res = checkEvenOrOdd(value: 43)
res = checkEvenOrOdd(value: 50)
print(res)

////
////  Написать функцию, которая определяет, делится ли число без остатка на 3.
//
func checkDivideThree(value: Int) -> String {
    if value % 3 == 0 {
        let str = "\(value) делится на 3 без остатка"
    return str

    } else {
        return ("\(value) не делится на 3 без остатка")
    }
}
 var str = checkDivideThree(value: 43)
str = checkDivideThree (value: 33)
print(str)


//
//
//  Создать возрастающий массив из 100 чисел.
//
    var array: [Int] = []
    for i in 0...100 {
        array.append(i)
    }
    print(array)
//
//  Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
//
for num in array {
    if (num % 2) == 0 || (num % 3) == 0 {
        array.remove(at: array.firstIndex(of: num)!)
    }
}
print("\n")
print(array)


//  *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов (подробности на странице урока).
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

//Скопировано из решения предподавателем предыдущего потока.
//func filterNumbers(number:Int) -> Bool {
//    return number % 2 != 0 && number % 3 == 0
//}


//  *Заполнить массив из 100 элементов различными простыми числами (подробности на странице урока).
//Скопировано из решения предподавателем предыдущего потока.
typealias FibonacciType = Decimal
var fibonacci = [FibonacciType]()

func createFibonacciNumber (for array: inout [FibonacciType]) {
    guard array.count > 1 else {
        array.append (1)
        return
    }


    switch array.count {
    case 0, 1:
        array.append(1)
    default:
        let penultimateNumber = array[array.count - 2]
        let lastNumber = array[array.count - 1]
        array.append(penultimateNumber + lastNumber)
    }
}

for _ in 1...50 {
    createFibonacciNumber(for: &fibonacci)
}


print("––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")

// LESSON 3

//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//Вывести значения свойств экземпляров в консоль.
enum CarType {
    case truck, passenger
}

enum CarBrand {
    case Lamborghini, MacLaren, Renault, VOLVO, Tesla
}
enum CarEngineType {
    case diesel, petrol, electric, hybrid
}

enum StartEngine {
    case on, off
}
enum StateWindows {
    case open, lock
}



enum LoadCargo1000Cm3 {
    case possible
    case impossible (status: InitialStorageStatus)
    
    enum InitialStorageStatus {
        case full, empty, isPassengerCar
    }
}

enum AssistantStatus {
    case required
    case unnecessary
}

struct SportCar {
    let carType: CarType
    let brandName: CarBrand
    let issue: UInt
    var volumeStorageCm3: UInt
    let startEngine: StartEngine
    let stateWindows: StateWindows
    var storageUsedCm3: UInt
    let engineType: CarEngineType
    var loadCargo1000Cm3: LoadCargo1000Cm3
}

struct TruckCar {
    let carType: CarType
    let brandName: CarBrand
    var issue: UInt
    let volumeStorageCm3: UInt
    let startEngine: StartEngine
    let stateWindows: StateWindows
    var storageUsedCm3: UInt
    let engineType: CarEngineType
    let loadCargo1000Cm3: LoadCargo1000Cm3
}

struct Car {
    let carType: CarType
    var brandName: CarBrand
    var issue: UInt
    let volumeStorageCm3: UInt
    let startEngine: StartEngine
    let stateWindows: StateWindows
    var storageUsedCm3: UInt
    let engineType: CarEngineType
    var loadCargo1000Cm3: LoadCargo1000Cm3
    let initialStorageStatus: LoadCargo1000Cm3.InitialStorageStatus
    
    
    func technicalMaintenance() {
        let year = UInt(Calendar.current.component(.year, from: Date()))
        if (year - issue) <= 3 {
            print ("All is good! Maintenance isn't required")
        } else {
            print ("Car is older than 3 years! Annual maintenance is required")
        }
    }
    func operationPeriod() {
        let year = UInt(Calendar.current.component(.year, from: Date()))
        print ("Operation period of car is \(year - issue) years")
    }
    
    func rentalAdvice() {
        
        switch brandName {
        case .VOLVO:
            print ("Suitable for commercial cargo service")
        case .Lamborghini:
            print ("Suitable for selfpresentation, speed driving and fun")
        case .Tesla:
            print ("Suitable for sustainable lifestyle")
        case .MacLaren:
            print ("Collection item! Suitable for selfpresentation, speed driving and fun")
        case .Renault:
            print ("Suitable for commercial cargo service")
        }
    }
}



var car1 = Car(carType: .passenger, brandName: .Lamborghini, issue: 2018, volumeStorageCm3: 100, startEngine: .off, stateWindows: .lock, storageUsedCm3: 100, engineType: .petrol, loadCargo1000Cm3: .impossible(status: .isPassengerCar), initialStorageStatus: .isPassengerCar)

print(car1.issue)
car1.technicalMaintenance()
car1.rentalAdvice()
print("––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")

print(car1)

var car2 = Car(carType: .passenger, brandName: .VOLVO, issue: 2001, volumeStorageCm3: 100, startEngine: .off, stateWindows: .lock, storageUsedCm3: 100, engineType: .diesel, loadCargo1000Cm3: .possible, initialStorageStatus: LoadCargo1000Cm3.InitialStorageStatus.isPassengerCar)

print("––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––")
car2.technicalMaintenance()
car2.operationPeriod()
car2.rentalAdvice()


struct Circle {
    var radius: Double
    var diameter: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
    
}


