# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the official SketchUp Ruby API tutorials repository, providing examples for developers learning to create SketchUp extensions. The codebase prioritizes educational clarity over complex tooling.

## Project Structure

- `/examples/` - Clean, non-commented versions of extensions
- `/tutorials/` - Fully commented versions with detailed explanations
- Each example follows the pattern: `XX_example_name/` with a root `.rb` file and a subfolder containing `main.rb`
- `load_tutorials.rb` - Utility for loading all tutorials into SketchUp

## Development Commands

### Loading Extensions
```ruby
# In SketchUp Ruby Console, after setting up proxy loader:
load 'load_tutorials.rb'

# Reload all examples during development:
Examples.reload
```

### Running Individual Examples
```ruby
# Load specific example:
load 'examples/01_hello_cube/ex_hello_cube.rb'
```

## Key Architecture Patterns

### Extension Registration Pattern
All extensions follow this structure in the root file:
```ruby
module Examples
  module ExtensionName
    unless file_loaded?(__FILE__)
      ex = SketchupExtension.new('Name', 'extension_folder/main')
      ex.description = 'Description'
      ex.version = '1.0.0'
      ex.copyright = 'Trimble Navigations © 2016'
      ex.creator = 'SketchUp'
      Sketchup.register_extension(ex, true)
      file_loaded(__FILE__)
    end
  end
end
```

### Module Structure
- All code must be namespaced under `Examples` module
- Each extension has its own sub-module
- Implementation goes in `main.rb`, registration in root file
- Use `file_loaded?` guards to prevent duplicate loading

### SketchUp API Conventions
- Tools inherit from `Sketchup::Tool` or implement tool interface methods
- Use `model.start_operation` for undoable operations
- Always commit operations with `model.commit_operation`
- Handle tool states (activate, deactivate, suspend, resume)
- Use InputPoint for 3D picking and inference

## Testing Approach

Manual testing in SketchUp:
1. Load the extension
2. Test functionality through UI/toolbar
3. Check Ruby Console for errors
4. Use `Examples.reload` for quick iteration

## Common Development Tasks

### Adding a New Tutorial
1. Create numbered folder: `XX_tutorial_name/`
2. Create registration file: `ex_tutorial_name.rb`
3. Create implementation: `ex_tutorial_name/main.rb`
4. Add README.md explaining the tutorial
5. Follow existing naming conventions and module structure

### Debugging
- Use `puts` or `p` for console output
- SketchUp Ruby Console shows all output and errors
- Check for proper module nesting and naming
- Ensure `file_loaded?` is working correctly