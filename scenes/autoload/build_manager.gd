# BuildManager.gd (Autoload로 등록)
extends Node

var selected_building_scene: PackedScene = null
var preview_instance: Node2D = null
var grid_size: Vector2i = Vector2i(1, 1)
var can_build: bool = false
var tilemap: TileMapLayer = null  # 전장 또는 마을 Layer 레퍼런스
var build_size: Vector2i  # 예: Vector2i(2, 2)
var placed_tiles := {}  # 이미 설치된 타일 좌표를 저장할 Set 혹은 Dictionary
var current_building: PackedScene = null # 현재 선택된 건물 프리팹 (PackedScene)
var is_building: bool = false
var entities_node: Node = null  # 보조 터렛을 실제로 배치할 곳


func _process(_delta):
    if not is_building or preview_instance == null or tilemap == null:
        return
    if not is_instance_valid(preview_instance) or not is_instance_valid(tilemap):
        return
    if not preview_instance.is_inside_tree() or not tilemap.is_inside_tree():
        return

    var mouse_pos = tilemap.get_global_mouse_position()
    var cell = tilemap.local_to_map(mouse_pos)
    var world_pos = tilemap.map_to_local(cell)

    # 미리보기 위치 갱신
    preview_instance.global_position = world_pos

    # 설치 가능 여부에 따라 색상 변경
    can_build = check_build_possible(cell)
    var color = Color(0, 1, 0, 0.5) if can_build else Color(1, 0, 0, 0.5)
    preview_instance.modulate = color


func _unhandled_input(event):
    if preview_instance == null:
        return

    if event is InputEventMouseButton and event.pressed:
        if event.button_index == MOUSE_BUTTON_LEFT:
            var mouse_pos = tilemap.get_global_mouse_position()
            var tile_pos = tilemap.local_to_map(mouse_pos)


            if check_build_possible(tile_pos):
                place_building(tile_pos)
                cancel_build()
        elif event.button_index == MOUSE_BUTTON_RIGHT:
            cancel_build()


func start_build_mode(scene: PackedScene, size: Vector2i, tilemap_ref: TileMapLayer):
    current_building = scene
    build_size = size
    tilemap = tilemap_ref
    is_building = true

    # Entities 노드 참조 저장
    entities_node = get_tree().get_first_node_in_group("entities_layer")

    if preview_instance:
        preview_instance.queue_free()

    preview_instance = current_building.instantiate()
    if preview_instance.has_method("set"):
        preview_instance.set("is_preview", true)
    
    tilemap.add_child(preview_instance)  # 프리뷰는 tilemap 위에 표시
    preview_instance.modulate = Color(1, 1, 1, 0.5)


func cancel_build():
    is_building = false
    if preview_instance:
        preview_instance.queue_free()
        preview_instance = null


func create_preview():
    preview_instance = selected_building_scene.instantiate()
    preview_instance.modulate = Color(1, 1, 1, 0.5)
    get_tree().get_current_scene().add_child(preview_instance)


func update_preview(mouse_pos: Vector2):
    if not preview_instance:
        return

    var tile_pos = tilemap.local_to_map(mouse_pos)
    var world_pos = tilemap.map_to_local(tile_pos)
    preview_instance.global_position = world_pos

    can_build = check_build_possible(tile_pos)
    update_preview_color()


func update_preview_color():
    var color = Color(0, 1, 0, 0.5) if can_build else Color(1, 0, 0, 0.5)
    for child in preview_instance.get_children():
        if child is CanvasItem:
            child.modulate = color


func confirm_build():
    if can_build and selected_building_scene:
        var building = selected_building_scene.instantiate()
        var tile_pos = tilemap.local_to_map(preview_instance.global_position)
        building.global_position = tilemap.map_to_local(tile_pos)
        tilemap.add_child(building)
        cancel_build()


func check_build_possible(start_tile: Vector2i) -> bool:
    if tilemap == null or not is_instance_valid(tilemap) or not tilemap.is_inside_tree():
        return false

    for y in range(build_size.y):
        for x in range(build_size.x):
            var tile_pos = start_tile + Vector2i(x, y)

            # 맵 바깥 검사
            if not tilemap.get_used_rect().has_point(tile_pos):
                return false

            # 이미 건물이 설치된 타일인지 검사
            if placed_tiles.has(tile_pos):
                return false

            # (선택사항) 특정 타일 속성 검사
            var tile_data = tilemap.get_cell_tile_data(tile_pos)
            if tile_data and tile_data.get_custom_data("build_blocked") == true:
                return false

            # 플레이어나 적이 있는지 검사
            var world_pos = tilemap.map_to_local(tile_pos)
            var space_state = tilemap.get_world_2d().direct_space_state

            var params = PhysicsPointQueryParameters2D.new()
            params.position = world_pos
            params.collide_with_areas = true
            params.collide_with_bodies = true

            var result = space_state.intersect_point(params)
            for hit in result:
                var collider = hit.collider
                if collider.is_in_group("player") or collider.is_in_group("enemy"):
                    return false

    return true


func place_building(tile_pos: Vector2i):
    if not check_build_possible(tile_pos):
        return

    var instance = current_building.instantiate()
    var world_pos = tilemap.map_to_local(tile_pos)
    instance.global_position = world_pos

    # 터렛은 Entities 아래에 배치
    if entities_node:
        entities_node.add_child(instance)
    else:
        push_error("Entities 노드를 찾을 수 없습니다!")

    # 설치된 타일 기록
    for y in range(build_size.y):
        for x in range(build_size.x):
            placed_tiles[tile_pos + Vector2i(x, y)] = true
