class CargoVagon < Vagon
  TYPE = 'C'
  def initialize(station)
    super
    @type = TYPE
  end
end
