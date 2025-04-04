# Pico 8 Project Template

This project provides a template for developing PICO-8 cartridges with automated build and run workflows.

## Features

- **Run on Save**: Automatically builds the project when `.lua` files are saved.
- **Task Automation**: Includes tasks to build and run the PICO-8 cartridge.

## Requirements

- [PICO-8](https://www.lexaloffle.com/pico-8.php) installed at `C:\Program Files (x86)\PICO-8\pico8.exe` (which should be the default).
- PowerShell installed on your system.

## Usage

### Run on Save

The project is configured to automatically build the project when `.lua` files are saved, and then reload the PICO-8 cartidge if it is open. This is handled by the `emeraldwalk.runonsave` extension. Make sure it isntalled and enabled.

### Tasks

#### Run PICO-8 Cartridge

1. Open the Command Palette (`Ctrl+Shift+P` or `F1`).
2. Select `Tasks: Run Task`.
3. Choose `Run PICO-8 Cartridge`.

This will execute the `scripts/run.ps1` script and launch the Pico-8 cartridge.

## File Structure

```
Pico 8 Project Template/
├── .vscode/                                # VSCode workspace settings
├── build/                                  # Output directory for the built cartridge, you should commit this since it may contain gfx edits
├── scripts/                                # Custom PowerShell scripts
│   ├── build.ps1                           # Script to build the project
│   └── run.ps1                             # Script to run the project
├── src/                                    # Your source lua files
├── Pico 8 Project Template.code-workspace  # The vscode workspace file, containing settings and task configuration. This should be renamed in your project.
└── README.md                               # Project documentation
```

## Customization

### Modify Build Script

The build script is located at `scripts/build.ps1`. Update it to customize the build process.

### Modify Run Script

The run script is located at `scripts/run.ps1`. Update it to customize how the cartridge is launched.

## Troubleshooting

### Pico-8 Not Found

Ensure Pico-8 is installed at `C:\Program Files (x86)\PICO-8\pico8.exe`. Update the `run.ps1` script if it is installed in a different location.

## License

This project is licensed under the MIT License. See `LICENSE` for details.
