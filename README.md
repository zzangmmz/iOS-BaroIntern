# 🔐 iOS 바로인턴 10기 앱 개발 과제 - 이명지
> 이메일 기반의 회원가입 및 로그인 애플리케이션입니다.

## 목차
[1. 프로젝트 정보](#1-프로젝트-정보)

[2. 버전 요구사항](#2-버전-요구사항)

[3. 기술 스택](#3-기술-스택)

[4. 스크린샷](#4-스크린샷)

[5. 주요 기능](#5-주요-기능)

[6. 프로젝트 구조](#6-프로젝트-구조)

[7. 트러블 슈팅](#7-트러블-슈팅)

---
## 1. 프로젝트 정보

#### 프로젝트명: iOS-BaroIntern-LeeMyungji
#### 앱 종류: 회원가입 및 로그인 서비스
#### 프로젝트기간: 2025. 03. 14 ~ 2025.03.16

---

## 2. 버전 요구사항
- Xcode 버전: 16.2 이상
- iOS 지원 버전: iOS 16.6 이상
- Swift 버전: Swift 5 이상

---

## 3. 기술 스택
#### 최소 지원 버전: iOS 16.6
#### 아키텍처: MVC
  - 간결한 데이터 구조와 복잡하지 않은 데이터 바인딩을 고려해 간결하고 효율적인 MVC 아키텍처 패턴 채택
#### UI 프레임워크
  - UIKit: iOS UI 개발의 기본 프레임워크
#### 데이터 저장
  - CoreData: 로컬 데이터베이스로 사용자 정보 관리
  - UserDefaults: 로그인 여부 확인을 위한 경량 데이터 저장소
#### 사용 라이브러리
  - SnapKit
      - 코드 기반 UI의 제약조건을 직관적이고 간결하게 작성
      - 복잡한 UI 레이아웃을 보다 가독성 높은 코드로 구현
      - NSLayoutConstraint보다 적은 코드량으로 동일한 레이아웃 구현 가능

---
## 4. 스크린샷

| 시작하기 화면 | 비회원인 경우 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/f27e1185-76ec-4b47-84c4-1edf7982f53e" width="300"> | <img src="https://github.com/user-attachments/assets/b14acf6f-1918-4e10-8703-7f8cfc7b8ff7" width="300"> |

| 회원가입 과정 | 회원인 경우 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/fd6dff5a-c6d1-4a73-86de-a4de13bcfe28" width="300"> | <img src="https://github.com/user-attachments/assets/97d74c6b-88e9-4526-b15f-e1933543f36b" width="300"> |

| 로그아웃 후 시작하기 화면으로 이동 | 회원탈퇴 후 시작하기 화면으로 이동 |
| --- | --- |
| <img src="https://github.com/user-attachments/assets/2562e3bd-3be2-4c48-b06f-a7686d681987" width="300"> | <img src="https://github.com/user-attachments/assets/64e72169-a9af-4fee-b695-3d21c9d99274" width="300"> |

| 라이트모드/다크모드 토글 |
| --- |
| <img src="https://github.com/user-attachments/assets/9c67cffa-4a67-47a9-8e26-56b10d68956e" width="300"> |

---
## 5. 주요 기능

### 🔑 시작하기 화면
- 앱 진입점으로 회원 상태에 따라 회원가입 화면, 로그인 성공 화면으로 분기
- UserDefaults로 로그인 여부 판단
- 직관적인 UI로 사용자 접근성 향상

### 📝 회원가입 기능
- 이메일 형식의 아이디 등록
  - 이메일 영역(@이전)이 6-20자 이하
  - 영문 소문자(a-z)와 숫자(0-9)만 사용 가능
  - 숫자로 시작 불가
- 비밀번호 등록 및 확인
  - 최소 8자 이상
  - 영문 대소문자, 숫자, 특수문자 사용 가능
  - 비밀번호 표시/숨김 기능
- 닉네임 등록
- 모든 조건 충족 시 회원가입 버튼 활성화
- 유효성에 따라 컴포넌트 색을 변경해 시각적 피드백 제공
- CoreData를 활용한 사용자 정보 저장

### 👤 로그인 성공 화면
- 사용자 닉네임과 함께 환영 메시지 표시
- 로그아웃 기능
- 회원탈퇴 기능
- 확인 Alert를 통한 사용자 실수 방지

### 🔄 데이터 관리
- CoreData를 활용한 사용자 정보 영구 저장
- UserDefaults를 통한 로그인 상태 유지

### 🌓 다크모드/라이트모드 지원
- 시스템 설정에 맞는 자동 테마 전환
- Assets에 색상 설정으로 다크모드와 라이트모드에서 최적화된 UI 제공

---
## 6. 프로젝트 구조
프로젝트는 MVC 아키텍처 패턴을 따르고 있습니다.

### Model
- `UserData.swift`: 사용자 데이터 모델
- `CoreDataManager.swift`: CoreData 관련 CRUD 작업 관리
- `UserDefaultsKeys.swift`: UserDefaults 키 관리

### View
- `InputContainerView.swift`: 입력 필드 컨테이너 뷰
- `InputTextField.swift`: 커스텀 텍스트 필드
- `InputTitleLabel.swift`: 입력 필드 타이틀 레이블
- `InputValidationLabel.swift`: 유효성 검사 결과 표시 레이블
- `PasswordToggleButton.swift`: 비밀번호 표시/숨김 토글 버튼

### Controller
- `StartViewController.swift`: 시작 화면 뷰컨트롤러
- `SignUpViewController.swift`: 회원가입 화면 뷰컨트롤러
- `LoggedInViewController.swift`: 로그인 성공 화면 뷰컨트롤러

### CoreData
- `User+CoreDataClass.swift`: CoreData 엔티티 클래스
- `User+CoreDataProperties.swift`: CoreData 엔티티 속성
- `iOS_BaroIntern_LeeMyungji.xcdatamodeld`: CoreData 모델 정의

---
## 7. 트러블 슈팅

### 1️⃣ 텍스트 필드 입력 시 레이블 애니메이션 문제
- **문제**: 텍스트 필드 포커스 시 레이블이 올라가는 애니메이션이 일관되지 않은 문제
- **해결**: SnapKit의 remakeConstraints를 활용하여 레이아웃 변경 후 애니메이션 적용

### 2️⃣ 네비게이션 흐름 문제
- **문제**: 회원가입 후 로그인 성공화면으로 이동한 경우, 백버튼 터치 시 회원가입 화면으로 돌아가는 부자연스러운 흐름 발생
- **해결**: 네비게이션 바의 백버튼을 커스텀하여 루트 뷰컨트롤러(시작화면)로 직접 이동하도록 액션을 재정의
