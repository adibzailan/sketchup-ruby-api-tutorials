# Copyright 2025 Adib Zailan
# Licensed under the MIT license

require 'sketchup.rb'
require 'extensions.rb'

module Examples
  module SenibinaRND

    unless file_loaded?(__FILE__)
      ex = SketchupExtension.new('Senibina-RND', 'senibina_rnd/main')
      ex.description = 'An experimental R&D extension for testing new features and workflows in SketchUp.'
      ex.version     = '1.0.0'
      ex.copyright   = '© Adib Zailan, 2025'
      ex.creator     = 'Senibina R&D'
      Sketchup.register_extension(ex, true)
      file_loaded(__FILE__)
    end

  end # module SenibinaRND
end # module Examples