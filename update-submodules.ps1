# update-submodules.ps1

# 루트 저장소 경로 고정 및 이동
$rootPath = "D:\git\projects\health-boosting\web"
Set-Location $rootPath

# 서브모듈 경로 리스트
$submodules = @("frontend", "backend")
$updated = $false

foreach ($submodule in $submodules) {
  Write-Host "Updating submodule: $submodule"

  $submodulePath = Join-Path $rootPath $submodule
  Set-Location $submodulePath

  # 최신 원격 가져오기
  git fetch

  # 현재 브랜치 확인
  $branch = git rev-parse --abbrev-ref HEAD
  Write-Host "Current branch in ${submodule}: ${branch}"

  # 최신 커밋과 로컬 커밋 비교
  $localCommit = git rev-parse HEAD
  $remoteCommit = git rev-parse origin/$branch

  if ($localCommit -ne $remoteCommit) {
    Write-Host "New commits found in $submodule. Pulling latest changes..."
    git pull origin $branch

    # 루트 저장소로 돌아가기
    Set-Location $rootPath
    # 루트 저장소에서 서브모듈 포인터 업데이트
    git add $submodule
    $updated = $true
  } else {
    Write-Host "$submodule is already up to date."
    Set-Location $PWD
  }
}

# 루트 저장소 커밋 & 푸시
if ($updated) {
  git commit -m "Auto update submodules on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
  git push origin main
  Write-Host "Submodules updated and pushed."
} else {
  Write-Host "No updates detected"
}