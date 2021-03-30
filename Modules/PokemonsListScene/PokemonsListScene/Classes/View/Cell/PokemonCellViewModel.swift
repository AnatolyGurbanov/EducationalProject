import Common
import RxCocoa
import RxDataSources

final class PokemonCellViewModel: ClassName {
    // MARK: Props
    struct Props: Equatable {
        let id: String
        let image: UIImage
    }
    
    let props: Props
    
    init(props: Props) {
        self.props = props
    }
    
    func transform(_ input: PokemonCellViewModel.Input, outputHandler: (PokemonCellViewModel.Output) -> Void) {
        let props = Driver.just(props)
        
        let output = Output(props: props)
        
        outputHandler(output)
    }
}

extension PokemonCellViewModel {
    struct Input {
        
    }
    struct Output {
        let props: Driver<Props>
    }
}
