import Foundation

public class Store<T: State> {

    private var callback: () -> Void = { }
    private var state: T?
    private let dispatcher: Dispatcher

    public init(_ state: T,
                _ dispatcher: Dispatcher = AsyncDispatcher()) {
        self.state = state
        self.dispatcher = dispatcher
    }

    public func subscribe(_ callback: @escaping () -> Void) {
        self.callback = callback
    }

    public func dispatch (_ action: Action) {
        self.state = self.state?.execute(self.state, action) as? T
        dispatcher.dispatch { self.callback() }
    }

    public func getState () -> T? {
        return state
    }
}
