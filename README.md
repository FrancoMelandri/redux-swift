# redux-swift

Try to implement a simple and tiny redux flow in swift.

My goal is to reproduce exactly the same result as in the javascript file below:

```
'use strict'

let redux = require ('redux');


function counter(state = 0, action) {
    switch (action.type) {
    case 'INCREMENT':
        return state + 1
    case 'DECREMENT':
        return state - 1
    default:
        return state
    }
};

let store = redux.createStore(counter);

store.subscribe(() => {
    console.log(store.getState())
    }
);

store.dispatch ( { type: 'INCREMENT' });
store.dispatch ( { type: 'INCREMENT' });
store.dispatch ( { type: 'DECREMENT' });
store.dispatch ( { type: 'NOP' });
```

Output:
```
1
2
1
1
```

You can clone the repo and launch the test using the command:

```
> swift test 
```

You may also run the main application using the command:

```
> swift run
```

The main entry point looks like:
```
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
```

and the output is:
```
1
2
1
1
```

