import UIKit

enum ChangeIgnition: String {
    case start = "запущен"
    case stop = "заглушен"
}

enum ChangeWidows: String {
    case open = "открыты"
    case close = "закрыты"
}

enum ChangeTrunkStatus {
    case load
    case upload
}

struct someCar {
    let model: String
    let age: Int
    var bootVolume: Int
    var ignition: ChangeIgnition = .stop
    var windows: ChangeWidows = .open
    var trunkVolume: Int = 0
    
    mutating func changeTrunkVolume(act: ChangeTrunkStatus,trunkVolume: Int) {
        switch act {
        case .load:
            self.trunkVolume += trunkVolume
            if self.trunkVolume > self.bootVolume {
                self.trunkVolume -= trunkVolume
                print("Погрузка в \(self.model) невозможна, не хватает емкости багажа, багажник заполнен на \(self.trunkVolume) из \(self.bootVolume)")
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

    func printProperties() {
        print("Марка машины: \(self.model), год выпуска: \(self.age), максимальный объем багажника: \(self.bootVolume) литров, двигатель \(self.ignition.rawValue), окна \(self.windows.rawValue), багажник заполнен на \(self.trunkVolume) литров.")
    }
    
}

var passengerCar = someCar(model: "mazda 3", age: 2018, bootVolume: 295)
var truck = someCar(model: "Lada Largus", age: 2014, bootVolume: 560)

passengerCar.changeIgnition(properties: .start)
passengerCar.changeTrunkVolume(act: .load, trunkVolume: 10)
truck.changeTrunkVolume(act: .load, trunkVolume: 300)
truck.changeTrunkVolume(act: .upload, trunkVolume: 200)
passengerCar.changeTrunkVolume(act: .load, trunkVolume: 300)
truck.changeIgnition(properties: .start)
truck.changeWidows(properties: .open)
truck.changeWidows(properties: .close)

passengerCar.printProperties()
truck.printProperties()


