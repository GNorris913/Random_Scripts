function BS-Compare{
	$log = Get-Content '.\cue_logger.log'; 
	$csv = Import-Csv -Path '.\NETCUES.csv';
	$out = $none 
	$csv | ForEach-Object  {
		if (![string]::IsNullOrEmpty($_.'PROGRAM NAME')){
			Write-Host "##########          $($_.'PROGRAM NAME')          ##########`r`n";  
			if(![string]::IsNullOrEmpty($_.'BANG START')){
				Write-Host "-----   BANG START $($_.'BANG START')   -----";
				$cl = $log | Select-String -Pattern "#$($_.'BANG START')@" | Out-String;
				if(![string]::IsNullOrEmpty($cl)){
					$cl -split "(>)";
					Write-Host "$($cl)"
					$cl = $null
				}
			};
			if(![string]::IsNullOrEmpty($_.'BANG END')){
				Write-Host "-----   BANG END $($_.'BANG END')   -----";
				$cl = $log | Select-String -Pattern "#$($_.'BANG END')@" | Out-String;
				if(![string]::IsNullOrEmpty($cl)){
					$cl -split "(>)";
					Write-Host "$($cl)";
					$cl = $null
				}
			}
		}
	}
}
