public typealias Storable = (State?, Action) -> State?

public protocol State {
    var execute: Storable { get }
}

public struct Action {
    public let type: String
    public let state: State?

    public init(type: String,
         state: State? = nil) {
        self.type = type
        self.state = state
    }
}
