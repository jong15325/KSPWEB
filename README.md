🎮 KSPWEB

Spring MVC 기반 커뮤니티 & 게임 연동 웹 플랫폼

작업 기간: 2020.06 ~ 2020.09 (4개월)
개발 형태: 개인 프로젝트 (교육/포트폴리오)

📋 프로젝트 소개
게임 커뮤니티와 소셜 기능을 결합한 웹 애플리케이션입니다. 
사용자 간 소통(게시판, 쪽지), 길드 시스템, 게임 아이템 관리 등 실제 서비스 수준의 기능을 구현했습니다.

Note: 개인 SVN 저장소에서 개발 후 Git으로 이관된 프로젝트입니다. 따라서 커밋 히스토리는 최종 버전만 포함되어 있습니다.

🛠 기술 스택
Backend
- Framework: Spring Framework 4.3.4
- Language: Java 1.6
- Build Tool: Maven
- ORM: MyBatis
- Logging: Log4j, SLF4J, Logback

Frontend
- View Engine: JSP
- Template Engine: Apache Tiles
- Style: CSS
- Script: JavaScript

Database
- MyBatis XML Mapper 기반 데이터베이스 연동

External API
- Kakao REST API (소셜 로그인)

🏗 아키텍처
Controller → Service → DAO → MyBatis Mapper

✨ 주요 기능
👤 사용자 & 인증
  - 회원가입/로그인
  - 카카오 소셜 로그인
  - 사용자 랭킹

📝 게시판
  - 자유게시판, 공지사항, 이벤트, 업데이트 게시판
  - 댓글/대댓글
  - 파일 업로드

🏰 길드 시스템
  - 길드 생성/관리
  - 가입 신청 및 승인
  - 길드 랭킹
  - 직책 관리

🛒 아이템 & 상점
- 카드 시스템 (Avatar, Pet, Character 등)
- 게임 아이템 상점
- 인벤토리 관리

💬 소셜
  - 쪽지
  - 방명록

📚 학습 포인트
  - Spring MVC 패턴 구현
  - MyBatis를 활용한 데이터베이스 연동
  - REST API 연동 (Kakao OAuth)
  - Interceptor를 통한 인증/인가 처리
  - Apache Tiles를 활용한 레이아웃 관리
  - 파일 업로드 처리

🚀 설치 및 실행
  - JDK 1.6+
  - Maven 4
  - MySQL 5.6
  - Tomcat 8.5

spweb/src/main/webapp/WEB-INF/config/db.properties - 데이터베이스 설정
spweb/src/main/webapp/WEB-INF/config/kakao.properties - 카카오 API 키
