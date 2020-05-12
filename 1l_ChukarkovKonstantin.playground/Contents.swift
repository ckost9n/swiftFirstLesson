import UIKit

// 1) квадратное уравнение вида: ax^2+bx+c=0.

func radicalEquation(a: Double, b: Double, c: Double){
    let a: Double = a
    let b: Double = b
    let c: Double = c
    let discriminant = (b*b)-(4*a*c)

    if a == 0 {
        let radical: Double = (-1*c)/b
        print("У уравнения один корень и он равен \(radical)")
    }else if discriminant < 0 {
        print("У уравнения корней нет")
    }else if discriminant == 0 {
        let radical = (-1*b)/(2*a)
        print("У вашего уравнения один корень и он равен \(radical)")
    }else if discriminant > 0 {
        let radicalOne: Double = ((-1*b)+sqrt(discriminant)/(2*a))
        let radicalTwo: Double = ((-1*b)-sqrt(discriminant)/(2*a))
        print("У вашего уравнения 2 корня \(radicalOne) и \(radicalTwo)")
    }
}
radicalEquation(a: 1, b: -8, c: 15)

// 2) Прямоугольный треугольник, где а и b его катеты.

func rightTriangle(a: Double, b: Double){
    let a: Double = a
    let b: Double = b
    let square: Double = a*b/2
    let c: Double = sqrt((a*a)+(b*b))
    let p: Double = a+b+c
    print("Плошадь треугольника равна \(square), длина гипотенузы равна \(c), периметр треуголька равен \(p)")
}
rightTriangle(a: 3, b: 4)

// 3) Вклад на n лет, под percent процентов годовых от sum суммы.

func vklad(sum: Double, percent: Double, n: Int){
    var sum: Double = sum
    let percent = percent
    let n: Int = n
    var i: Int = 1
    while i <= n {
        let totalPercent: Double = 1+(percent/100)
        sum = sum*totalPercent
        i += 1
    }
    sum = (sum*100).rounded(.toNearestOrAwayFromZero)/100
    print("Сумма вклада через \(n) лет равна \(sum)")
}
vklad(sum: 10000, percent: 13, n: 5)
