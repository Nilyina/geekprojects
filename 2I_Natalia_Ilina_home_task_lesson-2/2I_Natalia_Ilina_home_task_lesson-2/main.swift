import Foundation


//Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
//В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//Создать несколько объектов каждого класса. Применить к ним различные действия.
//Вывести значения свойств экземпляров в консоль.


//enum CarType {
//    case truck, passenger, sport
//}
//enum CarBrand {
//    case Lamborghini, MacLaren, Renault, VOLVO, Tesla
//}
//enum CarEngineType {
//    case diesel, petrol, electric, hybrid
//}
//enum StartEngine {
//    case on, off
//}
//enum StateWindows {
//    case open, lock
//}
//enum LoadCargo1000Cm3 {
//    case possible
//    case impossible (status: InitialStorageStatus)
//    enum InitialStorageStatus {
//        case full, empty
//    }
//    enum AssistantStatus {
//        case required
//        case unnecessary
//    }
//}
//
////
////class Car {
////    let carType: CarType
////    var brandName: CarBrand
////    var issue: UInt
////    let volumeStorageCm3: UInt
////    var startEngine: StartEngine
////    var mileage = 0
////
////    static var carCount = 0
////
////    init(carType: CarType, brandName: CarBrand,issue: UInt, volumeStorageCm3:UInt, startEngine: StartEngine, mileage: Int ) {
////        self.carType = carType
////        self.brandName = brandName
////        self.issue = issue
////        self.volumeStorageCm3 = volumeStorageCm3
////        self.startEngine = startEngine
////        self.mileage = mileage
////
////        Car.carCount += 1
////    }
////    static func countInfo() {
////        print("Всего \(carCount)")
////    }
////    func startEngineOff() {
////        startEngine = .off
////    }
////    func startEngineOn() {
////        startEngine = .on
////    }
////    func maintenanceAnnual() {
////        let year = Calendar.current.component(.year, from: Date())
////        if (UInt(year) - issue) <= 3 {
////            print ("All is good! Maintennace isn't required")
////        } else if (UInt(year) - issue) > 3 {
////            print ("Car is older than 3 years! Annual maintenace is required")
////        }
////    }
////}
////
////
//
//enum LoadType {
//    case back
//    case top
//    case side
//}
//enum TruckType {
//    case fridge
//    case dump
//    case tent
//}
//
//
//
//class TruckCar: Car {
//    var truckType: TruckType
//    var loadType: LoadType
//    var loadVolume: Int
//
//    init(carType: CarType, brandName: CarBrand, issue: UInt, volumeStorageCm3: UInt, startEngine: StartEngine, mileage: Int, truckType: TruckType, loadType: LoadType, loadVolume: Int) {
//        self.truckType = truckType
//        self.loadType = loadType
//        self.loadVolume = loadVolume
//
//
//        super.init(carType: carType, brandName: brandName, issue: issue, volumeStorageCm3: volumeStorageCm3, startEngine: startEngine, mileage: mileage)
//    }
//
//    func fridgeTruckType() {
//        truckType = .fridge
//    }
//
//    func dumpTruckType() {
//        truckType = .dump
//    }
//    func tentTruckType() {
//        truckType = .tent
//    }
//
//    func backLoadType() {
//        loadType = .back
//    }
//
//    func topLoadType() {
//        loadType = .top
//    }
//
//    func sideLoadType() {
//        loadType = .side
//    }
//    func availableLoadVolume() {
//        let loadCapacity:Int = 72000
//        let availableVolume = loadCapacity - loadVolume
//        if availableVolume > 0 {
//            print ("Available load volume is \(availableVolume)cm3")
//        } else if availableVolume < 0 {
//            print ("Incorrect load volume! Truck is overloaded. Try to change volume. It must be less than 72 000 cm3")
//        } else if availableVolume == 0 {
//            print ("Truck is full. Avaiable volume is 0")
//        }
//    }
//}
//
//
//enum SportType {
//    case coupe
//    case roadster
//}
//
//
//class SportCar: Car {
//    var sportType: SportType
//    var enginePower: Int
//    var speed100: Double
//    override var mileage: Int {
//        //Перезапись переменной "пробег", установка наблюдателя за ней и вывод информации о необходимсти замены колодок в консоль
//        willSet {
//            let checkPointDistance = 1000
//            let distance = newValue - mileage
//            if distance > checkPointDistance {
//                print ("Car passed the distance \(distance) km. Important! Time to replace brakepads has come \(distance - checkPointDistance) km ago!")
//            } else if distance < checkPointDistance {
//                print ("All is good! After \(checkPointDistance - distance) km replace brakepads")
//            } else if distance == checkPointDistance {
//                print ("Time to replace brakepads right now!")
//            }
//        }
//    }
//
//    init(carType: CarType, brandName: CarBrand, issue: UInt, volumeStorageCm3: UInt, startEngine: StartEngine, mileage: Int, sportType: SportType, enginePower: Int, speed100: Double) {
//        self.sportType = sportType
//        self.enginePower = enginePower
//        self.speed100 = speed100
//
//        super.init(carType: carType, brandName: brandName, issue: issue, volumeStorageCm3: volumeStorageCm3, startEngine: startEngine, mileage: mileage)
//
//        self.mileage = mileage
//
//    }
//    func sportTypeCoupe() {
//        sportType = .coupe
//    }
//    func sportTypeRoadster() {
//        sportType = .roadster
//    }
//}
//
//
//
//
////MARK*: Создание экземпляров класса Car и его наследников TruckCar и SportCar
//
//var car1 = Car(carType: .passenger, brandName: .Lamborghini, issue: 2021, volumeStorageCm3: 100, startEngine: .off, mileage: 153)
//var car2 = Car(carType: .truck, brandName: .Renault, issue: 2008, volumeStorageCm3: 72000, startEngine: .off, mileage: 25300)
//
//var truck1 = TruckCar(carType: .truck, brandName: .VOLVO, issue: 2009, volumeStorageCm3: 72000, startEngine: .off, mileage: 120000, truckType: .fridge, loadType: .back, loadVolume: 72000)
//
//
//var sport1 = SportCar(carType: .sport, brandName: .Lamborghini, issue: 2021, volumeStorageCm3: 100, startEngine: .off, mileage: 0, sportType: .coupe, enginePower: 625, speed100: 3.0)
//
//sport1.mileage = 1000
//
//
//print(sport1.mileage)
//
//print("———————————————")
//print (sport1)
//
//
//
//
//print("———————————————")
//
//print(car1.mileage, car2.mileage)
//car2 = car1
//
//print(car1.mileage, car2.mileage)
//car1.mileage = 100
//
//print(car1.mileage, car2.mileage)
//
//print (Car.carCount)
//Car.countInfo()
//
//
//truck1.availableLoadVolume()
//truck1.loadVolume = 147000
//truck1.availableLoadVolume()
//truck1.loadVolume = 15000
//truck1.availableLoadVolume()
//



