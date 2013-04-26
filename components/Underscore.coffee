noflo = require("noflo")
_ = require("underscore")
_s = require("underscore.string")

class Underscore extends noflo.Component

  description: _s.clean "Invoke an Underscore.js function by providing the
  function name"

  constructor: ->
    @inPorts =
      in: new noflo.Port
      name: new noflo.Port
    @outPorts =
      out: new noflo.Port

    @inPorts.name.on "data", (@name) =>

    @inPorts.in.on "begingroup", (group) =>
      @outPorts.out.beginGroup(group)

    @inPorts.in.on "data", (data) =>
      console.log "* DDD"
      console.log @name
      console.log data
      console.log _[@name] data
      if @name?
        @outPorts.out.send _[@name] data
      else
        @outPorts.out.send data

    @inPorts.in.on "endgroup", =>
      @outPorts.out.endGroup()

    @inPorts.in.on "disconnect", =>
      @outPorts.out.disconnect()

exports.getComponent = -> new Underscore
