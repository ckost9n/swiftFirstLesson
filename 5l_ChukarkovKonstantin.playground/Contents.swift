import UIKit

enum ChangeIgnition: String {
    case start = "запущен"
    case stop = "заглушен"
}

enum ChangeWidows: String {
    case open = "открыты"
    case close = "закрыты"
}


protocol Car {
    
    
    var model: String { get set }
    var age: Int { get set }
    var ignition: ChangeIgnition { get set }
    var windows: ChangeWidows { get set }
    
    mutating func changeIgnition()
    mutating func changeWidows()
}


extension Car {
    
    
    
    mutating func changeIgnition(properties: ChangeIgnition) {
        switch properties {
        case .start: self.ignition = .start
            print("У \(self.model) двигатель \(self.ignition.rawValue)")
        case .stop: self.ignition = .stop
            print("У \(self.model) двигатель \(self.ignition.rawValue)")
        }
    }
    
    mutating func changeWidows(properties: ChangeWidows) {
        switch properties {
        case .open: self.windows = .open
            print("У \(self.model) окна \(self.windows.rawValue)")
        case .close: self.windows = .close
            print("У \(self.model) окна \(self.windows.rawValue)")
        }
    }
}

class TrunkCar: Car {
    
    func changeWidows() {
    }
    
    func changeIgnition() {
    }
    
    
    var model: String = ""
    var age: Int = 0
    var ignition: ChangeIgnition = .stop
    var windows: ChangeWidows = .close
    
    enum TypeCar: String {
        case sport = "Спортивной"
        case truck = "Грузовой"
    }
    
    
    let type: TypeCar = .truck
       
       var bootVolume: Int

       
       init(model: String, age: Int, bootVolume: Int) {
           self.bootVolume = bootVolume
           self.model = model
           self.age = age
       }
    
     var trunkVolume: Int = 0
    
    enum ChangeTrunkStatus {
        case load
        case upload
    }
    
    func changeTrunkVolume(act: ChangeTrunkStatus,trunkVolume: Int) {
        switch act {
        case .load:
            self.trunkVolume += trunkVolume
            if self.trunkVolume > self.bootVolume {
                let unnecessary = self.trunkVolume - self.bootVolume
                self.trunkVolume = self.bootVolume
                print("Ошибка, слишком большой объем пытаетесь загрузить. Объем багажа \(self.model) заполнен на максимум: \(self.trunkVolume)/\(self.bootVolume) и осталось незагруженно: \(unnecessary)")
            }
            else {
                print("Погрузка в \(self.model) прошла успешна, багажник заполнен на \(self.trunkVolume) из \(self.bootVolume)")
            }
        case .upload:
            self.trunkVolume -= trunkVolume
            if self.trunkVolume < 0 {
                self.trunkVolume += trunkVolume
                print("Ошибка, из \(self.model) невозможно выгрузить \(trunkVolume) литров, там всего \(self.trunkVolume) литров")
            }
            else {
                print("Выгрузка из \(self.model) прошла успешна, багажник заполнен на \(self.trunkVolume) из \(self.bootVolume)")
            }
        }
    }
    
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Марка \(self.type.rawValue) машины: \(self.model), год выпуска: \(self.age), объем багажника: \(self.trunkVolume)/\(self.bootVolume) литров, двигатель \(self.ignition.rawValue), окна \(self.windows.rawValue)"
    }
}


class SportCar: Car {
    func changeWidows() {
    }
    
    func changeIgnition() {
    }
    
    enum TypeCar: String {
        case sport = "Спортивной"
        case truck = "Грузовой"
    }
    
    var model: String = ""
    var age: Int = 0
    var ignition: ChangeIgnition = .stop
    var windows: ChangeWidows = .close
    
    let type: TypeCar = .sport
    
    var topNitro: Int
    
    var nitro: Int = 0
    
    init(model: String, age: Int, topNitro: Int) {
        self.topNitro = topNitro
        self.nitro = topNitro
        self.model = model
        self.age = age
    }
    
    
    enum ChangeNitro {
        case refill
        case use
    }
    
    func changeNitro(act: ChangeNitro, nitro: Int) {
        switch act {
        case .refill:
            self.nitro += nitro
            if self.nitro > self.topNitro {
                let unnecessary = self.nitro - self.topNitro
                self.nitro = self.topNitro
                print("Ошибка, слишком большой объем пытаетесь загрузить. Бак нитро \(self.model) заполнен на максимум: \(self.nitro)/\(self.topNitro) литров, и осталось незагруженно: \(unnecessary)")
            }
            else {
                print("Добавка нитро в \(self.model) прошла успешна, бак нитро заполнен на \(self.nitro) из \(self.topNitro)")
            }
        case .use:
            self.nitro -= nitro
            if self.nitro < 0 {
                self.nitro += nitro
                print("Ошибка, \(self.model) не может использовать \(nitro) литров, там всего \(self.nitro) литров")
            }
            else {
                print("Использование \(self.model) нитро прошла успешна, бак нитро заполнен на \(self.nitro) из \(self.topNitro)")
            }
        }
    }
}

extension SportCar: CustomStringConvertible {
var description: String {
    return "Марка \(self.type.rawValue) машины: \(self.model), год выпуска: \(self.age), бак нитро: \(self.nitro)/\(self.topNitro) литров, двигатель \(self.ignition.rawValue), окна \(self.windows.rawValue)"
    }
}

var ladaLargus = TrunkCar(model: "Lada Largus", age: 2014, bootVolume: 560)
var mazda = SportCar(model: "Mazda", age: 2009, topNitro: 5)
var largus = TrunkCar(model: "Lada", age: 2007, bootVolume: 350)
var mazda3 = SportCar(model: "Mazda 3", age: 2018, topNitro: 10)

print(ladaLargus.description)
print(mazda3.description)
ladaLargus.changeTrunkVolume(act: .load, trunkVolume: 300)
print(ladaLargus.description)
mazda3.changeNitro(act: .use, nitro: 5)
mazda3.changeNitro(act: .refill, nitro: 7)
largus.changeWidows(properties: .open)
mazda.changeIgnition(properties: .start)
largus.changeTrunkVolume(act: .load, trunkVolume: 400)
mazda.changeNitro(act: .use, nitro: 3)
print(ladaLargus.description)
print(mazda.description)
