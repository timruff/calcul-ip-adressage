$nbMachine = Read-Host -Prompt 'Veuillez entrer le nombre de machine'

$x = 0
$masque = 0
while ($masque -lt $nbMachine){
    $masque = [math]::Pow(2, $x) - 2
    $x += 1
}

Write-Host "Le maximum de machine est : " ([math]::Pow(2, $x - 1) - 2)
Write-Host "Broadcast probable est : " (([math]::Pow(2, $x - 1) - 1) % 255)
Write-Host "Le masque reseau est : " (32 - $x + 1)

$masque = 32 - $x + 1

$masqueBinaire = ""
# conversion en binaire
$i = 0
while ($i -lt $masque){
    $masqueBinaire += "1"
    $i += 1
}

$i = 0
while ($i -lt $x - 1){
    $masqueBinaire += "0"
    $i += 1
}

Write-Host "Masque en Binaire :"$masqueBinaire

# coupe en morceau de 8
$result = @()

for ($i = 0; $i -lt $masqueBinaire.Length; $i += 8) {
    $result += $masqueBinaire.Substring($i, 8)
}

Write-Host -NoNewline "Masque en decimal : "

for ($i = 0; $i -lt 4; $i++){
    Write-Host -NoNewline ([Convert]::ToInt32($result[$i], 2))
    if ($i -lt 3) {
        Write-Host -NoNewline "."
    }
}

Write-Host ""
Read-Host -Prompt "Appuyez sur entree pour quitter..."