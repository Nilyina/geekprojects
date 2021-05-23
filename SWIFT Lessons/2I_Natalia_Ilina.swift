// Домашнее задание по уроку 1  1
//Задача #1
//Решение квадратного уравнения вида ax^2 + bx + c = 0

import Foundation

let a = -1.0, b = 2.0, c = 9.0
var solution1 = 0.0
var solution2 = 0.0
var Dis:Double? = (b * b) - (4 * a * c)
var partOfEquation:Double? = (sqrt(Dis!))/(2 * a)
if Dis! > 0 {
    solution1 = Double((-b) + partOfEquation!)
    solution2 = Double((-b) - partOfEquation!)

    print("Найдены два решения \(solution1) и \(solution2)")

} else if Dis! == 0 {
    solution1 = (-b)/(2 * a)
    solution2 = (-b)/(2 * a)
    print("Найдено одно решение \(solution2)")
} else if Dis! < 0 {
    print("Уравнение не имеет решений")
}




//Задача #2
// Найти площадь, периметр и гипотенузу прямоугольного треугольника, если даны его катеты
let cathet1 = 3.1
let cathet2 = 4.0
var hypotenuse = 0.0
if cathet2 > 0 && cathet1 > 0 {
    let Square = Int(cathet1 * cathet2)
    hypotenuse = sqrt(cathet1 * cathet1 + cathet2 * cathet2)
    let integerHypotenuse = Int(hypotenuse)
    // Переменная integerHypotenuse объявляется для компактного представления hypotenuse

    let Perimeter = Int(cathet1 + cathet2 + hypotenuse)

    print("Гипотенуза равна \(integerHypotenuse), Площадь равна \(Square), Периметр равен \(Perimeter)")
} else {
    print("Значения катетов не могут быть отрицательными")
}


//Задача #3
//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
import Foundation


print("Введите сумму вклада", terminator: ": ")
var userEnterDepo = readLine()
var deposit = Double(userEnterDepo!)
print("Введите число годового процента", terminator: ": ")
var userEnterRate = readLine()
var annualRate = Double(userEnterRate!)
print("Введите количество лет размещения вклада", terminator: ": ")
var userEnterPeriod = readLine()
var nYear = Int(userEnterPeriod!)

for _ in (1...nYear!) {
    deposit! = deposit! + (deposit! * annualRate! / 100)

}
print("Через \(nYear!) лет вы получите \(Int(deposit!)) рублей")
