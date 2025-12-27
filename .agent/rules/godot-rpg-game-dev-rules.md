---
trigger: always_on
---

# Godot 4.4 RPG Development Rules & Standards

이 문서는 프로젝트의 일관성을 유지하기 위한 핵심 개발 규칙이다. 모든 에이전트는 새로운 기능을 구현하거나 리팩토링할 때 이 규칙을 반드시 준수해야 한다.

## 1. 아키텍처 철학: "Composition Over Inheritance"
- **상속 금지:** 모든 기능은 `Component` 단위의 노드로 분리하여 엔티티에 부착한다.
- **단일 책임:** 하나의 스크립트나 컴포넌트는 오직 하나의 역할만 수행한다.
- **Node-Based:** 엔티티(Player, Enemy)의 로직을 확장할 때는 자식 노드를 추가하고, 부모는 이를 조합(Coordinate)하는 역할만 수행한다.

## 2. 시그널 관리: "Explicit Code-Based Connection"
- **GUI 연결 금지:** Godot 에디터의 'Node' 탭을 통한 시그널 연결을 지양한다.
- **코드 명시성:** 시그널의 정의(`signal`), 연결(`.connect()`), 해제는 반드시 **GDScript 코드 내에서 명시적으로 작성**한다.
- **연결 시점:** 주로 `_ready()` 함수 내에서 연결을 수행하여, 스크립트만 보고도 객체 간의 통신 흐름을 한눈에 파악할 수 있게 한다.
- **Signal Bus 활용:** 전역적인 이벤트(예: 아이템 획득, 퀘스트 완료)는 가급적 싱글톤(Manager)의 시그널을 통해 중계하여 시스템 간 결합도를 낮춘다.

## 3. 데이터 관리: "Resource-Driven & Inspector-First"
- **데이터 분리:** 모든 수치, 설정, 고유 데이터는 `.gd` 스크립트가 아닌 `.tres` (Resource) 파일로 관리한다.
- **@export 적극 활용:** 하드코딩을 피하고, 모든 파라미터는 인스펙터에 노출한다.
- **Resource Integrity:** 데이터 반환 시 반드시 `.duplicate()`를 사용하여 원본 리소스 오염을 방지한다.

## 4. 전역 시스템: "Manager (Singleton) Pattern"
- **Manager 역할:** 각 매니저는 자신의 도메인 상태와 전역 이벤트를 책임진다.
- **느슨한 결합:** 매니저 간 직접 참조를 최소화하고 `Signal`을 통해 소통한다.

## 5. 코딩 컨벤션 (GDScript 2.0)
- **최신 문법:** Godot 4.4 표준(Typed Arrays, `@onready`, `Callable` 등)을 사용한다.
- **정적 타입 권장:** 가능하면 변수와 함수의 반환 타입을 명시하여 에러를 사전에 방지한다.