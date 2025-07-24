# Copyright 2025 Adib Zailan
# Licensed under the MIT license

require 'sketchup.rb'

module Examples
  module SenibinaRND

    def self.show_about
      about_message = 
        "Senibina-RND SketchUp Extension\n\n" +
        "Version: 1.0.0\n" +
        "Last Updated: July 24, 2025\n\n" +
        "An experimental R&D extension for testing new features and workflows " +
        "in SketchUp. This is a development environment for prototyping " +
        "computational design tools.\n\n" +
        "Features:\n" +
        "• Extensible framework for R&D experiments\n" +
        "• Clean architecture for rapid prototyping\n" +
        "• Integration with SketchUp Ruby API\n\n" +
        "© Adib Zailan, 2025\n" +
        "Senibina R&D"
      
      UI.messagebox(about_message, MB_OK, 'About Senibina-RND')
    end

    unless file_loaded?(__FILE__)
      # Create command
      cmd = UI::Command.new('About Senibina-RND') {
        self.show_about
      }
      cmd.small_icon = 'SketchUp/Materials/Colors/Color_I01.png'
      cmd.large_icon = 'SketchUp/Materials/Colors/Color_I01.png'
      cmd.tooltip = 'About Senibina-RND'
      cmd.status_bar_text = 'Show information about Senibina-RND'
      cmd.menu_text = 'About Senibina-RND'

      # Add to menu
      menu = UI.menu('Plugins')
      menu.add_item(cmd)

      # Create toolbar
      toolbar = UI::Toolbar.new('Senibina-RND')
      toolbar.add_item(cmd)
      toolbar.show

      file_loaded(__FILE__)
    end

  end # module SenibinaRND
end # module Examples