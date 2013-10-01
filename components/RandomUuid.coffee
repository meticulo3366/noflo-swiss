noflo = require('noflo')
uuid = require('node-uuid')

class RandomUuid extends noflo.Component

  description: 'Generate a random UUID token'

  constructor: ->
    @inPorts =
      in: new noflo.Port
    @outPorts =
      out: new noflo.Port

    @inPorts.in.on 'begingroup', (group) =>
      @outPorts.out.beginGroup group
    @inPorts.in.on 'endgroup', =>
      @outPorts.out.endGroup()
    @inPorts.in.on 'disconnect', =>
      @outPorts.out.disconnect()

    @inPorts.in.on 'data', =>
      @outPorts.out.send uuid.v4()

exports.getComponent = -> new RandomUuid
