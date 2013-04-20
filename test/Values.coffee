Socket = require("../node_modules/noflo/src/lib/InternalSocket")

setup = (component, inNames=[], outNames=[]) ->
  c = require("../components/#{component}").getComponent()
  inPorts = []
  outPorts = []

  for name in inNames
    port = Socket.createSocket()
    c.inPorts[name].attach(port)
    inPorts.push(port)

  for name in outNames
    port = Socket.createSocket()
    c.outPorts[name].attach(port)
    outPorts.push(port)

  [c, inPorts, outPorts]

exports["gets only the values of an object and forward them as an array"] = (test) ->
  [c, [ins], [out]] = setup("Values", ["in"], ["out"])

  test.expect(1)

  input =
    a: 1
    b:
      c: 2
      d: [3, 4]
  expected = [1, { c: 2, d: [3, 4] }]

  out.on "data", (data) ->
    test.deepEqual(data, expected)
    test.done()

  ins.send(input)
  ins.disconnect()
