Add-Type -AssemblyName PresentationFramework

# Luo ikkuna
$window = New-Object Windows.Window
$window.Title = "CatCloud NetInstaller 🐱"
$window.Width = 420
$window.Height = 270
$window.ResizeMode = "NoResize"
$grid = New-Object Windows.Controls.Grid
$window.Content = $grid

# Otsikko
$title = New-Object Windows.Controls.Label
$title.Content = "Valitse Windows-asennus"
$title.FontSize = 16
$title.HorizontalAlignment = "Center"
$title.Margin = "0,20,0,0"
$grid.Children.Add($title)

# Valintalista
$combo = New-Object Windows.Controls.ComboBox
$combo.Margin = "60,60,60,0"
@("Windows 11 Pro + Ajurit", "Windows 10 Pro + Ajurit", "Windows Server 2025") | ForEach-Object { $combo.Items.Add($_) }
$grid.Children.Add($combo)

# Asenna-painike
$button = New-Object Windows.Controls.Button
$button.Content = "Asenna"
$button.Margin = "160,110,160,0"
$button.Add_Click({
    $choice = $combo.SelectedItem
    if ($choice) {
        [Windows.MessageBox]::Show("Aloitetaan asennus: $choice", "CatCloud GUI")
        # 🔧 Tässä lisätään asennuslogiikka myöhemmin
        switch ($choice) {
            "Windows 11 Pro + Ajurit" {
                Write-Host "Käynnistetään Windows 11 + ajurit..."
                # Esim. iwr -useb "https://..." | iex
            }
            "Windows 10 Pro + Ajurit" {
                Write-Host "Käynnistetään Windows 10 + ajurit..."
            }
            "Windows Server 2025" {
                Write-Host "Käynnistetään Server 2025..."
            }
        }
    } else {
        [Windows.MessageBox]::Show("Valitse vaihtoehto ensin", "Virhe")
    }
})
$grid.Children.Add($button)

# Näytä ikkuna
$window.ShowDialog()
