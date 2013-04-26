noflo = require("noflo")

class Trash extends noflo.Component

  description: "Don't do anything. It's a dummy component."

  constructor: ->
    @inPorts =
      in: new noflo.Port
    @outPorts =
      out: new noflo.Port

exports.getComponent = -> new Trash
