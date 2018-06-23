public class Store<T: State> {

    private var callback: () -> Void = { }
    private var state: T?

    public init(_ state: T) {
        self.state = state
    }

    public func subscribe(_ callback: @escaping () -> Void ) {
        self.callback = callback
    }

    public func dispatch (_ action: Action) {
        self.state = self.state?.execute(self.state, action) as? T
        self.callback()
    }

    public func getState () -> T? {
        return state
    }
}