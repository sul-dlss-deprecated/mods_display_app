require 'mods_display'
require "stanford-mods" # don't know why I have to explicitly load this

class ModsDisplayModel
  attr_accessor :modsxml
  include ModsDisplay::ModelExtension
  include ModsDisplay::ControllerExtension
  def initialize mods
    @modsxml = mods
  end
  mods_xml_source do |doc|
    doc.modsxml
  end
end
