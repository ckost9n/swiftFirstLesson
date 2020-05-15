import UIKit

// 1-2) Определение делится ли число a на число b без остатка. Через bool сделал для решения одного вариант из 4 задания.


func evenOdd (a: Int, b: Int) -> Bool {
    let a = a
    let b = b
    let c = a%b
    if c == 0{
        return true
    } else {
        return false
    }
}

// Проверка 1-ого задания

var a = 9
var b = 2

if (evenOdd(a: a, b: b)) == true {
    print("Число \(a) четное!")
} else {
    print("Число \(a) нечетное!")
}

// Проверка 2-ого задания

a = 11
b = 3

if (evenOdd(a: a, b: b)) == true {
    print("Число \(a) кратно \(b)")
} else {
    print("Число \(a) не делится на \(b) без остатка")
}


// 3) Возрастающий массив до 100.

var upArray = Array (1...100)
print(upArray)

// 4) Удаление из массива всех четных чисел и всех, которые не делятся на 3.



var newArray = [Int]()
for _ in upArray{
    let i = upArray.removeFirst()
    if evenOdd(a: i, b: 2) == false {
        newArray.append(i)
    }
}
for _ in newArray{
    let i = newArray.removeFirst()
    if evenOdd(a: i, b: 3) == true {
        upArray.append(i)
    }
}
print(upArray)
// 4) Короткий вариант удаления нужных чисел.

upArray = Array (1...100)
upArray = upArray.filter(){$0 % 2 != 0 && $0 % 3 == 0}
print(upArray)

// 5) Функция добавляющая в массив новое число Фибаначи. Добавляет n-элементов( оставил пока n = 15 что бы не грузить cильно при проверках следющего кода)

func fib (n: Int) -> [Double] {
    var fibonacciArray: [Double] = [1, 1]
    (2...n).forEach {i in fibonacciArray.append(fibonacciArray[i-1] + fibonacciArray[i-2])}
    return fibonacciArray
}
print(fib(n: 100))
    
// 6) Функция выдает массив из простых чисел вплоть до числа n.


func eratos (nArray: [Int]) -> [Int]{
    var er = [Int]()
    var newArr = nArray
    while let p = newArr.first {
        er.append(p)
        newArr = newArr.filter(){$0 % p != 0}
    }
    return er
}
print(eratos(nArray: Array(2...100)))


