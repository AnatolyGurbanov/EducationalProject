import Foundation

public protocol ViewModel {
    /// Входящие от `View` ивенты
    associatedtype Input
    /// Исходящие от `ViewModel` ивенты
    associatedtype Output
    
    
    /**
     Принимает входящие от `View` ивенты и отдает результирующие ивенты из `ViewModel` во `View`.
     
     Вызовите этот метод из `setupOutput` во `View`.
     
     Передайте результирующие евенты в `outputHandler`.
     
     # Внимание! Метод не должен содержать логику. Вся логика должна выносится в отдельные методы!
     
     # Пример
     ```
     func transform(_ input: SomeViewModel.Input, outputHandler: (SomeViewModel.Output) -> Void) {
         let output = Output()
         outputHandler(output)
     }
     ```
     
     - parameters:
        - input: Входящие от `View` ивенты
        - outputHandler: Хендлер с результирующими ивентами
        - output: Результирующие ивенты
     */
    func transform(_ input: Input, outputHandler: (_ output: Output) -> Void)
    
}
