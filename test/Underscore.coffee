test = require "noflo-test"

test.component("swiss/Underscore").
  discuss("provide an Underscore.js function name").
    send.data("name", "first").
  discuss("give it some packets to be passed to the said function").
    send.connect("in").
    send.data("in", ["a", "b", "c"]).
    send.disconnect("in").
  discuss("the correct function is applied").
    receive.data("out", "a").

  next().
  discuss("some functions requires more than one parameter").
    send.data("stream", "false").
    send.data("name", "zip").
  discuss("give it some packets to be passed to the said function").
    send.connect("in").
    send.data("in", ["a", "b", "c"]).
    send.data("in", [1, 2, 3]).
    send.disconnect("in").
  discuss("the function is correctly applied").
    receive.data("out", [["a", 1], ["b", 2], ["c", 3]]).

export module
