# E1-1 Docker 웹 서버·스토리지·Compose 실습

## 실행 환경

- 작업 기기: 개인 노트북
- OS: Windows 11 Pro
- Docker Engine: 29.9.2
- Docker Compose: v5.6.1
- 실행 방식: Docker Desktop / WSL2

## 1. Dockerfile 웹 서버 구축

기존 nginx:alpine 이미지를 기반으로
직접 작성한 정적 웹페이지를 포함하는 커스텀 이미지 생성.

```bash
docker build -t e1-1-web:1.0 .
docker images
```

![Dockerfile 빌드](../screenshots/05-docker-web/11-dockerfile-build.png)

## 2. 포트 매핑

동일한 이미지로 8080, 8081 포트에 웹 서버 실행.

```bash
docker run -d --name e1-1-web-8080 -p 127.0.0.1:8080:80 e1-1-web:1.0
docker run -d --name e1-1-web-8081 -p 127.0.0.1:8081:80 e1-1-web:1.0
```

![8080 접속](../screenshots/05-docker-web/12-web-8080.png)

![8081 접속](../screenshots/05-docker-web/13-web-8081.png)

## 3. 바인드 마운트

Windows의 site 디렉터리를 컨테이너에 연결.
호스트의 index.html을 수정한 후
이미지 재빌드 없이 변경사항 반영 확인.

- 8080: Dockerfile Custom Image - SUCCESS!
- 8082: Bind Mount - LIVE UPDATE!

![변경 전](../screenshots/06-bind-mount/14-bind-before.png)

![변경 후](../screenshots/06-bind-mount/15-bind-after.png)

## 4. Docker 볼륨 영속성

e1-1-data 볼륨을 생성하고 파일 저장.
첫 번째 컨테이너를 삭제한 후 두 번째 컨테이너에서
E1-1_VOLUME_PERSISTENCE_OK 데이터 유지 확인.

![컨테이너 삭제 전](../screenshots/07-volume/16-volume-before-delete.png)

![컨테이너 삭제 후](../screenshots/07-volume/17-volume-after-delete.png)

## 5. Docker Compose 보너스

compose.yaml을 작성하여 단일 NGINX 웹 서버 실행.

```bash
docker compose config
docker compose up -d --build
docker compose ps
curl.exe http://localhost:8083
docker compose logs --tail 20 web
docker compose down
docker compose ps -a
```

- 커스텀 이미지 빌드 성공
- localhost:8083 접속 성공
- NGINX HTTP 200 응답 확인
- 컨테이너 및 네트워크 제거 성공

![Compose 실행](../screenshots/08-compose/18-compose-running.png)

![Compose 종료](../screenshots/08-compose/19-compose-down.png)

## 결론

Dockerfile 기반 웹 서버 구축, 포트 매핑,
바인드 마운트, 볼륨 영속성 및
Docker Compose 기본 운영을 검증했다.
