import XCTest
@testable import redux_swift

final class redux_swiftTests: XCTestCase {
    
    struct MyState: State {
        let counter: Int

        init(counter: Int = 0) {
            self.counter = counter
        }

        var execute: Storable { get { return doit } }
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

    func testExample() {
        let state = MyState()
        let store = Store(state)
        let actionInc = Action(type: "INC")
        let actionDec = Action(type: "DEC")
        let actionNop = Action(type: "NOP")
    
        var callback: () -> Void = {
            XCTAssertEqual(store.getState()?.counter, 1)
        }
        store.subscribe(callback)
        store.dispatch(actionInc)

        callback = {
            XCTAssertEqual(store.getState()?.counter, 2)
        }
        store.subscribe(callback)
        store.dispatch(actionInc)

        callback = {
            XCTAssertEqual(store.getState()?.counter, 1)
        }
        store.subscribe(callback)
        store.dispatch(actionDec)

        callback = {
            XCTAssertEqual(store.getState()?.counter, 1)
        }
        store.subscribe(callback)
        store.dispatch(actionNop)
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
