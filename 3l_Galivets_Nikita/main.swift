//
//  main.swift
//  3l_Galivets_Nikita
//
//  Created by Nikita on 10/2/22.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в ваши структуры метод с одним аргументом типа вашего перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров ваших структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

//Вариант 1
//MARK: - Truck Structure

enum Actions {
    case openWindows
    case closeWindows
    case startEngine
    case stopEngine
    case putInTrunk
    case takeFromTrunk
}

struct Truck {
    
    var isEngingRunning = false
    var isWindowsOpened = false
    let isTrunkFull = false
    let brand: String
    let model: String
    let dateOfRealease: String
    let trunkVolume: UInt
    var trunkFullness: UInt
    
    init(brand: String , model: String, dateOfRealease: String, trunkVolume: UInt, trunkFullness: UInt) {
        self.brand = brand
        self.model = model
        self.dateOfRealease = dateOfRealease
        self.trunkVolume = trunkVolume
        self.trunkFullness = trunkFullness
    }
    //Метод для взаимодействия с авто
    mutating func action( _ of: Actions) {
        
        switch of {
            //Открытие/Закрытие окон
        case .openWindows:
            isWindowsOpened = true
            print("Windows were opened")
        case .closeWindows:
            isWindowsOpened = false
            print("Windows were closed")
            
            //Запуск/Остановка двигателя
        case .startEngine:
            isEngingRunning = true
            print("Car engine is power on")
        case .stopEngine:
            isEngingRunning = false
            print("Car engine is power off")
            
            //Взаимодействие с багажником положить/взять
        case .putInTrunk:
            trunkFullness != trunkVolume ? trunkFullness += 50 : print("Trunk is full!")
        case .takeFromTrunk:
            trunkFullness != 0 ? trunkFullness -= 50 : print("Trunk is empty!")
        }
    }
    
    //Метод для выведения информации о состоянии авто в консоль
    func status() {
        
        print("\(brand) - \(model), release date: \(dateOfRealease), trunk volume = \(trunkVolume) liters, trunk fullness - \(trunkFullness)")
    }
}



//><><<><><><><><----(@)-----><><<><><><><><-----(@)----><><<><><><><><-----(@)----><><<><><><><><-------(@)-----><><<><
//-----(@)----><><<><><><><><-----(@)----><><<><><><><><-----(@)----><><<><><><><><-----(@)----><><<><><><><><------(@)-
//><><<><><><><><----(@)-----><><<><><><><><-----(@)----><><<><><><><><-----(@)----><><<><><><><><-------(@)-----><><<><
//-----(@)----><><<><><><><><-----(@)----><><<><><><><><-----(@)----><><<><><><><><-----(@)----><><<><><><><><------(@)-



//Вариант 2

//MARK: - Light car Structure

enum Windows {
    case open
    case close
}

enum Engine {
    case start
    case stop
}

enum Trunk {
    case putInTrunk
    case takeFromTrunk
}

struct LightCar {
    
    let brand: String
    let model: String
    let dateOfRealease: String
    var engineCondition: Bool
    var widowsCondition: Bool
    var trunkFullness: UInt
    var trunkConditionNow: UInt {
        didSet {
            if trunkConditionNow > trunkFullness {
                trunkConditionNow = oldValue
                print("Trunk is full!")
            } else if trunkConditionNow == 0 {
                trunkConditionNow = oldValue
                print("Trunk is empty")
            } else {
                print("Trunk free space (\(trunkConditionNow) / \(trunkFullness)) liters")
            }
        }
    }
    
    init(brand: String , model: String, dateOfRealease: String, trunkConditionNow: UInt, trunkFullness: UInt, widowsCondition: Bool, engineCondition: Bool) {
        self.brand = brand
        self.model = model
        self.dateOfRealease = dateOfRealease
        self.trunkFullness = trunkFullness
        self.trunkConditionNow = trunkConditionNow
        self.widowsCondition = widowsCondition
        self.engineCondition = engineCondition
    }
    
    //Взаимодействие с багажником положить/взять
    mutating func trunkAction(type: Trunk) {
        switch type {
        case .putInTrunk:
            trunkConditionNow += 50
        case .takeFromTrunk:
            trunkConditionNow -= 50
        }
    }
    
    //Открытие/Закрытие окон
    mutating func windowsAction(type: Windows) {
        switch type {
        case .open:
            widowsCondition = true
            print("Windows were opened")
        case .close:
            widowsCondition = false
            print("Windows were closed")
        }
    }
    
    //Запуск/Остановка двигателя
    mutating func engineAction(type: Engine) {
        switch type {
        case .start:
            engineCondition = true
            print("Car engine is power on")
        case .stop:
            engineCondition = false
            print("Car engine is power off")
        }
    }
    
    
    //Метод для выведения информации о состоянии авто в консоль
    func status() {
        
        print("\(brand) - \(model), release date: \(dateOfRealease), trunk fullness - \(trunkFullness)")
    }
}


//MARK: -  Вывод на консоль

var car = LightCar(brand: "Tesla", model: "Model X", dateOfRealease: "2017", trunkConditionNow: 200, trunkFullness: 300, widowsCondition: false, engineCondition: false)

car.status()
car.engineAction(type: .start)
car.windowsAction(type: .open)
car.trunkAction(type: .putInTrunk)
car.trunkAction(type: .putInTrunk)
car.trunkAction(type: .putInTrunk)

print("""

****************************

""")

var truck = Truck(brand: "Tesla", model: "Sammi", dateOfRealease: "2023", trunkVolume: 2500, trunkFullness: 3000)

truck.status()
print("""

""")
truck.action(.takeFromTrunk)
truck.action(.startEngine)
truck.action(.openWindows)
truck.action(.putInTrunk)
