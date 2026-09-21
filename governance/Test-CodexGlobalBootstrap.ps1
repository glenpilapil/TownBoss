[CmdletBinding()]
param(
    [Parameter(Mandatory)] [string] $TownBossSourcePath,
    [Parameter(Mandatory)] [string] $ExpectedSourceSha,
    [string] $CodexHome = $(if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE '.codex' })
)

$ErrorActionPreference = 'Stop'
$source = [IO.Path]::GetFullPath($TownBossSourcePath)
$codexHomeResolved = [IO.Path]::GetFullPath($CodexHome)
$installed = Join-Path $codexHomeResolved 'AGENTS.md'
$override = Join-Path $codexHomeResolved 'AGENTS.override.md'
$violations = [System.Collections.Generic.List[string]]::new()

if (-not (Test-Path -LiteralPath $source -PathType Leaf)) { $violations.Add('TownBoss canonical source is missing') }
if (-not (Test-Path -LiteralPath $installed -PathType Leaf)) { $violations.Add('global AGENTS.md is missing') }
if ((Test-Path -LiteralPath $override -PathType Leaf) -and (Get-Item -LiteralPath $override).Length -gt 0) { $violations.Add('conflicting non-empty global AGENTS.override.md prevents bootstrap loading') }

$sourceHash = $null
if ($violations.Count -eq 0) {
    $sourceText = ([IO.File]::ReadAllText($source) -replace "`r`n", "`n").TrimEnd("`r", "`n")
    $sourceHash = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash
    $installedText = [IO.File]::ReadAllText($installed).TrimEnd("`r", "`n")
    $lines = $installedText -split "`r?`n"
    if ($lines.Count -lt 3 -or $lines[0] -ne "# TownBoss canonical source: D:\Projects\TownBoss\governance\agent-bootstrap\CODEX_GLOBAL_AGENTS.md") { $violations.Add('global AGENTS.md lacks TownBoss source provenance') }
    if ($lines.Count -lt 3 -or $lines[1] -ne "# TownBoss source SHA: $ExpectedSourceSha") { $violations.Add('global AGENTS.md source SHA provenance does not match') }
    if ($lines.Count -lt 3 -or $lines[2] -ne "# TownBoss source content SHA256: $sourceHash") { $violations.Add('global AGENTS.md source content hash provenance does not match') }
    $body = if ($lines.Count -gt 3) { ($lines[3..($lines.Count - 1)] -join "`n").TrimEnd("`r", "`n") } else { '' }
    if ($body -ne $sourceText) { $violations.Add('global AGENTS.md runtime content differs from canonical source') }
}

[pscustomobject]@{ codexHome = $codexHomeResolved; globalAgentsExists = Test-Path -LiteralPath $installed -PathType Leaf; globalOverrideConflict = $violations -contains 'conflicting non-empty global AGENTS.override.md prevents bootstrap loading'; sourceSha = $ExpectedSourceSha; sourceContentSha256 = $sourceHash; passed = $violations.Count -eq 0; violations = $violations } | ConvertTo-Json -Depth 3
if ($violations.Count -gt 0) { exit 1 }
