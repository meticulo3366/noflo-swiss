noflo = require("noflo")
_ = require("underscore")

class Flatten extends noflo.Component

  description: "flatten the data using Underscore.js"

  constructor: ->
    @inPorts =
      in: new noflo.Port
    @outPorts =
      out: new noflo.Port

    @inPorts.in.on "begingroup", (group) =>
      @outPorts.out.beginGroup(group)

    @inPorts.in.on "data", (data) =>
      @outPorts.out.send(_.flatten(data))

    @inPorts.in.on "endgroup", (group) =>
      @outPorts.out.endGroup()

    @inPorts.in.on "disconnect", =>
      @outPorts.out.disconnect()

exports.getComponent = -> new Flatten
