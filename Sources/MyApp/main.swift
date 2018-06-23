
import Foundation
import redux_swift

let state = MyState()
let store = Store(state)
let actionInc = Action(type: "INC")
let actionDec = Action(type: "DEC")
let actionNop = Action(type: "NOP")

var callback: () -> Void = {
    print(store.getState()?.counter ?? 0)
}
store.subscribe(callback)

store.dispatch(actionInc)
store.dispatch(actionInc)
store.dispatch(actionDec)
store.dispatch(actionNop)
