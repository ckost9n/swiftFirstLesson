import UIKit

class Car {
    
    enum TypeCar: String {
        case sport = "Спортивной"
        case truck = "Грузовой"
    }
    
    enum ChangeIgnition: String {
        case start = "запущен"
        case stop = "заглушен"
    }

    enum ChangeWidows: String {
        case open = "открыты"
        case close = "закрыты"
    }
    
    var model: String = ""
    var age: Int = 0
    var ignition: ChangeIgnition = .stop
    var windows: ChangeWidows = .close
    
    
    func changeIgnition(properties: ChangeIgnition) {
        switch properties {
        case .start: self.ignition = .start
            print("У \(self.model) двигатель \(self.ignition.rawValue)")
        case .stop: self.ignition = .stop
            print("У \(self.model) двигатель \(self.ignition.rawValue)")
        }
    }
    
    func changeWidows(properties: ChangeWidows) {
        switch properties {
        case .open: self.windows = .open
            print("У \(self.model) окна \(self.windows.rawValue)")
        case .close: self.windows = .close
            print("У \(self.model) окна \(self.windows.rawValue)")
        }
    }

    func printProperties() {
        print("Марка машины: \(self.model), год выпуска: \(self.age), двигатель \(self.ignition.rawValue), окна \(self.windows.rawValue)")
    }
}

class truckCar: Car {
    
    let type: TypeCar = .truck
    
    var bootVolume: Int

    
    init(model: String, age: Int, bootVolume: Int) {
        self.bootVolume = bootVolume
        super.init()
        self.model = model
        self.age = age
    }
    
    enum ChangeTrunkStatus {
        case load
        case upload
    }

    var trunkVolume: Int = 0
    
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
    
    override func printProperties() {
        print("Марка \(self.type.rawValue) машины: \(self.model), год выпуска: \(self.age), объем багажника: \(self.trunkVolume)/\(self.bootVolume) литров, двигатель \(self.ignition.rawValue), окна \(self.windows.rawValue)")
    }
}

class sportCar: Car {
    
    let type: TypeCar = .sport
    
    var topNitro: Int
    
    var nitro: Int = 0
    
    init(model: String, age: Int, topNitro: Int) {
        self.topNitro = topNitro
        self.nitro = topNitro
        super.init()
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
    
    override func printProperties() {
        print("Марка \(self.type.rawValue) машины: \(self.model), год выпуска: \(self.age), бак нитро: \(self.nitro)/\(self.topNitro) литров, двигатель \(self.ignition.rawValue), окна \(self.windows.rawValue)")
    }
    
}


var ladaLargus = truckCar(model: "Lada Largus", age: 2014, bootVolume: 560)
var mazda = sportCar(model: "Mazda", age: 2009, topNitro: 5)
var largus = truckCar(model: "Lada", age: 2007, bootVolume: 350)
var mazda3 = sportCar(model: "Mazda 3", age: 2018, topNitro: 10)

ladaLargus.printProperties()
mazda3.printProperties()
ladaLargus.changeTrunkVolume(act: .load, trunkVolume: 300)
ladaLargus.printProperties()
mazda3.changeNitro(act: .use, nitro: 5)
mazda3.changeNitro(act: .refill, nitro: 7)
largus.changeWidows(properties: .open)
mazda.changeIgnition(properties: .start)
largus.changeTrunkVolume(act: .load, trunkVolume: 400)
mazda.changeNitro(act: .use, nitro: 3)
ladaLargus.printProperties()
mazda.printProperties()
largus.printProperties()
mazda3.printProperties()
