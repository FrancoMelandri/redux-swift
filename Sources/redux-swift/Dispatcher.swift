import Foundation

public protocol Dispatcher {
    func dispatch(_ callback: @escaping () -> Void)
}

public struct AsyncDispatcher: Dispatcher {
    public init() { }

    public func dispatch(_ callback: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async {
            callback()
        }        
    }
}

public struct SyncDispatcher: Dispatcher {
    public init() { }

    public func dispatch(_ callback: @escaping () -> Void) {
        callback()
    }
}
