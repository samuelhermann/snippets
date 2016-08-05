#Script affichant les fichiers par taille décroissante et envoie le résultat par mèl

#variables
$fichier = "nom du fichier"
$dossierSource = "chemin du dossier pour le tri"
$DossierDest = "chemin du dossier de sortie pour le fichier .txt"
$adresseMelSrc = "@ Source"
$adresseMelDst = "@ Destination"
$objetMel = "objet du mel"
$serveurSmtp = "adresse du serveur smtp"

Get-ChildItem $dossierSource -recurse $fichier | Sort-Object length -Descending | Select-Object -first 32 | ft directory,name,length -Wrap -Auto | Out-file $DossierDest\triDesc.txt -width 8000

send-mailmessage -from "<$adresseMelSrc>" -to "crasic <$adresseMelDst>" -subject "$objetMel" -body $(Get-Content -Path $filter -Raw) -SmtpServer $serveurSmtp
