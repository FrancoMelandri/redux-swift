# redux-swift

Try to implment a simple and tiny redux flow in swift.

My goal is to reproduce exactly the same result as in the javascript file below:

```
'use strict'

let redux = require ('redux');


function counter(staåte = 0, action) {
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


