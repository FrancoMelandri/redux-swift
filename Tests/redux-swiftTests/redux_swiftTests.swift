import XCTest
@testable import redux_swift

final class redux_swiftTests: XCTestCase {
    

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