//MARK: - Домашнее задание к Уроку 5 (Протоколы, расширения...)

//Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.

enum CarType {
    case Trunk, Passenger, Sport
}
enum StartEngine {
    case On, Off
}
enum StateWindows {
    case Open, Lock
}
enum StateDoor {
    case Open, Lock
}


protocol CarProtocol {
    func changeStateDoor(to: StateDoor)
    func changeStartEngine(to: StartEngine)
    func changeStateWindow(to: StateWindows)
}

class SportCar: CarProtocol {
    func changeStateDoor(to: StateDoor) {
        stateDoor = to
    }
    
    func changeStartEngine(to: StartEngine) {
        startEngine = to
    }
    
    func changeStateWindow(to: StateWindows) {
        stateWindows = to
    }
    
    var carType: CarType
    var issue: UInt
    var startEngine: StartEngine
    var stateDoor: StateDoor
    var stateWindows: StateWindows
    var enginePowerHp: UInt

    
    init(carType: CarType, issue: UInt, startEngine: StartEngine, stateDoor: StateDoor, stateWindows: StateWindows, enginePowerHp: UInt ) {
        self.carType = carType
        self.issue = issue
        self.startEngine = startEngine
        self.stateDoor = stateDoor
        self.stateWindows = stateWindows
        self.enginePowerHp = enginePowerHp
    }
}


class TrunkCar: CarProtocol {
    func changeStateDoor(to: StateDoor) {
        stateDoor = to
    }
    
    func changeStartEngine(to: StartEngine) {
        startEngine = to
    }
    
    func changeStateWindow(to: StateWindows) {
        stateWindows = to
    }
    
    var carType: CarType
    var issue: UInt
    var startEngine: StartEngine
    var stateDoor: StateDoor
    var stateWindows: StateWindows
    var trunkVolume: UInt
    
    init(carType: CarType, issue: UInt, startEngine: StartEngine, stateDoor: StateDoor, stateWindows: StateWindows, trunkVolume: UInt) {
        self.carType = carType
        self.issue = issue
        self.startEngine = startEngine
        self.stateDoor = stateDoor
        self.stateWindows = stateWindows
        self.trunkVolume = trunkVolume
    }
}



extension SportCar: CustomStringConvertible {
    
    var description:  String {
        return "Summary \n ––––––––––––––––– \n Car – \(carType) \n Issue – \(issue) \n Engine state – \(startEngine)\n State doors – \(stateDoor) \n State windows – \(stateWindows)\n Engine Power Hp – \(enginePowerHp)\n"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description:  String {
        return "Summary \n ––––––––––––––––– \n Car – \(carType) \n Issue – \(issue) \n Engine state –  \(startEngine) \n State doors – \(stateDoor) \n State windows – \(stateWindows) \n Trunk volume –  \(trunkVolume)"
    }
}

let car1 = SportCar(carType: .Sport, issue: 2021, startEngine: .Off, stateDoor: .Lock, stateWindows: .Lock, enginePowerHp: 625)
let car2 = SportCar(carType: .Sport, issue: 2020, startEngine: .Off, stateDoor: .Lock, stateWindows: .Open, enginePowerHp: 598)

let trunk1 = TrunkCar(carType: .Trunk, issue: 2019, startEngine: .On, stateDoor: .Open, stateWindows: .Open, trunkVolume: 100000)

print (car1)
print (trunk1)

car1.stateDoor = .Open
trunk1.stateDoor = .Lock


print (car1)
print (trunk1)
