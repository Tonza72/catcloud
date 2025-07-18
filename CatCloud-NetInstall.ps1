Add-Type -AssemblyName PresentationFramework

# Create window
$window = New-Object Windows.Window
$window.Title = "CatCloud NetInstaller"
$window.Width = 420
$window.Height = 270
$window.ResizeMode = "NoResize"
$grid = New-Object Windows.Controls.Grid
$window.Content = $grid

# Title label
$title = New-Object Windows.Controls.Label
$title.Content = "Choose your Windows installation"
$title.FontSize = 16
$title.HorizontalAlignment = "Center"
$title.Margin = "0,20,0,0"
$grid.Children.Add($title)

# ComboBox with installation options
$combo = New-Object Windows.Controls.ComboBox
$combo.Margin = "60,60,60,0"
@("Windows 11 Pro + Drivers", "Windows 10 Pro + Drivers", "Windows Server 2025") | ForEach-Object { $combo.Items.Add($_) }
$grid.Children.Add($combo)

# Install button
$button = New-Object Windows.Controls.Button
$button.Content = "Install"
$button.Margin = "160,110,160,0"
$button.Add_Click({
    $choice = $combo.SelectedItem
    if ($choice) {
        [Windows.MessageBox]::Show("Starting installation: $choice", "CatCloud Installer")
        # Here you can place logic for actual installation
    } else {
        [Windows.MessageBox]::Show("Please select an option first", "Error")
    }
})
$grid.Children.Add($button)

# Show GUI window
$window.ShowDialog()
