# E1-1 Docker 기본 운영 실습

## 1. 실행 환경

- 작업 PC: 개인 노트북
- OS: Windows 11 Pro
- WSL: WSL2 / Ubuntu
- Docker Engine: 29.9.2
- Docker Desktop: 4.97.0
- Docker Compose: v5.6.1
- Docker 컨테이너: Ubuntu 24.04.5 LTS

## 2. Docker 설치 및 동작 확인

```powershell
docker --version
docker compose version
docker info
```

Docker 클라이언트와 서버의 정상 동작 확인.

![Docker 설치 확인](../screenshots/04-docker/05-docker-install-check.png)

## 3. hello-world 컨테이너

```powershell
docker run --name e1-1-hello hello-world
```

결과: Hello from Docker!

![hello-world 실행](../screenshots/04-docker/06-docker-hello-world.png)

## 4. Ubuntu 컨테이너 실행

```powershell
docker run -dit --name e1-1-ubuntu ubuntu:24.04 bash
docker exec -it e1-1-ubuntu bash
```

컨테이너 내부에서 pwd, ls -la, echo,
cat /etc/os-release 명령 실행 성공.

![Ubuntu 컨테이너](../screenshots/04-docker/07-docker-container-operations.png)

## 5. Docker 이미지 및 리소스 확인

```powershell
docker images
docker ps
docker ps -a
docker stats --no-stream
docker logs e1-1-hello
```

이미지 2종과 컨테이너 상태, 리소스 사용량 확인.

![이미지 및 리소스](../screenshots/04-docker/08-docker-images-stats.png)

## 6. 컨테이너 중지 및 재시작

```powershell
docker stop e1-1-ubuntu
docker ps -a
docker start e1-1-ubuntu
docker ps
docker exec e1-1-ubuntu echo "Container is running"
```

중지 후 재시작 및 명령 실행 성공.

![중지 및 재시작](../screenshots/04-docker/09-docker-stop-start.png)

## 7. attach와 exec 차이

```powershell
docker run -dit --name e1-1-attach ubuntu:24.04 bash
docker attach e1-1-attach
```

컨테이너 내부에서 echo 실행 후 exit.

실제 결과:
- attach 컨테이너: Exited (0)
- 기존 exec 실습 컨테이너: Up 상태 유지

attach는 기존 주 프로세스에 연결하고,
exec는 별도 프로세스를 생성한다.

![attach와 exec](../screenshots/04-docker/10-docker-attach-exec.png)

## 8. 실습 결론

Docker 설치, 이미지 다운로드, 컨테이너 실행,
로그 및 리소스 확인, 중지와 재시작,
attach와 exec 비교 실습을 완료했다.
