test = require "noflo-test"

test.component("swiss/Compact").
  discuss("given any array").
    send.data("in", [1, 2, null]).
    send.disconnect("in").
  discuss("get a clean version of that").
    receive.data("out", [1, 2]).

  next().
  discuss("given any object").
    send.data("in", { a: 1, b: null }).
    send.disconnect("in").
  discuss("get a clean version of the values as an array").
    receive.data("out", [1]).

  next().
  discuss("given a primitive").
    send.data("in", true).
    send.disconnect("in").
  discuss("get an empty array").
    receive.data("out", []).

export module
