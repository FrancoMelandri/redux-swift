public struct MyState: State {
    public let counter: Int

    public init(counter: Int = 0) {
        self.counter = counter
    }

    public var execute: Storable { get { return doit } }
    func doit (_ state: State?, _ action: Action) -> State? {
        if ( action.type == "INC" ) {
            return MyState(counter: self.counter + 1) 
        }
        if ( action.type == "DEC" ) {
            return MyState(counter: self.counter - 1) 
        }
        return self
    }
}
