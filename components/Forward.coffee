noflo = require("noflo")
_ = require("underscore")

class Forward extends noflo.Component

  description: "Like 'Repeat', but like 'Drop' if 'OUT' isn't attached"

  constructor: ->
    @inPorts =
      in: new noflo.Port
    @outPorts =
      out: new noflo.Port

    @inPorts.in.on "begingroup", (group) =>
      @outPorts.out.beginGroup(group) if @outPorts.out.isAttached()

    @inPorts.in.on "data", (data) =>
      @outPorts.out.send(data) if @outPorts.out.isAttached()

    @inPorts.in.on "endgroup", (group) =>
      @outPorts.out.endGroup() if @outPorts.out.isAttached()

    @inPorts.in.on "disconnect", =>
      @outPorts.out.disconnect() if @outPorts.out.isAttached()

exports.getComponent = -> new Forward
