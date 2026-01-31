# 🏗️ Architecture Plan: Building & Placement System

이 문서는 프로젝트가 확장됨에 따라 `BuildManager`와 설치 시스템이 나아가야 할 아키텍처 방향성을 정의합니다.

## 1. 현재 상태와 문제점 분석
- **Current State:** `BuildManager` 싱글톤이 "설치 입력(Input)", "미리보기(Preview)", "유효성 검사(Validation)", "비용 지불(Cost)", "오브젝트 생성(Spawn)"을 모두 관리하거나 강하게 결합되어 있음.
- **Problem:**
    - 전투(소환)는 '마나/쿨타임'을 소모하고, 마을(건축)은 '아이템/골드'를 소모함.
    - 소환은 즉시 완료되지만, 건축은 NPC가 하거나 시간이 걸릴 수 있음.
    - 현재 구조로는 `BuildManager`안에 `if is_combat: pay_mana() else: pay_item()` 같은 분기 처리가 늘어날 위험이 있음.

## 2. 목표 아키텍처: "Layered Responsibility" (계층형 책임 분리)

`BuildManager`를 순수한 **"설치 대행자(Placement Agent)"**로 축소하고, 비용과 조건은 **"의뢰자(Client)"** 시스템이 담당하도록 분리합니다.

### A. The Core (BuildManager) - "어디에 놓을 것인가?"
`BuildManager`는 오직 물리적인 설치 행위만 담당합니다. **"무엇을(Data)"** **"어디에(Coords)"** 설치할지만 신경 씁니다. 비용(돈, 마나)에 대해서는 몰라야 합니다.

**핵심 기능:**
1.  **Cursor & Ghosting:** 마우스 따라다니는 반투명 미리보기 표출.
2.  **Validation:** 빨간색/초록색 표시 (충돌 체크, 거리 체크).
3.  **Broadcasting:** 설치가 확정되면 `signal object_placed(coords, data)` 신호만 발송.

### B. The Clients (Context Controllers) - "왜, 어떤 비용으로 설치하는가?"
각 상황에 맞는 시스템이 `BuildManager`를 호출하고, 결과를 처리합니다.

#### 1. Inventory/Hotbar System (마을, 보관함)
- **Trigger:** 인벤토리 아이템 사용.
- **Pre-Check:** 아이템 개수 > 0 확인.
- **Action:** `BuildManager.start_placing(chest_data, callbacks)` 호출.
- **Callback:** 설치 성공 시 -> 아이템 1개 차감.

#### 2. Skill System (전장, 터렛)
- **Trigger:** 스킬 버튼 클릭 (Q, W, E...).
- **Pre-Check:** 마나 충분? 쿨타임 완료? 스킬 해금 여부?
- **Action:** `BuildManager.start_placing(turret_data, callbacks)` 호출.
- **Callback:** 설치 성공 시 -> 마나 차감, 쿨타임 시작.

#### 3. Construction Vendor System (NPC 건축)
- **Trigger:** 로빈(목수) NPC와 대화 후 "닭장 건설" 선택.
- **Pre-Check:** 골드 충분? 나무/돌 충분?
- **Action:** `BuildManager.start_selecting_location(building_data)` 호출.
- **Callback:** 위치 선택 완료 시 -> 건물 짓지 않고 "공사장 표지판" 생성 & 다음 날 완공 예약.

## 3. 구현 로드맵 (Phase 23 Execution Plan)

우리는 **"Over-Engineering"**을 방지하기 위해, NPC나 스킬 시스템이 완성되지 않은 상태에서도 안전하게 리팩토링을 진행합니다.

### 🎯 Scope Checklist
1.  **NO NPC AI:** NPC 대화나 AI를 구현하지 않습니다.
2.  **NO Skill Tree:** 복잡한 스킬 해금 로직을 구현하지 않습니다.
3.  **Focus:** 오직 `BuildManager`를 "순수한 설치 도구"로 만드는 것에 집중합니다.

### 🛤️ Step-by-Step
1.  **Step 1: Ghost & Grid 분리 (The Purge)**
    - 비용 계산(Item consumption) 로직을 `BuildManager`에서 제거합니다.
    - 순수하게 마우스 따라다니는 'Ghost' 기능과 타일맵 'Snap' 기능만 남깁니다.

2.  **Step 2: RequestHandler 도입 (The Interface)**
    - `start_placement(item_data, on_success_callback)` 인터페이스를 정의합니다.
    - 기존의 "아이템 사용" 로직을 이 인터페이스에 맞게 수정하여 연결합니다.

3.  **Step 3: POC (Magic T Key)**
    - **가짜 스킬(Magic Turret)**을 구현하여 아키텍처를 검증합니다.
    - `T` 키를 누르면 "공짜 터렛" 설치 모드로 진입합니다.
    - 이것이 작동하면, 나중에 스킬 시스템이 들어올 때 연결만 하면 끝납니다.

## 4. 결론
지금의 `BuildManager` 방식은 소규모 프로젝트에 적합한 "Rapid Prototype" 형태입니다.
하지만 프로젝트 규모가 커지고 조건이 복잡해지면(전투 소모값 vs 마을 건설 자재 등), **"설치 행위(Mechanic)"**와 **"설치 비용/조건(Context)"**을 분리하는 **Strategy Pattern**이나 **Callback/Signal 기반 패턴**으로 전환하는 것이 정답입니다.
