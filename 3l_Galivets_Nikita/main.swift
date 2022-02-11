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

//MARK: - Light car Structure

struct LightCar {
    
    private var isEngingRunning = false
    private var isWindowsOpened = false
    private let isTrunkFull = false
    private let brand: String
    private let model: String
    private let dateOfRealease: String
    private let trunkVolume: UInt
    private var trunkFullness: UInt
    
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
            
        case .openWindows:
            isWindowsOpened = true
            print("Windows were opened")
        case .closeWindows:
            isWindowsOpened = false
            print("Windows were closeded")
            
        case .startEngine:
            isEngingRunning = true
            print("Car engine is power on")
        case .stopEngine:
            isEngingRunning = false
            print("Car engine is power off")
            
        case .putInTrunk:
            trunkFullness != trunkVolume ? trunkFullness += 5 : print("Trunk is full!")
        case .takeFromTrunk:
            trunkFullness != 0 ? trunkFullness -= 5 : print("Trunk is empty!")
        }
    }
    //Метод для выведения информации о состоянии авто в консоль
    func status() {
        
        print("\(brand) - \(model), release date: \(dateOfRealease), trunk volume = \(trunkVolume) liters, trunk fullness - \(trunkFullness)")
    }
}



//MARK: - Truck Structure
struct Truck {
    
    private var isEngingRunning = false
    private var isWindowsOpened = false
    private let isTrunkFull = false
    private let brand: String
    private let model: String
    private let dateOfRealease: String
    private let trunkVolume: UInt
    private var trunkFullness: UInt
    
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




//MARK: - Actions in enum

enum Actions {
    
    case openWindows
    case closeWindows
    case startEngine
    case stopEngine
    case putInTrunk
    case takeFromTrunk
    
}




var car = LightCar(brand: "Tesla", model: "Model X", dateOfRealease: "2017", trunkVolume: 300, trunkFullness: 295)

car.status()
print("""

""")
car.action(.startEngine)
car.action(.openWindows)
car.action(.putInTrunk)




print("""

****************************

""")

var truck = Truck(brand: "Tesla", model: "Sammy", dateOfRealease: "2023", trunkVolume: 3500, trunkFullness: 900)

truck.status()
print("""

""")
truck.action(.stopEngine)
truck.action(.closeWindows)
truck.action(.putInTrunk)
