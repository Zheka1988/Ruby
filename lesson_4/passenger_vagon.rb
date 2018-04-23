class PassengerVagon < Vagon
  TYPE = 'P'
  def initialize(station)
    super
    @type = TYPE
  end
end
