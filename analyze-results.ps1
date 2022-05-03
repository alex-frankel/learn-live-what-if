$results = az deployment group what-if -f ./01-intro.bicep -g adotfrank-learn --no-pretty-print --query "changes[*].changeType" --output tsv --mode Complete

foreach ($change in $results) {
  if($change -eq "Modify") {
    Write-Host "Modify detected!"
  }
}

Write-Host $results