//
//  main.swift
//  2I_Natalia_Ilina_home_task_lesson-2
//
//  Created by nilyina on 25.05.2021.
//

import Foundation

////  Написать функцию, которая определяет, четное число или нет.
//
//// Ниже в коммент-строке пыталась получить данные от пользователя. Не получилось) Наверное, проблема с областью видимости
//////print("Введите любое целое число", terminator: ": ")
//////let userEnterNumber:String? = readLine()
//////let userNumber = Int(userEnterNumber!)
////
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

//
//  Написать функцию, которая определяет, делится ли число без остатка на 3.

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




//  Создать возрастающий массив из 100 чисел.

    var array: [Int] = []
    for i in 0...100 {
        array.append(i)
    }
    print(array)

////  Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

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
func filterNumbers(number:Int) -> Bool {
    return number % 2 != 0 && number % 3 == 0
}


//  *Заполнить массив из 100 элементов различными простыми числами (подробности на странице урока).
//Скопировано из решения предподавателем предыдущего потока.
typealias FibonacciType = Decimal
var fibonacci = [FibonacciType]()

func createFibonacciNumber (for array: inout [FibonacciType]) {
//    guard array.count > 1 else {
//        array.append (1)
//        return
//    }
    
    
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



//* Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.
//7:19
