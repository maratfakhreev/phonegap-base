define ->

  class ConnectionStateHelper
    INSTANCE = null

    class PrivateClass
      isOnline = false

      constructor: ->
        @checkConnection()

      isOnline: ->
        isOnline

      checkConnection: ->
        networkState = navigator.connection.type
        states = {}

        states[Connection.UNKNOWN] = 'Unknown connection'
        states[Connection.ETHERNET] = 'Ethernet connection'
        states[Connection.WIFI] = 'WiFi connection'
        states[Connection.CELL_2G] = 'Cell 2G connection'
        states[Connection.CELL_3G] = 'Cell 3G connection'
        states[Connection.CELL_4G] = 'Cell 4G connection'
        states[Connection.CELL] = 'Cell generic connection'
        states[Connection.NONE] = 'No network connection'

        if states[networkState] is 'No network connection'
          isOnline = false
        else
          isOnline = true

    @getInstance: ->
      INSTANCE or= new PrivateClass()
