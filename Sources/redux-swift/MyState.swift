public struct MyState: State {

    public static let INC = "INC"
    public static let DEC = "DEC"

    let actions: [ ((Action) -> Bool, (MyState) ->  State?) ] = [
        ( { action in action.type == MyState.INC  }, { state in MyState(counter: state.counter + 1) } ),
        ( { action in action.type == MyState.DEC  }, { state in MyState(counter: state.counter - 1) } ),
        ( { _ in true  }, { state in state } ),
    ]

    public let counter: Int

    public init(counter: Int = 0) {
        self.counter = counter
    }

    public var execute: Storable { get { return doit } }

    func doit (_ state: State?, _ action: Action) -> State? {
        return actions
                    .first(where: { $0.0(action) })?
                    .1(self) ?? self
    }
}
