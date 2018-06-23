class Store<T: State> {

    private var callback: () -> Void = { }
    private var state: T?

    init(_ state: T) {
        self.state = state
    }

    func subscribe(_ callback: @escaping () -> Void ) {
        self.callback = callback
    }

    func dispatch (_ action: Action) {
        self.state = self.state?.execute(self.state, action) as? T
        self.callback()
    }

    func getState () -> T? {
        return state
    }
}