typealias Storable = (State?, Action) -> State?

protocol State {
    var execute: Storable { get }
}

struct Action {
    let type: String
    let state: State?

    init(type: String,
         state: State? = nil) {
        self.type = type
        self.state = state
    }
}
