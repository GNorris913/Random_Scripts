function Compare-BSLog{
	$log = Get-Content '.\cue_logger.log'; 
	$csv = Import-Csv -Path '.\BANG NETCUES.csv';
	$out = ""; 
	$csv | ForEach-Object  {
		if (![string]::IsNullOrEmpty($_.'PROGRAM NAME')){
			$xpn = "##########          $($_.'PROGRAM NAME')          ##########`r`n";
			Write-Host $xpn;
			$out = $out + $xpn;
			$xpn = $null;		
			if(![string]::IsNullOrEmpty($_.'BANG START')){
				$bsn = "----------          BANG START $($_.'BANG START')          ----------";
				Write-Host $bsn;
				$out = $out + $bsn;
				$cl = $log | Select-String -Pattern "#$($_.'BANG START')@" | Out-String;
				if(![string]::IsNullOrEmpty($cl)){
					$cl -split "(>)";
					$out = $out + $cl;
					$cl = $null;
				}
			};
			if(![string]::IsNullOrEmpty($_.'BANG END')){
				$ben = "----------          BANG END $($_.'BANG END')          ----------";
				Write-Host $ben;
				$cl = $log | Select-String -Pattern "#$($_.'BANG END')@" | Out-String;
				if(![string]::IsNullOrEmpty($cl)){
					$cl -split "(>)";
					$out = $out + $ben;
					$out = $out + $cl;
					$cl = $null;
				}
			}
		}
	};
	Clear-Content -Path ".\sat_svcs.txt";
	foreach ($line in $out){
		Write-Host $line;
		Add-Content -Path ".\sat_svcs.txt" -Value $line
	};
}
