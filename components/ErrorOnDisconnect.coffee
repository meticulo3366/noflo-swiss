noflo = require("noflo")
_s = require("underscore.string")

class ThrowOnDisconnect extends noflo.Component

  description: _s.clean "Throw an error on disconnect signal. Handy for
  debugging."

  constructor: ->
    @inPorts =
      in: new noflo.Port
    @outPorts =
      out: new noflo.Port

    @inPorts.in.on "disconnect", =>
      throw new Error "Hooray! A disconnect signal is detected!"

exports.getComponent = -> new ThrowOnDisconnect
