[CmdletBinding()]
param(
    [Parameter(Mandatory)] [string] $RepositoryPath,
    [Parameter(Mandatory)] [string] $Phase,
    [Parameter(Mandatory)] [string] $Deliverable,
    [Parameter(Mandatory)] [string] $TaskId,
    [ValidateSet('Preflight', 'Closeout')] [string] $Mode = 'Preflight',
    [string] $ExpectedBranch,
    [string] $ExpectedHead,
    [string] $DocumentationReceipt,
    [string] $MemoryReceipt,
    [string] $ValidationReceipt,
    [string] $CheckpointSha,
    [string] $RemoteSha,
    [switch] $UiTask,
    [string] $UxAuthority,
    [string] $ReferenceSource,
    [string] $SelectedPattern,
    [string] $TargetScreenOrFinding,
    [string] $ExpectedVisibleChange,
    [string] $RenderedEvidence,
    [string] $IndependentVisualReview,
    [ValidateSet('', 'REFERENCE_ONLY', 'SELECTED_PATTERN', 'IMPLEMENTED_AT_SHA', 'VISUALLY_VERIFIED')] [string] $ReferenceLifecycleState,
    [string] $CheckpointSubject
)

$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath('D:\Projects')
$repository = [IO.Path]::GetFullPath($RepositoryPath)
$violations = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

if (-not $repository.StartsWith($root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) { $violations.Add('repository path is outside D:\Projects') }
if (-not (Test-Path -LiteralPath (Join-Path $repository '.git'))) { $violations.Add('repository path is not a Git worktree') }
foreach ($field in @(@{ Name = 'Phase'; Value = $Phase }, @{ Name = 'Deliverable'; Value = $Deliverable }, @{ Name = 'TaskId'; Value = $TaskId })) { if ([string]::IsNullOrWhiteSpace($field.Value)) { $violations.Add("missing $($field.Name)") } }

$branch = $null; $head = $null; $status = @()
if ($violations.Count -eq 0) {
    $branch = (git -c "safe.directory=$repository" -C $repository branch --show-current).Trim()
    $head = (git -c "safe.directory=$repository" -C $repository rev-parse HEAD).Trim()
    $status = @(git -c "safe.directory=$repository" -C $repository status --porcelain=v1)
    if ($ExpectedBranch -and $branch -ne $ExpectedBranch) { $violations.Add("branch mismatch: expected $ExpectedBranch, got $branch") }
    if ($ExpectedHead -and $head -ne $ExpectedHead) { $violations.Add("HEAD mismatch: expected $ExpectedHead, got $head") }
    if ($status.Count -gt 0) { $warnings.Add('working tree is dirty; preserve and explicitly scope pre-existing changes') }
}

if ($Mode -eq 'Closeout') {
    foreach ($receipt in @(@{ Name = 'DocumentationReceipt'; Value = $DocumentationReceipt }, @{ Name = 'MemoryReceipt'; Value = $MemoryReceipt }, @{ Name = 'ValidationReceipt'; Value = $ValidationReceipt }, @{ Name = 'CheckpointSha'; Value = $CheckpointSha }, @{ Name = 'RemoteSha'; Value = $RemoteSha })) { if ([string]::IsNullOrWhiteSpace($receipt.Value)) { $violations.Add("missing $($receipt.Name) for closeout") } }
    if ($CheckpointSha -and $RemoteSha -and $CheckpointSha -ne $RemoteSha) { $violations.Add('checkpoint SHA does not match remote SHA') }
    if ($CheckpointSubject -and $CheckpointSubject -notmatch ('^\[P' + [regex]::Escape($Phase) + '\]\[D' + [regex]::Escape($Deliverable) + '\]\[T' + [regex]::Escape($TaskId) + '\]\s+.+')) { $violations.Add('checkpoint subject does not match the Phase/Deliverable/Task prefix') }
    if (-not $CheckpointSubject) { $violations.Add('missing CheckpointSubject for closeout') }
}

if ($UiTask) {
    foreach ($field in @(@{ Name = 'UxAuthority'; Value = $UxAuthority }, @{ Name = 'ReferenceSource'; Value = $ReferenceSource }, @{ Name = 'TargetScreenOrFinding'; Value = $TargetScreenOrFinding }, @{ Name = 'ExpectedVisibleChange'; Value = $ExpectedVisibleChange }, @{ Name = 'RenderedEvidence'; Value = $RenderedEvidence }, @{ Name = 'IndependentVisualReview'; Value = $IndependentVisualReview }, @{ Name = 'ReferenceLifecycleState'; Value = $ReferenceLifecycleState })) { if ([string]::IsNullOrWhiteSpace($field.Value)) { $violations.Add("missing $($field.Name) for UI task") } }
    if ($ReferenceSource -ne 'NOT_REQUIRED' -and [string]::IsNullOrWhiteSpace($SelectedPattern)) { $violations.Add('missing SelectedPattern for referenced UI task') }
    if ($ReferenceLifecycleState -eq 'VISUALLY_VERIFIED' -and [string]::IsNullOrWhiteSpace($IndependentVisualReview)) { $violations.Add('VISUALLY_VERIFIED requires independent visual review') }
}

[pscustomobject]@{ mode = $Mode; repository = $repository; phase = $Phase; deliverable = $Deliverable; taskId = $TaskId; uiTask = $UiTask.IsPresent; branch = $branch; head = $head; dirtyEntries = $status.Count; passed = $violations.Count -eq 0; violations = $violations; warnings = $warnings } | ConvertTo-Json -Depth 3
if ($violations.Count -gt 0) { exit 1 }
