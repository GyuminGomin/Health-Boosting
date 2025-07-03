# Submodule 사용 법

## 처음 git 루트 원격 저장소에 올릴 경우

1. git submodule add <원격저장소> <폴더이름>
2. git submodule add <원격저장소> <폴더이름>
3. git commit
4. git push origin main
   > 1. \- branch - 가 설정되어 있을 경우 git push
   > 2. git push --set-upstream origin main

## 루트저장소 받아오는 방법

1. git clone --recurse-submodules <루트 저장소>
2. git submodule update --init --recursive

## 루트 저장소의 서브 모듈들 fetch

1. git fetch
2. git pull origin <branch 이름>

### 참고

- branch가 나뉘어져 있는 서브모듈일 경우 git checkout 잘 확인 해봐야 함 (왜냐면 main만 받아올 가능성이 크기 때문에)
