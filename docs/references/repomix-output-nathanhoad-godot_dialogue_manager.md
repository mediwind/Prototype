This file is a merged representation of the entire codebase, combined into a single document by Repomix.
The content has been processed where security check has been disabled.

# File Summary

## Purpose
This file contains a packed representation of the entire repository's contents.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Security check has been disabled - content may contain sensitive information
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
addons/
  dialogue_manager/
    assets/
      banner.png
      banner.png.import
      icon.svg
      icon.svg.import
      responses_menu.svg
      responses_menu.svg.import
      update.svg
      update.svg.import
    compiler/
      compilation.gd
      compilation.gd.uid
      compiled_line.gd
      compiled_line.gd.uid
      compiler_regex.gd
      compiler_regex.gd.uid
      compiler_result.gd
      compiler_result.gd.uid
      compiler.gd
      compiler.gd.uid
      expression_parser.gd
      expression_parser.gd.uid
      resolved_goto_data.gd
      resolved_goto_data.gd.uid
      resolved_line_data.gd
      resolved_line_data.gd.uid
      resolved_tag_data.gd
      resolved_tag_data.gd.uid
      tree_line.gd
      tree_line.gd.uid
    components/
      editor_property/
        editor_property_control.gd
        editor_property_control.gd.uid
        editor_property_control.tscn
        editor_property.gd
        editor_property.gd.uid
        resource_button.gd
        resource_button.gd.uid
        resource_button.tscn
      code_edit_syntax_highlighter.gd
      code_edit_syntax_highlighter.gd.uid
      code_edit.gd
      code_edit.gd.uid
      code_edit.tscn
      download_update_panel.gd
      download_update_panel.gd.uid
      download_update_panel.tscn
      errors_panel.gd
      errors_panel.gd.uid
      errors_panel.tscn
      files_list.gd
      files_list.gd.uid
      files_list.tscn
      search_and_replace.gd
      search_and_replace.gd.uid
      search_and_replace.tscn
      title_list.gd
      title_list.gd.uid
      title_list.tscn
      update_button.gd
      update_button.gd.uid
      update_button.tscn
    example_balloon/
      example_balloon.gd
      example_balloon.gd.uid
      example_balloon.tscn
      ExampleBalloon.cs
      ExampleBalloon.cs.uid
      small_example_balloon.tscn
    l10n/
      en.po
      es.po
      translations.pot
      uk.po
      zh_TW.po
      zh.po
    utilities/
      builtins.gd
      builtins.gd.uid
      dialogue_cache.gd
      dialogue_cache.gd.uid
      translations.gd
      translations.gd.uid
      waiter.gd
      waiter.gd.uid
    views/
      find_in_dialogue_view.gd
      find_in_dialogue_view.gd.uid
      find_in_dialogue_view.tscn
      main_view.gd
      main_view.gd.uid
      main_view.tscn
    constants.gd
    constants.gd.uid
    dialogue_label.gd
    dialogue_label.gd.uid
    dialogue_label.tscn
    dialogue_line.gd
    dialogue_line.gd.uid
    dialogue_manager.gd
    dialogue_manager.gd.uid
    dialogue_processor.gd
    dialogue_processor.gd.uid
    dialogue_resource.gd
    dialogue_resource.gd.uid
    dialogue_response.gd
    dialogue_response.gd.uid
    dialogue_responses_menu.gd
    dialogue_responses_menu.gd.uid
    DialogueManager.cs
    DialogueManager.cs.uid
    editor_translation_parser_plugin.gd
    editor_translation_parser_plugin.gd.uid
    export_plugin.gd
    export_plugin.gd.uid
    import_plugin.gd
    import_plugin.gd.uid
    inspector_plugin.gd
    inspector_plugin.gd.uid
    LICENSE
    plugin.cfg
    plugin.cfg.uid
    plugin.gd
    plugin.gd.uid
    settings.gd
    settings.gd.uid
    test_scene.gd
    test_scene.gd.uid
    test_scene.tscn
```

# Files

## File: addons/dialogue_manager/assets/banner.png.import
```
[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cnm67htuohhlo"
path="res://.godot/imported/banner.png-7e9e6a304eef850602c8d5afb80df9c3.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://addons/dialogue_manager/assets/banner.png"
dest_files=["res://.godot/imported/banner.png-7e9e6a304eef850602c8d5afb80df9c3.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/uastc_level=0
compress/rdo_quality_loss=0.0
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/channel_remap/red=0
process/channel_remap/green=1
process/channel_remap/blue=2
process/channel_remap/alpha=3
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
```

## File: addons/dialogue_manager/assets/icon.svg
```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   width="16"
   height="16"
   viewBox="0 0 4.2333333 4.2333335"
   version="1.1"
   id="svg291"
   inkscape:version="1.2.1 (9c6d41e410, 2022-07-14)"
   sodipodi:docname="icon.svg"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  <sodipodi:namedview
     id="namedview293"
     pagecolor="#ffffff"
     bordercolor="#666666"
     borderopacity="1.0"
     inkscape:pageshadow="2"
     inkscape:pageopacity="0.0"
     inkscape:pagecheckerboard="0"
     inkscape:document-units="px"
     showgrid="false"
     width="1920px"
     units="px"
     borderlayer="true"
     inkscape:showpageshadow="false"
     inkscape:zoom="18.583334"
     inkscape:cx="9.3901342"
     inkscape:cy="13.506726"
     inkscape:window-width="1440"
     inkscape:window-height="890"
     inkscape:window-x="-6"
     inkscape:window-y="-6"
     inkscape:window-maximized="1"
     inkscape:current-layer="layer1"
     inkscape:deskcolor="#d1d1d1" />
  <defs
     id="defs288" />
  <g
     inkscape:label="Layer 1"
     inkscape:groupmode="layer"
     id="layer1">
    <path
       id="path3615"
       style="clip-rule:evenodd;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.00206088;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:40"
       d="M 2.3616237,0.32495581 C 2.2890187,0.32469635 2.2284054,0.32546079 2.1926162,0.32687081 1.8949218,0.33860011 1.5033325,0.34148331 1.2561323,0.35080961 1.1421362,0.35510961 0.51253678,0.28342811 0.31150932,0.54279835 0.0999174,0.81580911 0.23804642,2.0559707 0.22102032,2.2314376 0.21014342,2.34358 0.20066442,2.896122 0.41300909,3.1219592 0.60816171,3.3295105 0.90177008,3.3453424 0.95593994,3.3503348 1.0177384,3.3560148 1.5339832,3.3499581 1.574996,3.351287 c 0.015313,4.929e-4 0.064365,0.00139 0.1311843,0.00287 0.027454,0.1558591 0.1348816,0.4055146 0.2891801,0.5079801 0.1737371,0.1153709 0.5840376,0.1672049 0.633898,0.1417174 0.033884,-0.017324 0.2120976,-0.020746 0.2120976,-0.03926 -3e-7,-0.00281 -0.1359618,-0.075872 -0.1795407,-0.098149 C 2.5715112,3.8202919 2.5190005,3.7242168 2.4506759,3.6543568 2.4244915,3.6275965 2.4279949,3.4751553 2.4315249,3.3742737 2.5495776,3.3733989 2.8697241,3.3839918 2.9371113,3.3838502 3.0975326,3.3835266 3.5689747,3.3993771 3.8080031,3.1818075 4.0962844,2.9193889 4.0228795,2.3969451 4.0186641,2.3267119 4.013119,2.2343213 4.0250025,1.6246294 4.0162732,1.4864616 4.0028561,1.274529 4.0737709,0.94594107 3.8376871,0.59402732 3.6199123,0.26941205 3.0597025,0.34195584 3.0151516,0.33931907 2.9077682,0.33296522 2.5794394,0.32573415 2.3616237,0.32495581 Z m 0.9580286,0.52713126 a 0.19209624,0.19209624 0 0 1 0.063678,0.007659 A 0.19209624,0.19209624 0 0 1 3.5121209,1.10057 c -0.019132,0.064024 -0.02934,0.114542 -0.029205,0.1517718 a 0.19211544,0.19211544 0 0 0 0,4.785e-4 0.19211544,0.19211544 0 0 0 0,4.785e-4 0.19211544,0.19211544 0 0 0 0,4.784e-4 0.19211544,0.19211544 0 0 0 0,4.785e-4 0.19211544,0.19211544 0 0 0 0,4.786e-4 0.19211544,0.19211544 0 0 0 0,4.784e-4 0.19211544,0.19211544 0 0 0 0,4.785e-4 0.19211544,0.19211544 0 0 0 0,4.784e-4 0.19211544,0.19211544 0 0 0 0,4.786e-4 0.19211544,0.19211544 0 0 0 0,4.785e-4 0.19211544,0.19211544 0 0 0 0,4.784e-4 0.19211544,0.19211544 0 0 0 0,4.785e-4 0.19211544,0.19211544 0 0 0 0,4.785e-4 0.19211544,0.19211544 0 0 0 0,4.785e-4 0.19211544,0.19211544 0 0 0 0,4.785e-4 0.19211544,0.19211544 0 0 0 0,4.784e-4 0.19211544,0.19211544 0 0 0 0,4.786e-4 0.19211544,0.19211544 0 0 0 0,4.784e-4 0.19211544,0.19211544 0 0 0 0,4.785e-4 c -0.00327,0.073938 -0.00815,0.1281478 -0.00336,0.1646986 a 0.19211544,0.19211544 0 0 1 0.00192,0.01963 c 0.00122,0.044001 0.00215,0.096625 -0.00383,0.1560806 a 0.19211544,0.19211544 0 0 1 -0.0091,0.04309 c 0.00152,-0.00444 0.00292,-0.00713 0.00383,-0.00814 0.00239,4.689e-4 -5.16e-5,0.023556 -0.012927,0.069423 l -4.786e-4,0.00144 c -0.00322,0.018276 -0.00512,0.060008 -0.010052,0.1072455 2.1e-6,-1.573e-4 -1.8e-5,0.00348 0,0.00383 8.03e-5,0.00155 -1.3e-6,0.00456 0,0.016278 A 0.19209624,0.19209624 0 0 1 3.256933,2.0270008 0.19209624,0.19209624 0 0 1 3.0649443,1.835012 c -2e-7,-8.421e-4 -2.139e-4,-0.00933 0,-0.025375 a 0.19211544,0.19211544 0 0 1 0.00192,-0.021545 c 0.00393,-0.029738 0.00172,-0.085222 0.018193,-0.1627834 a 0.19211544,0.19211544 0 0 1 0.00336,-0.014841 c -0.00488,0.016544 -0.00842,-0.00696 0.0091,-0.066071 0.00128,-0.023365 8.374e-4,-0.05167 0,-0.083786 5.837e-4,0.00531 0.0012,0.010844 0.00192,0.016278 l -0.00192,-0.020109 c -0.00868,-0.082861 -0.00275,-0.1509043 0,-0.2044368 -3.839e-4,-0.1048643 0.02617,-0.1913531 0.047392,-0.26236915 A 0.19209624,0.19209624 0 0 1 3.3196523,0.85208707 Z M 3.097501,1.5443956 c -3.745e-4,0.00682 -8.326e-4,0.013152 -0.00144,0.019151 l 0.00862,-0.043569 c -0.00298,0.00868 -0.00496,0.016879 -0.00718,0.024418 z M 1.7483131,1.0129554 a 0.19211544,0.19211544 0 0 1 0.1804981,0.1292692 c 0.081754,0.230866 0.1671804,0.4503689 0.2566234,0.6094805 0.060542,-0.039278 0.13119,-0.081733 0.2374723,-0.083307 0.030189,-0.00505 0.059326,-0.01228 0.095756,-0.00527 0.053638,0.010328 0.1089723,0.045047 0.1426749,0.086658 0.067401,0.08322 0.064433,0.1543836 0.063678,0.2082669 -0.00151,0.1077673 -0.021788,0.2137733 -0.022023,0.2044369 A 0.19209624,0.19209624 0 0 1 2.5167468,2.3578344 0.19209624,0.19209624 0 0 1 2.3194915,2.1715908 c -7.704e-4,-0.030281 0.0031,-0.035159 0.00527,-0.059847 -0.035038,0.025653 -0.068601,0.053251 -0.1139486,0.081391 A 0.19211544,0.19211544 0 0 1 1.9704693,2.1624936 c -0.016009,-0.016679 -0.012719,-0.040218 -0.027291,-0.057933 -0.0053,0.038768 -0.013896,0.105592 -0.030642,0.1881586 -0.00975,0.048046 -0.018553,0.093357 -0.036386,0.1412386 -0.00891,0.023941 -0.00752,0.046058 -0.061283,0.09767 -0.00671,0.00645 -0.015395,0.013123 -0.025375,0.020109 -0.00997,0.00699 -0.03579,0.021291 -0.036386,0.021545 -0.00119,5.072e-4 -0.1089417,0.013114 -0.1101182,0.012927 -5.885e-4,-9.26e-5 -0.052085,-0.016004 -0.052666,-0.016278 -5.848e-4,-2.741e-4 -0.028877,-0.016619 -0.039745,-0.025375 -0.021733,-0.017517 -0.036349,-0.03491 -0.045484,-0.048835 a 0.19211544,0.19211544 0 0 1 -0.00718,-0.012927 C 1.405201,2.3135107 1.3718331,2.1230884 1.3226821,1.9293306 1.296257,1.9926645 1.2702556,2.0360279 1.236503,2.1127015 c -0.00662,0.020181 -0.015708,0.041777 -0.033514,0.067986 -0.021835,0.03214 -0.067722,0.078719 -0.1393236,0.090488 -0.0716015,0.011769 -0.13415192,-0.018894 -0.16469865,-0.043568 -0.0305472,-0.024673 -0.042975,-0.046717 -0.0541012,-0.065113 -0.0389429,-0.064387 -0.0578673,-0.09647 -0.0526653,-0.176189 0.002344,0.010422 0.004713,0.021014 0.00718,0.031599 L 0.79602584,1.94896 c -0.001684,0.013201 -0.003086,0.025254 -0.003828,0.036387 C 0.74313508,1.766609 0.72147035,1.582656 0.68734765,1.3720365 A 0.19209624,0.19209624 0 0 1 0.84486459,1.1527576 0.19209624,0.19209624 0 0 1 1.0655799,1.3102746 c 0.012592,0.077723 0.025291,0.1404024 0.035908,0.2097036 0.010745,-0.014664 0.00973,-0.026756 0.021545,-0.041175 -0.0011,-0.00222 0.032336,-0.054265 0.079956,-0.1067668 0.013605,-0.015001 0.028067,-0.03269 0.061762,-0.052665 0.033694,-0.019975 0.1078148,-0.047748 0.1843284,-0.018193 0.068698,0.026536 0.092715,0.077474 0.1086819,0.1139485 -0.00167,-0.078755 -0.00808,-0.1467436 -0.00383,-0.2207153 A 0.19211544,0.19211544 0 0 1 1.7186306,1.0153489 0.19211544,0.19211544 0 0 1 1.748314,1.0129564 Z M 1.2365027,2.1127015 c 0.0015,-0.00457 0.00304,-0.00894 0.00431,-0.013405 l -0.00862,0.02346 c 0.00152,-0.00352 0.00282,-0.00667 0.00431,-0.010052 z M 3.1899043,2.2683033 A 0.19374282,0.20281166 0 0 1 3.3833296,2.4713039 0.19374282,0.20281166 0 0 1 3.1899043,2.6743046 0.19374282,0.20281166 0 0 1 2.9960006,2.4713039 0.19374282,0.20281166 0 0 1 3.1899043,2.2683033 Z"
       fill="#E0E0E0" />
  </g>
</svg>
```

## File: addons/dialogue_manager/assets/icon.svg.import
```
[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://d3lr2uas6ax8v"
path="res://.godot/imported/icon.svg-17eb5d3e2a3cfbe59852220758c5b7bd.ctex"
metadata={
"has_editor_variant": true,
"vram_texture": false
}

[deps]

source_file="res://addons/dialogue_manager/assets/icon.svg"
dest_files=["res://.godot/imported/icon.svg-17eb5d3e2a3cfbe59852220758c5b7bd.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/uastc_level=0
compress/rdo_quality_loss=0.0
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/channel_remap/red=0
process/channel_remap/green=1
process/channel_remap/blue=2
process/channel_remap/alpha=3
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=true
editor/convert_colors_with_editor_theme=true
```

## File: addons/dialogue_manager/assets/responses_menu.svg
```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   width="16"
   height="16"
   viewBox="0 0 4.2333333 4.2333335"
   version="1.1"
   id="svg291"
   inkscape:version="1.3 (0e150ed6c4, 2023-07-21)"
   sodipodi:docname="responses_menu.svg"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  <sodipodi:namedview
     id="namedview293"
     pagecolor="#ffffff"
     bordercolor="#666666"
     borderopacity="1.0"
     inkscape:pageshadow="2"
     inkscape:pageopacity="0.0"
     inkscape:pagecheckerboard="0"
     inkscape:document-units="px"
     showgrid="false"
     width="1920px"
     units="px"
     borderlayer="true"
     inkscape:showpageshadow="false"
     inkscape:deskcolor="#d1d1d1"
     inkscape:zoom="45.254834"
     inkscape:cx="7.8334173"
     inkscape:cy="6.5959804"
     inkscape:window-width="2560"
     inkscape:window-height="1377"
     inkscape:window-x="-8"
     inkscape:window-y="-8"
     inkscape:window-maximized="1"
     inkscape:current-layer="layer1" />
  <defs
     id="defs288" />
  <g
     inkscape:label="Layer 1"
     inkscape:groupmode="layer"
     id="layer1">
    <path
       id="rect181"
       style="fill:#e0e0e0;fill-opacity:1;stroke:none;stroke-width:1.77487;stroke-linecap:round;stroke-linejoin:round;paint-order:stroke markers fill"
       d="M 1.5875 0.26458334 L 1.5875 0.79375001 L 4.2333334 0.79375001 L 4.2333334 0.26458334 L 1.5875 0.26458334 z M 0 0.83147381 L 0 2.4189738 L 1.3229167 1.6252238 L 0 0.83147381 z M 1.5875 1.3229167 L 1.5875 1.8520834 L 4.2333334 1.8520834 L 4.2333334 1.3229167 L 1.5875 1.3229167 z M 1.5875 2.38125 L 1.5875 2.9104167 L 4.2333334 2.9104167 L 4.2333334 2.38125 L 1.5875 2.38125 z M 1.5875 3.4395834 L 1.5875 3.9687501 L 4.2333334 3.9687501 L 4.2333334 3.4395834 L 1.5875 3.4395834 z "
       fill="#E0E0E0" />
  </g>
</svg>
```

## File: addons/dialogue_manager/assets/responses_menu.svg.import
```
[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://drjfciwitjm83"
path="res://.godot/imported/responses_menu.svg-87cf63ca685d53616205049572f4eb8f.ctex"
metadata={
"has_editor_variant": true,
"vram_texture": false
}

[deps]

source_file="res://addons/dialogue_manager/assets/responses_menu.svg"
dest_files=["res://.godot/imported/responses_menu.svg-87cf63ca685d53616205049572f4eb8f.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/uastc_level=0
compress/rdo_quality_loss=0.0
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/channel_remap/red=0
process/channel_remap/green=1
process/channel_remap/blue=2
process/channel_remap/alpha=3
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=true
editor/convert_colors_with_editor_theme=true
```

## File: addons/dialogue_manager/assets/update.svg
```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   width="300"
   height="80"
   viewBox="0 0 79.374999 21.166667"
   version="1.1"
   id="svg291"
   inkscape:version="1.2.1 (9c6d41e410, 2022-07-14)"
   sodipodi:docname="update.svg"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg">
  <sodipodi:namedview
     id="namedview293"
     pagecolor="#ffffff"
     bordercolor="#666666"
     borderopacity="1.0"
     inkscape:pageshadow="2"
     inkscape:pageopacity="0.0"
     inkscape:pagecheckerboard="0"
     inkscape:document-units="px"
     showgrid="false"
     width="1920px"
     units="px"
     borderlayer="true"
     inkscape:showpageshadow="false"
     inkscape:zoom="1"
     inkscape:cx="180.5"
     inkscape:cy="111"
     inkscape:window-width="1440"
     inkscape:window-height="890"
     inkscape:window-x="-6"
     inkscape:window-y="-6"
     inkscape:window-maximized="1"
     inkscape:current-layer="layer1"
     inkscape:deskcolor="#d1d1d1" />
  <defs
     id="defs288" />
  <g
     inkscape:label="Layer 1"
     inkscape:groupmode="layer"
     id="layer1">
    <rect
       style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.529167;stroke-dasharray:none;stroke-opacity:1"
       id="rect2462"
       width="13.228261"
       height="9.4236727"
       x="32.95359"
       y="4.2143135"
       ry="0.90020913" />
    <path
       id="path3615"
       style="clip-rule:evenodd;fill:#bd93f9;fill-opacity:1;fill-rule:evenodd;stroke:none;stroke-width:0.52916667;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:40;stroke-opacity:1;stroke-dasharray:none"
       d="m 40.714378,3.0283624 c -0.297691,-0.00106 -0.546217,0.00208 -0.692956,0.00785 -1.220595,0.048091 -2.826171,0.059913 -3.83973,0.098152 -0.467403,0.017637 -3.048858,-0.2762743 -3.873101,0.7871837 -0.867561,1.1193864 -0.301209,6.2042409 -0.371018,6.9236829 -0.04459,0.459801 -0.08346,2.725309 0.787183,3.651277 0.800155,0.850991 2.003996,0.915905 2.2261,0.936375 0.253383,0.02331 2.370068,-0.0015 2.538226,0.0039 0.0628,0.002 0.263908,0.0057 0.537877,0.01177 0.112572,0.639046 0.553034,1.662672 1.185683,2.082798 0.712348,0.473037 2.394644,0.685566 2.599079,0.581063 0.138939,-0.07104 0.869634,-0.08507 0.869634,-0.160971 -2e-6,-0.01157 -0.557466,-0.311089 -0.736145,-0.402428 -0.370261,-0.189241 -0.585564,-0.583165 -0.865705,-0.869601 -0.107353,-0.109727 -0.09299,-0.734754 -0.07851,-1.148384 0.484034,-0.0035 1.796685,0.03983 2.072983,0.03926 0.657753,-0.0013 2.590738,0.06366 3.570791,-0.828408 1.181999,-1.075941 0.881027,-3.218042 0.863743,-3.50601 -0.02274,-0.378815 0.02599,-2.878646 -0.0098,-3.4451551 C 47.443688,6.9217592 47.734446,5.5744981 46.766467,4.1315973 45.873555,2.8006244 43.57661,3.0980651 43.393944,3.087254 42.953654,3.0612024 41.607455,3.0315527 40.714378,3.0283624 Z m 3.928065,2.1613198 a 0.78762433,0.78762433 0 0 1 0.261087,0.031405 0.78762433,0.78762433 0 0 1 0.528062,0.9874148 c -0.07845,0.2625075 -0.120302,0.46964 -0.119753,0.6222881 a 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 0.78770308,0.78770308 0 0 0 0,0.00196 c -0.01334,0.3031554 -0.03341,0.5254256 -0.01373,0.6752895 a 0.78770308,0.78770308 0 0 1 0.0078,0.080487 c 0.0051,0.1804113 0.0088,0.3961799 -0.0157,0.6399549 a 0.78770308,0.78770308 0 0 1 -0.03726,0.1767104 c 0.0063,-0.018206 0.01197,-0.029244 0.0157,-0.033361 0.0098,0.00192 -2.12e-4,0.096583 -0.05301,0.2846419 l -0.002,0.00589 c -0.01314,0.074935 -0.02097,0.2460417 -0.04122,0.4397235 9e-6,-6.455e-4 -7.3e-5,0.014282 0,0.015695 3.29e-4,0.00634 -4e-6,0.018697 0,0.066743 A 0.78762433,0.78762433 0 0 1 44.385285,10.007011 0.78762433,0.78762433 0 0 1 43.598102,9.2198268 c -2e-6,-0.00345 -8.77e-4,-0.038262 0,-0.1040456 a 0.78770308,0.78770308 0 0 1 0.0078,-0.088337 c 0.01609,-0.12193 0.0071,-0.3494247 0.07459,-0.6674374 a 0.78770308,0.78770308 0 0 1 0.01373,-0.060853 c -0.02001,0.067835 -0.03455,-0.028543 0.03731,-0.270902 0.0053,-0.0958 0.0035,-0.2118566 0,-0.3435347 0.0024,0.021788 0.0049,0.044462 0.0078,0.066743 l -0.0078,-0.082447 c -0.03559,-0.3397458 -0.01118,-0.6187306 0,-0.8382225 -0.0016,-0.4299563 0.107334,-0.784574 0.194343,-1.0757507 A 0.78762433,0.78762433 0 0 1 44.642342,5.189683 Z m -0.910856,2.8385724 c -0.0015,0.027966 -0.0033,0.053926 -0.0059,0.078522 l 0.03533,-0.1786397 c -0.01216,0.035586 -0.02031,0.069207 -0.02945,0.100118 z M 38.199709,5.8492675 a 0.78770308,0.78770308 0 0 1 0.740071,0.5300233 c 0.335202,0.9465866 0.685464,1.8465826 1.052196,2.4989649 0.248233,-0.1610476 0.537898,-0.3351164 0.973672,-0.3415703 0.123774,-0.020676 0.243246,-0.050347 0.392613,-0.021583 0.219925,0.042345 0.446803,0.1847018 0.584989,0.3553102 0.276354,0.3412161 0.264185,0.6329968 0.261087,0.8539269 -0.0061,0.4418625 -0.08934,0.8765035 -0.09031,0.8382235 a 0.78762433,0.78762433 0 0 1 -0.763625,0.800915 0.78762433,0.78762433 0 0 1 -0.808777,-0.763625 c -0.0031,-0.124158 0.01275,-0.144159 0.02158,-0.245384 -0.143662,0.105178 -0.281267,0.218336 -0.467201,0.333717 a 0.78770308,0.78770308 0 0 1 -0.985442,-0.125632 c -0.06564,-0.06838 -0.05215,-0.164899 -0.111905,-0.237533 -0.0217,0.158952 -0.05697,0.432943 -0.125637,0.771479 -0.03994,0.196996 -0.07606,0.382777 -0.1492,0.579101 -0.03653,0.09815 -0.03084,0.18885 -0.251272,0.400462 -0.02751,0.02645 -0.06313,0.05381 -0.104038,0.08246 -0.04091,0.02866 -0.146748,0.0873 -0.1492,0.08834 -0.0049,0.0022 -0.446678,0.05377 -0.451502,0.05301 -0.0024,-3.79e-4 -0.213555,-0.06562 -0.215939,-0.06674 -0.0024,-0.0011 -0.118379,-0.06813 -0.162933,-0.104037 -0.08911,-0.07182 -0.149043,-0.143138 -0.186495,-0.20023 a 0.78770308,0.78770308 0 0 1 -0.02945,-0.05301 c -0.380095,-0.694111 -0.516908,-1.474871 -0.718435,-2.269308 -0.108354,0.2596787 -0.214957,0.437476 -0.353349,0.751849 -0.02715,0.08274 -0.06441,0.171293 -0.13741,0.278753 -0.08952,0.131779 -0.277668,0.322761 -0.571248,0.371015 -0.293578,0.04826 -0.550045,-0.07747 -0.67529,-0.178628 C 34.592013,10.728363 34.541064,10.63798 34.495437,10.562564 34.33576,10.298568 34.25817,10.167022 34.2795,9.8401611 c 0.0096,0.042731 0.01942,0.086159 0.02945,0.1295617 L 34.29521,9.6870414 c -0.0069,0.054124 -0.01275,0.1035434 -0.0157,0.1491901 C 34.07835,8.9393633 33.98952,8.1851278 33.849612,7.3215552 a 0.78762433,0.78762433 0 0 1 0.645844,-0.8990776 0.78762433,0.78762433 0 0 1 0.904966,0.645844 c 0.05164,0.3186785 0.103704,0.5756714 0.147218,0.859817 0.04404,-0.060125 0.03987,-0.1097017 0.08834,-0.1688245 -0.0045,-0.0091 0.132583,-0.2224951 0.327832,-0.4377603 0.05578,-0.061504 0.115083,-0.1340347 0.253236,-0.2159342 0.138154,-0.081904 0.442057,-0.1957766 0.755775,-0.074598 0.281673,0.1088032 0.380145,0.3176572 0.445613,0.4672063 -0.0069,-0.3229043 -0.03312,-0.6016714 -0.0157,-0.9049667 a 0.78770308,0.78770308 0 0 1 0.675286,-0.7341808 0.78770308,0.78770308 0 0 1 0.121714,-0.00981 z m -2.098502,4.5091295 c 0.0061,-0.01874 0.01255,-0.03666 0.01766,-0.05496 l -0.03533,0.09619 c 0.0063,-0.01442 0.01158,-0.02735 0.01766,-0.04123 z m 8.00925,0.63799 a 0.79437562,0.83155922 0 0 1 0.793073,0.832334 0.79437562,0.83155922 0 0 1 -0.793073,0.832335 0.79437562,0.83155922 0 0 1 -0.795036,-0.832335 0.79437562,0.83155922 0 0 1 0.795036,-0.832334 z" />
    <path
       id="path2353"
       style="clip-rule:evenodd;fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#4d425c;stroke-width:0.529167;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:40;stroke-dasharray:none;stroke-opacity:1"
       d="m 40.538948,3.0282389 c -0.29769,-0.00106 -0.546242,0.00198 -0.692981,0.00775 -1.220593,0.048091 -2.826517,0.059946 -3.840075,0.098185 -0.467403,0.017637 -3.048907,-0.2759081 -3.873149,0.7875489 -0.86756,1.1193852 -0.300711,6.2041675 -0.37052,6.9236085 -0.04459,0.4598 -0.08361,2.724973 0.787032,3.65094 0.800154,0.85099 2.004117,0.915907 2.226221,0.936377 0.253382,0.02331 2.369672,-0.0013 2.537829,0.0041 0.0628,0.002 0.263983,0.0058 0.537952,0.01189 0.112572,0.639046 0.553326,1.662435 1.185974,2.082561 0.712347,0.473036 2.394373,0.685862 2.598808,0.58136 0.138939,-0.07104 0.869714,-0.08533 0.869714,-0.161231 -2e-6,-0.01157 -0.55771,-0.31122 -0.736389,-0.402559 -0.370261,-0.189241 -0.585439,-0.582762 -0.86558,-0.869198 -0.107353,-0.109727 -0.09303,-0.735137 -0.07855,-1.148767 0.484033,-0.0035 1.79696,0.03984 2.073258,0.03927 0.657752,-0.0013 2.59079,0.06369 3.570842,-0.828373 1.181997,-1.07594 0.880797,-3.217762 0.863513,-3.505729 -0.02274,-0.378815 0.02597,-2.8787595 -0.0098,-3.4452681 C 47.268006,6.9217821 47.558753,5.5744301 46.590775,4.1315308 45.697864,2.8005592 43.401037,3.0979612 43.218371,3.0871501 42.778082,3.0610985 41.432024,3.0314292 40.538948,3.0282389 Z" />
    <path
       id="rect1625"
       style="fill:#50fa7b;fill-opacity:1;stroke:#0f451d;stroke-width:0.593381;stroke-dasharray:none;stroke-opacity:1;paint-order:normal"
       d="m 50.52517,5.3570989 c -0.643062,0 -1.160653,0.5900216 -1.160653,1.3229166 v 1.0764201 h -1.07642 c -0.732895,0 -1.322916,0.5175908 -1.322916,1.1606533 0,0.643061 0.590021,1.1611691 1.322916,1.1611691 h 1.07642 v 1.076421 c 0,0.732895 0.517591,1.322917 1.160653,1.322917 0.643062,0 1.160653,-0.590022 1.160653,-1.322917 v -1.076421 h 1.076937 c 0.732895,0 1.322916,-0.5181081 1.322916,-1.1611691 0,-0.6430625 -0.590021,-1.1606533 -1.322916,-1.1606533 H 51.685823 V 6.6800155 c 0,-0.732895 -0.517591,-1.3229166 -1.160653,-1.3229166 z" />
    <path
       id="path2678"
       style="fill:#50fa7b;fill-opacity:1;stroke:#0f451d;stroke-width:0.593381;stroke-dasharray:none;stroke-opacity:1;paint-order:normal"
       d="m 57.791691,5.357099 c -0.643062,0 -1.160653,0.5900216 -1.160653,1.3229166 v 1.0764201 h -1.07642 c -0.732895,0 -1.322916,0.5175908 -1.322916,1.1606522 0,0.643062 0.590021,1.1611701 1.322916,1.1611701 h 1.07642 v 1.076421 c 0,0.732895 0.517591,1.322917 1.160653,1.322917 0.643062,0 1.160653,-0.590022 1.160653,-1.322917 v -1.076421 h 1.076937 c 0.732895,0 1.322916,-0.5181081 1.322916,-1.1611701 0,-0.6430614 -0.590021,-1.1606522 -1.322916,-1.1606522 H 58.952344 V 6.6800156 c 0,-0.732895 -0.517591,-1.3229166 -1.160653,-1.3229166 z" />
  </g>
</svg>
```

## File: addons/dialogue_manager/assets/update.svg.import
```
[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://d3baj6rygkb3f"
path="res://.godot/imported/update.svg-f1628866ed4eb2e13e3b81f75443687e.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://addons/dialogue_manager/assets/update.svg"
dest_files=["res://.godot/imported/update.svg-f1628866ed4eb2e13e3b81f75443687e.ctex"]

[params]

compress/mode=0
compress/high_quality=false
compress/lossy_quality=0.7
compress/uastc_level=0
compress/rdo_quality_loss=0.0
compress/hdr_compression=1
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/channel_remap/red=0
process/channel_remap/green=1
process/channel_remap/blue=2
process/channel_remap/alpha=3
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=false
editor/convert_colors_with_editor_theme=false
```

## File: addons/dialogue_manager/compiler/compilation.gd
```
## A single compilation instance of some dialogue.
class_name DMCompilation extends RefCounted


#region Compilation locals


## The current file path
var file_path: String

## A list of file paths that were imported by this file.
var imported_paths: PackedStringArray = []
## A list of state names from "using" clauses.
var using_states: PackedStringArray = []
## A map of titles in this file.
var titles: Dictionary = {}
## The first encountered title in this file.
var first_title: String = ""
## A list of character names in this file.
var character_names: PackedStringArray = []
## A list of any compilation errors.
var errors: Array[Dictionary] = []
## A map of all compiled lines.
var lines: Dictionary = {}
## A flattened and simplified map of compiled lines for storage in a resource.
var data: Dictionary = {}


#endregion

#region External processing


var processor: DMDialogueProcessor = null


#endregion

#region Internal variables


# A list of all [RegEx] references
var regex: DMCompilerRegEx = DMCompilerRegEx.new()
# For parsing condition/mutation expressions
var expression_parser: DMExpressionParser = DMExpressionParser.new()

# A noop for retrieving the next line without conditions.
var _first: Callable = func(_s): return true

# Title jumps are adjusted as they are parsed so any goto lines might need to be adjusted after they are first seen.
var _goto_lines: Dictionary = {}


#endregion

#region Main


## Compile some text.
func compile(text: String, path: String = ".") -> Error:
	file_path = path
	titles = {}
	character_names = []

	text += "\n=> END"

	# Remove any known static IDs for this file
	for key: String in DMCache.known_static_ids.keys():
		if DMCache.known_static_ids.get(key) == file_path:
			DMCache.known_static_ids.erase(key)

	find_imported_titles(text, file_path)
	parse_line_tree(build_line_tree(text.split("\n")))

	# Convert the compiles lines to a Dictionary so they can be stored.
	for id: String in lines:
		var line: DMCompiledLine = lines[id]
		data[id] = line.to_data()

	if errors.size() > 0:
		return ERR_PARSE_ERROR

	return OK


## Inject any imported files
func find_imported_titles(text: String, path: String) -> void:
	# Work out imports
	var known_imports: Dictionary = {}

	# Include the base file path so that we can get around circular dependencies
	known_imports[path] = "."

	var raw_lines: PackedStringArray = text.split("\n")

	for id: int in range(0, raw_lines.size()):
		var line: String = raw_lines[id]

		if not is_import_line(line): continue

		var import_data: Dictionary = extract_import_path_and_name(line)

		if import_data.size() == 0 or not import_data.has("path"): continue

		if known_imports.has(import_data.path):
			add_error(id, 0, DMConstants.ERR_FILE_ALREADY_IMPORTED)
		elif known_imports.values().has(import_data.prefix):
			add_error(id, 0, DMConstants.ERR_DUPLICATE_IMPORT_NAME)
		else:
			# Get titles from other file and map them to the known list of titles.
			var imported_resource: DialogueResource = ResourceLoader.load(import_data.path, "", ResourceLoader.CACHE_MODE_REPLACE)

			# Guard against failed loads -- namely during reimport cascade.
			if imported_resource == null:
				# Might be worth investigating a better constant here.
				add_error(id, 0, DMConstants.ERR_ERRORS_IN_IMPORTED_FILE)
				continue

			var uid: String = ResourceUID.id_to_text(ResourceLoader.get_resource_uid(import_data.path)).replace("uid://", "")
			for title_key: String in imported_resource.titles:
				# Ignore any titles that are already a reference
				if "/" in title_key: continue
				# Create "alias/title" to "uid@id" mappig
				var title_reference: String = "%s/%s" % [import_data.prefix, title_key]
				titles[title_reference] = "%s@%s" % [uid, imported_resource.titles.get(title_key)]

			imported_paths.append(import_data.path)
			known_imports[import_data.path] = import_data.prefix


## Build a tree of parent/child relationships
func build_line_tree(raw_lines: PackedStringArray) -> DMTreeLine:
	var root: DMTreeLine = DMTreeLine.new("")
	var parent_chain: Array[DMTreeLine] = [root]
	var previous_line: DMTreeLine
	var doc_comments: PackedStringArray = []

	# Get list of known autoloads
	var autoload_names: PackedStringArray = get_autoload_names()

	for i: int in range(0, raw_lines.size()):
		var raw_line: String = get_processor()._preprocess_line(raw_lines[i])
		var tree_line: DMTreeLine = DMTreeLine.new(str(i))

		tree_line.line_number = i + 1
		tree_line.type = get_line_type(raw_line)
		tree_line.text = raw_line.strip_edges()

		# Handle any "using" directives.
		if tree_line.type == DMConstants.TYPE_USING:
			var using_match: RegExMatch = regex.USING_REGEX.search(raw_line)
			if "state" in using_match.names:
				var using_state: String = using_match.strings[using_match.names.state].strip_edges()
				if not using_state in autoload_names:
					add_error(tree_line.line_number, 0, DMConstants.ERR_UNKNOWN_USING)
				elif not using_state in using_states:
					using_states.append(using_state)
				continue
		# Ignore import lines because they've already been processed.
		elif is_import_line(raw_line):
			continue

		tree_line.indent = get_indent(raw_line)

		# Attach doc comments
		if raw_line.strip_edges().begins_with("##"):
			doc_comments.append(raw_line.replace("##", "").strip_edges())
		elif tree_line.type == DMConstants.TYPE_DIALOGUE or tree_line.type == DMConstants.TYPE_RESPONSE:
			tree_line.notes = "\n".join(doc_comments)
			doc_comments.clear()

		# Empty lines are only kept so that we can work out groupings of things (eg. randomised
		# lines). Therefore we only need to keep one empty line in a row even if there
		# are multiple. The indent of an empty line is assumed to be the same as the non-empty line
		# following it. That way, grouping calculations should work.
		if tree_line.type in [DMConstants.TYPE_UNKNOWN, DMConstants.TYPE_COMMENT] and raw_lines.size() > i + 1:
			var next_line: String = raw_lines[i + 1]
			if get_line_type(next_line) in [DMConstants.TYPE_UNKNOWN, DMConstants.TYPE_COMMENT]:
				continue
			else:
				tree_line.type = DMConstants.TYPE_UNKNOWN
				tree_line.indent = get_indent(next_line)

		# Nothing should be more than a single indent past its parent.
		if tree_line.indent > parent_chain.size():
			add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_INVALID_INDENTATION)

		# Check for indentation changes
		if tree_line.indent > parent_chain.size() - 1:
			parent_chain.append(previous_line)
		elif tree_line.indent < parent_chain.size() - 1:
			parent_chain.resize(tree_line.indent + 1)

		# Add any titles to the list of known titles
		if tree_line.type == DMConstants.TYPE_TITLE:
			var title: String = tree_line.text.substr(2)
			if title == "":
				add_error(i, 2, DMConstants.ERR_EMPTY_TITLE)
			elif titles.has(title):
				add_error(i + 1, 2, DMConstants.ERR_DUPLICATE_TITLE)
			else:
				titles[title] = tree_line.id
				if first_title == "":
					first_title = tree_line.id

		# Append the current line to the current parent (note: the root is the most basic parent).
		var parent: DMTreeLine = parent_chain[parent_chain.size() - 1]
		tree_line.parent = weakref(parent)
		parent.children.append(tree_line)

		previous_line = tree_line

	return root


#endregion

#region Parsing


func parse_line_tree(root: DMTreeLine, parent: DMCompiledLine = null) -> Array[DMCompiledLine]:
	var compiled_lines: Array[DMCompiledLine] = []

	for i: int in range(0, root.children.size()):
		var tree_line: DMTreeLine = root.children[i]
		var line: DMCompiledLine = DMCompiledLine.new(tree_line.id, tree_line.type)

		match line.type:
			DMConstants.TYPE_UNKNOWN:
				line.next_id = get_next_matching_sibling_id(root.children, i, parent, _first)

			DMConstants.TYPE_TITLE:
				parse_title_line(tree_line, line, root.children, i, parent)

			DMConstants.TYPE_CONDITION:
				parse_condition_line(tree_line, line, root.children, i, parent)

			DMConstants.TYPE_WHILE:
				parse_while_line(tree_line, line, root.children, i, parent)

			DMConstants.TYPE_MATCH:
				parse_match_line(tree_line, line, root.children, i, parent)

			DMConstants.TYPE_WHEN:
				parse_when_line(tree_line, line, root.children, i, parent)

			DMConstants.TYPE_MUTATION:
				parse_mutation_line(tree_line, line, root.children, i, parent)

			DMConstants.TYPE_GOTO:
				# Extract any weighted random calls before parsing dialogue
				if tree_line.text.begins_with("%"):
					parse_random_line(tree_line, line, root.children, i, parent)
				parse_goto_line(tree_line, line, root.children, i, parent)

			DMConstants.TYPE_RESPONSE:
				parse_response_line(tree_line, line, root.children, i, parent)

			DMConstants.TYPE_RANDOM:
				parse_random_line(tree_line, line, root.children, i, parent)

			DMConstants.TYPE_DIALOGUE:
				# Extract any weighted random calls before parsing dialogue
				if tree_line.text.begins_with("%"):
					parse_random_line(tree_line, line, root.children, i, parent)
				parse_dialogue_line(tree_line, line, root.children, i, parent)

		# Main line map is keyed by ID
		lines[line.id] = line

		# Apply any post-processing.
		get_processor()._process_line(line)

		# Returned lines order is preserved so that it can be used for compiling children
		compiled_lines.append(line)

	return compiled_lines


## Parse a title and apply it to the given line
func parse_title_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	var result: Error = OK

	line.text = tree_line.text.substr(tree_line.text.find("~ ") + 2).strip_edges()

	# Titles can't have numbers as the first letter
	if regex.BEGINS_WITH_NUMBER_REGEX.search(line.text):
		result = add_error(tree_line.line_number, 2, DMConstants.ERR_TITLE_BEGINS_WITH_NUMBER)

	# Only import titles are allowed to have "/" in them
	var valid_title: RegExMatch = regex.VALID_TITLE_REGEX.search(line.text.replace("/", ""))
	if not valid_title:
		result = add_error(tree_line.line_number, 2, DMConstants.ERR_TITLE_INVALID_CHARACTERS)

	line.next_id = get_next_matching_sibling_id(siblings, sibling_index, parent, _first)

	## Update the titles reference to point to the actual first line
	titles[line.text] = line.next_id

	## Update any lines that point to this title
	if _goto_lines.has(line.text):
		for goto_line: DMCompiledLine in _goto_lines[line.text]:
			goto_line.next_id = line.next_id

	return result


## Parse a goto and apply it to the given line.
func parse_goto_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	# Work out where this line is jumping to.
	var goto_data: DMResolvedGotoData = DMResolvedGotoData.new(tree_line.text, titles)

	if goto_data.error:
		return add_error(tree_line.line_number, tree_line.indent + 2, goto_data.error)
	if goto_data.next_id or goto_data.expression:
		line.next_id = goto_data.next_id
		line.next_id_expression = goto_data.expression
		add_reference_to_title(goto_data.title, line)

	if goto_data.is_snippet:
		line.is_snippet = true
		line.next_id_after = get_next_matching_sibling_id(siblings, sibling_index, parent, _first)

	return OK


## Parse a condition line and apply to the given line
func parse_condition_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	# Work out the next IDs before parsing the condition line itself so that the last
	# child can inherit from the chain.

	# Find the next conditional sibling that is part of this grouping (if there is one).
	for next_sibling: DMTreeLine in siblings.slice(sibling_index + 1):
		if not next_sibling.type in [DMConstants.TYPE_UNKNOWN, DMConstants.TYPE_CONDITION]:
			break
		elif next_sibling.type == DMConstants.TYPE_CONDITION:
			if next_sibling.text.begins_with("el"):
				line.next_sibling_id = next_sibling.id
				break
			else:
				break

	line.next_id_after = get_next_matching_sibling_id(siblings, sibling_index, parent, func(s: DMTreeLine):
		# The next line that isn't a conditional or is a new "if"
		return s.type != DMConstants.TYPE_CONDITION or s.text.begins_with("if ")
	)
	# Any empty IDs should end the conversation.
	if line.next_id_after == DMConstants.ID_NULL:
		line.next_id_after = parent.next_id_after if parent != null and parent.next_id_after else DMConstants.ID_END

	# Having no nested body is an immediate failure.
	if tree_line.children.size() == 0:
		return add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_INVALID_CONDITION_INDENTATION)

	# Try to parse the conditional expression ("else" has no expression).
	if "if " in tree_line.text:
		var condition: Dictionary = extract_condition(tree_line.text, false, tree_line.indent)
		if condition.has("error"):
			return add_error(tree_line.line_number, condition.index, condition.error)
		else:
			line.expression = condition

	# Parse any nested body lines
	parse_children(tree_line, line)

	return OK


## Parse a while loop and apply it to the given line.
func parse_while_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	line.next_id_after = get_next_matching_sibling_id(siblings, sibling_index, parent, _first)

	# Parse the while condition
	var condition: Dictionary = extract_condition(tree_line.text, false, tree_line.indent)
	if condition.has("error"):
		return add_error(tree_line.line_number, condition.index, condition.error)
	else:
		line.expression = condition

	# Parse the nested body (it should take care of looping back to this line when it finishes)
	parse_children(tree_line, line)

	return OK


func parse_match_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	var result: Error = OK

	# The next line after is the next sibling
	line.next_id_after = get_next_matching_sibling_id(siblings, sibling_index, parent, _first)

	# Extract the condition to match to
	var condition: Dictionary = extract_condition(tree_line.text, false, tree_line.indent)
	if condition.has("error"):
		result = add_error(tree_line.line_number, condition.index, condition.error)
	else:
		line.expression = condition

	# Match statements should have children
	if tree_line.children.size() == 0:
		result = add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_INVALID_CONDITION_INDENTATION)

	# Check that all children are when or else.
	for child: DMTreeLine in tree_line.children:
		if child.type == DMConstants.TYPE_WHEN: continue
		if child.type == DMConstants.TYPE_UNKNOWN: continue
		if child.type == DMConstants.TYPE_CONDITION and child.text.begins_with("else"): continue

		result = add_error(child.line_number, child.indent, DMConstants.ERR_EXPECTED_WHEN_OR_ELSE)

	# Each child should be a "when" or "else". We don't need those lines themselves, just their
	# condition and the line they point to if the conditions passes.
	var children: Array[DMCompiledLine] = parse_children(tree_line, line)
	for child: DMCompiledLine in children:
		# "when" cases
		if child.type == DMConstants.TYPE_WHEN:
			line.siblings.append({
				condition = child.expression,
				next_id = child.next_id
			})
		# "else" case
		elif child.type == DMConstants.TYPE_CONDITION:
			if line.siblings.any(func(s): return s.has("is_else")):
				result = add_error(child.line_number, child.indent, DMConstants.ERR_ONLY_ONE_ELSE_ALLOWED)
			else:
				line.siblings.append({
					next_id = child.next_id,
					is_else = true
				})
		# Remove the line from the list of all lines because we don't need it any more.
		lines.erase(child.id)

	return result


func parse_when_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	var result: Error = OK

	# This when line should be found inside a match line
	if parent.type != DMConstants.TYPE_MATCH:
		result = add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_WHEN_MUST_BELONG_TO_MATCH)

	# When lines should have children
	if tree_line.children.size() == 0:
		result = add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_INVALID_CONDITION_INDENTATION)

	# The next line after a when is the same as its parent match line
	line.next_id_after = parent.next_id_after

	# Extract the condition to match to
	var condition: Dictionary = extract_condition(tree_line.text, false, tree_line.indent)
	if condition.has("error"):
		result = add_error(tree_line.line_number, condition.index, condition.error)
	else:
		line.expression = condition

	parse_children(tree_line, line)

	return result


## Parse a mutation line and apply it to the given line
func parse_mutation_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	var mutation: Dictionary = extract_mutation(tree_line.text)
	if mutation.has("error"):
		return add_error(tree_line.line_number, mutation.index, mutation.error)
	else:
		line.expression = mutation

	line.next_id = get_next_matching_sibling_id(siblings, sibling_index, parent, _first)

	return OK


## Parse a response and apply it to the given line.
func parse_response_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	var result: Error = OK

	# Remove the "- "
	tree_line.text = tree_line.text.substr(2)

	# Attach any doc comments.
	line.notes = tree_line.notes

	# Extract the static line ID
	var static_line_id: String = extract_static_line_id(tree_line.text)
	if static_line_id:
		if DMCache.known_static_ids.has(static_line_id):
			result = add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_DUPLICATE_ID)
		else:
			DMCache.known_static_ids[static_line_id] = file_path
		tree_line.text = tree_line.text.replace("[ID:%s]" % [static_line_id], "")
		line.translation_key = static_line_id

	# Handle conditional responses and remove them from the prompt text.
	if " [if " in tree_line.text:
		var condition: Dictionary = extract_condition(tree_line.text, true, tree_line.indent)
		if condition.has("error"):
			result = add_error(tree_line.line_number, condition.index, condition.error)
		else:
			line.expression = condition
			# Extract just the raw condition text
			var found: RegExMatch = regex.WRAPPED_CONDITION_REGEX.search(tree_line.text)
			line.expression_text = found.strings[found.names.expression]

			tree_line.text = regex.WRAPPED_CONDITION_REGEX.sub(tree_line.text, "").strip_edges()

	# Find the original response in this group of responses.
	var original_response: DMTreeLine = tree_line
	for i: int in range(sibling_index - 1, -1, -1):
		if siblings[i].type == DMConstants.TYPE_RESPONSE:
			original_response = siblings[i]
		elif siblings[i].type != DMConstants.TYPE_UNKNOWN:
			break

	# If it's the original response then set up an original line.
	if original_response == tree_line:
		line.next_id_after = get_next_matching_sibling_id(siblings, sibling_index, parent, (func(s: DMTreeLine):
			# The next line that isn't a response.
			return not s.type in [DMConstants.TYPE_RESPONSE, DMConstants.TYPE_UNKNOWN]
		), true)
		line.responses = [line.id]
		# If this line has children then the next ID is the first child.
		if tree_line.children.size() > 0:
			parse_children(tree_line, line)
		# Otherwise use the same ID for after the random group.
		else:
			line.next_id = line.next_id_after
	# Otherwise let the original line know about it.
	else:
		var original_line: DMCompiledLine = lines[original_response.id]
		line.next_id_after = original_line.next_id_after
		line.siblings = original_line.siblings
		original_line.responses.append(line.id)
		# If this line has children then the next ID is the first child.
		if tree_line.children.size() > 0:
			parse_children(tree_line, line)
		# Otherwise use the original line's next ID after.
		else:
			line.next_id = original_line.next_id_after

	parse_character_and_dialogue(tree_line, line, siblings, sibling_index, parent)

	return OK


## Parse a randomised line
func parse_random_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	# Find the weight
	var weight: float = 1
	var found: RegExMatch = regex.WEIGHTED_RANDOM_SIBLINGS_REGEX.search(tree_line.text + " ")
	var condition: Dictionary = {}
	if found:
		if found.names.has("weight"):
			weight = found.strings[found.names.weight].to_float()
		if found.names.has("condition"):
			condition = extract_condition(tree_line.text, true, tree_line.indent)

	# Find the original random sibling. It will be the jump off point.
	var original_sibling: DMTreeLine = tree_line
	for i: int in range(sibling_index - 1, -1, -1):
		if siblings[i] and siblings[i].is_random:
			original_sibling = siblings[i]
		else:
			break

	var weighted_sibling: Dictionary = { weight = weight, id = line.id, condition = condition }

	# If it's the original sibling then set up an original line.
	if original_sibling == tree_line:
		line.next_id_after = get_next_matching_sibling_id(siblings, sibling_index, parent, (func(s: DMTreeLine):
			# The next line that isn't a randomised line.
			# NOTE: DMTreeLine.is_random won't be set at this point so we need to check for the "%" prefix.
			return not s.text.begins_with("%")
		), true)
		line.siblings = [weighted_sibling]
		# If this line has children then the next ID is the first child.
		if tree_line.children.size() > 0:
			parse_children(tree_line, line)
		# Otherwise use the same ID for after the random group.
		else:
			line.next_id = line.next_id_after

	# Otherwise let the original line know about it.
	else:
		var original_line: DMCompiledLine = lines[original_sibling.id]
		line.next_id_after = original_line.next_id_after
		line.siblings = original_line.siblings
		original_line.siblings.append(weighted_sibling)
		# If this line has children then the next ID is the first child.
		if tree_line.children.size() > 0:
			parse_children(tree_line, line)
		# Otherwise use the original line's next ID after.
		else:
			line.next_id = original_line.next_id_after

	# Remove the randomise syntax from the line.
	tree_line.text = regex.WEIGHTED_RANDOM_SIBLINGS_REGEX.sub(tree_line.text, "")
	tree_line.is_random = true

	return OK


## Parse some dialogue and apply it to the given line.
func parse_dialogue_line(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	var result: Error = OK

	# Remove escape character
	if tree_line.text.begins_with("\\using"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\if"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\elif"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\else"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\while"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\match"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\when"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\do"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\set"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\-"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\~"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\=>"): tree_line.text = tree_line.text.substr(1)
	if tree_line.text.begins_with("\\%"): tree_line.text = tree_line.text.substr(1)

	# Append any further dialogue
	for i: int in range(0, tree_line.children.size()):
		var child: DMTreeLine = tree_line.children[i]
		if child.type == DMConstants.TYPE_DIALOGUE:
			# Nested dialogue lines cannot have further nested dialogue.
			if child.children.size() > 0:
				add_error(child.children[0].line_number, child.children[0].indent, DMConstants.ERR_INVALID_INDENTATION)
			# Mark this as a dialogue child of another dialogue line.
			child.is_nested_dialogue = true
			var child_line: DMCompiledLine = DMCompiledLine.new("", DMConstants.TYPE_DIALOGUE)
			parse_character_and_dialogue(child, child_line, [], 0, parent)
			var child_static_line_id: String = extract_static_line_id(child.text)
			if child_line.character != "" or child_static_line_id != "":
				add_error(child.line_number, child.indent, DMConstants.ERR_UNEXPECTED_SYNTAX_ON_NESTED_DIALOGUE_LINE)
			# Check that only the last child (or none) has a jump reference
			if i < tree_line.children.size() - 1 and " =>" in child.text:
				add_error(child.line_number, child.indent, DMConstants.ERR_NESTED_DIALOGUE_INVALID_JUMP)
			if i == 0 and " =>" in tree_line.text:
				add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_NESTED_DIALOGUE_INVALID_JUMP)

			tree_line.text += "\n" + child.text
		elif child.type == DMConstants.TYPE_UNKNOWN:
			tree_line.text += "\n"
		else:
			result = add_error(child.line_number, child.indent, DMConstants.ERR_INVALID_INDENTATION)

	# Extract the static line ID
	var static_line_id: String = extract_static_line_id(tree_line.text)
	if static_line_id:
		if DMCache.known_static_ids.has(static_line_id):
			result = add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_DUPLICATE_ID)
		else:
			DMCache.known_static_ids[static_line_id] = file_path

		tree_line.text = tree_line.text.replace(" [ID:", "[ID:").replace("[ID:%s]" % [static_line_id], "")
		line.translation_key = static_line_id

	# Check for simultaneous lines
	if tree_line.text.begins_with("| "):
		# Jumps are only allowed on the origin line.
		if " =>" in tree_line.text:
			result = add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_GOTO_NOT_ALLOWED_ON_CONCURRECT_LINES)
		# Check for a valid previous line.
		tree_line.text = tree_line.text.substr(2)
		var previous_sibling: DMTreeLine = siblings[sibling_index - 1]
		if previous_sibling.type != DMConstants.TYPE_DIALOGUE:
			result = add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_CONCURRENT_LINE_WITHOUT_ORIGIN)
		else:
			# Because the previous line's concurrent_lines array is the same as
			# any line before that this doesn't need to check any higher up.
			var previous_line: DMCompiledLine = lines[previous_sibling.id]
			previous_line.concurrent_lines.append(line.id)
			line.concurrent_lines = previous_line.concurrent_lines

	parse_character_and_dialogue(tree_line, line, siblings, sibling_index, parent)

	# Check for any inline expression errors
	var resolved_line_data: DMResolvedLineData = DMResolvedLineData.new("")
	var bbcodes: Array[Dictionary] = resolved_line_data.find_bbcode_positions_in_string(tree_line.text, true, true)
	for bbcode: Dictionary in bbcodes:
		var tag: String = bbcode.code
		var code: String = bbcode.raw_args
		if tag.begins_with("$>") or tag.begins_with("do") or tag.begins_with("set") or tag.begins_with("if"):
			var expression: Array = expression_parser.tokenise(code, DMConstants.TYPE_MUTATION, bbcode.start + bbcode.code.length())
			if expression.size() == 0:
				add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_INVALID_EXPRESSION)
			elif expression[0].type == DMConstants.TYPE_ERROR:
				add_error(tree_line.line_number, tree_line.indent + expression[0].i, expression[0].value)

	# If the line isn't part of a weighted random group then make it point to the next
	# available sibling.
	if line.next_id == DMConstants.ID_NULL and line.siblings.size() == 0:
		line.next_id = get_next_matching_sibling_id(siblings, sibling_index, parent, func(s: DMTreeLine):
			# Ignore concurrent lines.
			return not s.text.begins_with("| ")
		)

	return result


## Parse the character name and dialogue and apply it to a given line.
func parse_character_and_dialogue(tree_line: DMTreeLine, line: DMCompiledLine, siblings: Array[DMTreeLine], sibling_index: int, parent: DMCompiledLine) -> Error:
	var result: Error = OK

	var text: String = tree_line.text

	# Attach any doc comments.
	line.notes = tree_line.notes

	# Extract tags.
	var tag_data: DMResolvedTagData = DMResolvedTagData.new(text)
	line.tags = tag_data.tags
	text = tag_data.text_without_tags

	# Handle inline gotos and remove them from the prompt text.
	if " =><" in text:
		# Because of when the return point needs to be known at runtime we need to split
		# this line into two (otherwise the return point would be dependent on the balloon).
		var goto_data: DMResolvedGotoData = DMResolvedGotoData.new(text, titles)
		if goto_data.error:
			result = add_error(tree_line.line_number, tree_line.indent + 3, goto_data.error)
		if goto_data.next_id or goto_data.expression:
			text = goto_data.text_without_goto
			var goto_line: DMCompiledLine = DMCompiledLine.new(line.id + ".1", DMConstants.TYPE_GOTO)
			goto_line.next_id = goto_data.next_id
			line.next_id_expression = goto_data.expression
			if line.type == DMConstants.TYPE_RESPONSE:
				goto_line.next_id_after = get_next_matching_sibling_id(siblings, sibling_index, parent, func(s: DMTreeLine):
					# If this is coming from a response then we want the next non-response line.
					return s.type != DMConstants.TYPE_RESPONSE
				)
			else:
				goto_line.next_id_after = get_next_matching_sibling_id(siblings, sibling_index, parent, _first)
			goto_line.is_snippet = true
			lines[goto_line.id] = goto_line
			line.next_id = goto_line.id
			add_reference_to_title(goto_data.title, goto_line)
	elif " =>" in text:
		var goto_data: DMResolvedGotoData = DMResolvedGotoData.new(text, titles)
		if goto_data.error:
			result = add_error(tree_line.line_number, tree_line.indent + 2, goto_data.error)
		if goto_data.next_id or goto_data.expression:
			text = goto_data.text_without_goto
			line.next_id = goto_data.next_id
			line.next_id_expression = goto_data.expression
			add_reference_to_title(goto_data.title, line)

	# Handle the dialogue.
	text = text.replace("\\:", "!ESCAPED_COLON!")
	if ": " in text:
		# If a character was given then split it out.
		var bits: Array = Array(text.strip_edges().split(": "))
		line.character = bits.pop_front().strip_edges().replace("!ESCAPED_COLON!", ":")
		if not line.character in character_names:
			character_names.append(line["character"])
		# Character names can have expressions in them.
		line.character_replacements = expression_parser.extract_replacements(line.character, tree_line.indent)
		for replacement: Dictionary in line.character_replacements:
			if replacement.has("error"):
				result = add_error(tree_line.line_number, replacement.index, replacement.error)
		text = ": ".join(bits).replace("!ESCAPED_COLON!", ":")
	else:
		line.character = ""
		text = text.replace("!ESCAPED_COLON!", ":")

	# Extract any expressions in the dialogue.
	line.text_replacements = expression_parser.extract_replacements(text, line.character.length() + 2 + tree_line.indent)
	for replacement: Dictionary in line.text_replacements:
		if replacement.has("error"):
			result = add_error(tree_line.line_number, replacement.index, replacement.error)

	# Replace any newlines.
	text = text.replace("\\n", "\n").strip_edges()

	# If there was no manual translation key then just use the text itself (unless this is a
	# child dialogue below another dialogue line).
	if not tree_line.is_nested_dialogue and line.translation_key == "":
		# Show an error if missing translations is enabled
		if DMSettings.get_setting(DMSettings.MISSING_TRANSLATIONS_ARE_ERRORS, false):
			result = add_error(tree_line.line_number, tree_line.indent, DMConstants.ERR_MISSING_ID)
		else:
			line.translation_key = text

	line.text = text

	return result


#endregion

#region Errors


## Add a compilation error to the list. Returns the given error code.
func add_error(line_number: int, column_number: int, error: int) -> Error:
	errors.append({
		line_number = line_number,
		column_number = column_number,
		error = error
	})
	return error


#endregion

#region Helpers


## Get the names of any autoloads in the project.
func get_autoload_names() -> PackedStringArray:
	var autoloads: PackedStringArray = []

	var project: ConfigFile = ConfigFile.new()
	project.load("res://project.godot")
	if project.has_section("autoload"):
		return Array(project.get_section_keys("autoload")).filter(func(key): return key != "DialogueManager")

	return autoloads


## Check if a line is importing another file.
func is_import_line(text: String) -> bool:
	return text.begins_with("import ") and " as " in text


## Extract the import information from an import line
func extract_import_path_and_name(line: String) -> Dictionary:
	var found: RegExMatch = regex.IMPORT_REGEX.search(line)
	if found:
		return {
			path = found.strings[found.names.path],
			prefix = found.strings[found.names.prefix]
		}
	else:
		return {}


## Load the configured processor (or the default one is none configured).
func get_processor() -> DMDialogueProcessor:
	if processor == null:
		var processor_path: String = DMSettings.get_setting(DMSettings.DIALOGUE_PROCESSOR_PATH, "")
		processor = DMDialogueProcessor.new() if processor_path.is_empty() else load(processor_path).new()
	return processor


## Get the indent of a raw line
func get_indent(raw_line: String) -> int:
	var tabs: RegExMatch = regex.INDENT_REGEX.search(raw_line)
	if tabs:
		return tabs.get_string().length()
	else:
		return 0


## Get the type of a raw line
func get_line_type(raw_line: String) -> String:
	raw_line = raw_line.strip_edges()
	var text: String = regex.WEIGHTED_RANDOM_SIBLINGS_REGEX.sub(raw_line + " ", "").strip_edges()

	if text.begins_with("import "):
		return DMConstants.TYPE_IMPORT

	if text.begins_with("using "):
		return DMConstants.TYPE_USING

	if text.begins_with("#"):
		return DMConstants.TYPE_COMMENT

	if text.begins_with("~ "):
		return DMConstants.TYPE_TITLE

	if text.begins_with("if ") or text.begins_with("elif") or text.begins_with("else"):
		return DMConstants.TYPE_CONDITION

	if text.begins_with("while "):
		return DMConstants.TYPE_WHILE

	if text.begins_with("match "):
		return DMConstants.TYPE_MATCH

	if text.begins_with("when "):
		return DMConstants.TYPE_WHEN

	if text.begins_with("do ") or text.begins_with("do! ") or text.begins_with("set ") or text.begins_with("$> ") or text.begins_with("$>> "):
		return DMConstants.TYPE_MUTATION

	if text.begins_with("=> ") or text.begins_with("=>< "):
		return DMConstants.TYPE_GOTO

	if text.begins_with("- "):
		return DMConstants.TYPE_RESPONSE

	if raw_line.begins_with("%") and text.is_empty():
		return DMConstants.TYPE_RANDOM

	if not text.is_empty():
		return DMConstants.TYPE_DIALOGUE

	return DMConstants.TYPE_UNKNOWN


## Get the next sibling that passes a [Callable] matcher.
func get_next_matching_sibling_id(siblings: Array[DMTreeLine], from_index: int, parent: DMCompiledLine, matcher: Callable, with_empty_lines: bool = false) -> String:
	for i: int in range(from_index + 1, siblings.size()):
		var next_sibling: DMTreeLine = siblings[i]

		if not with_empty_lines:
			# Ignore empty lines
			if not next_sibling or next_sibling.type == DMConstants.TYPE_UNKNOWN:
				continue

		if matcher.call(next_sibling):
			return next_sibling.id

	# If no next ID can be found then check the parent for where to go next.
	if parent != null:
		return parent.id if parent.type == DMConstants.TYPE_WHILE else parent.next_id_after

	return DMConstants.ID_NULL


## Extract a static line ID from some text.
func extract_static_line_id(text: String) -> String:
		# Find a static translation key, eg. [ID:something]
	var found: RegExMatch = regex.STATIC_LINE_ID_REGEX.search(text)
	if found:
		return found.strings[found.names.id]
	else:
		return ""


## Extract a condition (or inline condition) from some text.
func extract_condition(text: String, is_wrapped: bool, index: int) -> Dictionary:
	var regex: RegEx = regex.WRAPPED_CONDITION_REGEX if is_wrapped else regex.CONDITION_REGEX
	var found: RegExMatch = regex.search(text)

	if found == null:
		return {
			index = 0,
			error = DMConstants.ERR_INCOMPLETE_EXPRESSION
		}

	var raw_condition: String = found.strings[found.names.expression]
	if raw_condition.ends_with(":"):
		raw_condition = raw_condition.substr(0, raw_condition.length() - 1)

	var expression: Array = expression_parser.tokenise(raw_condition, DMConstants.TYPE_CONDITION, index + found.get_start("expression"))

	if expression.size() == 0:
		return {
			index = index + found.get_start("expression"),
			error = DMConstants.ERR_INCOMPLETE_EXPRESSION
		}
	elif expression[0].type == DMConstants.TYPE_ERROR:
		return {
			index = expression[0].i,
			error = expression[0].value
		}
	else:
		return {
			expression = expression
		}


## Extract a mutation from some text.
func extract_mutation(text: String) -> Dictionary:
	var found: RegExMatch = regex.MUTATION_REGEX.search(text)

	if not found:
		return {
			index = 0,
			error = DMConstants.ERR_INCOMPLETE_EXPRESSION
		}

	if found.names.has("expression"):
		var expression: Array = expression_parser.tokenise(found.strings[found.names.expression], DMConstants.TYPE_MUTATION, found.get_start("expression"))
		if expression.size() == 0:
			return {
				index = found.get_start("expression"),
				error = DMConstants.ERR_INCOMPLETE_EXPRESSION
			}
		elif expression[0].type == DMConstants.TYPE_ERROR:
			return {
				index = expression[0].i,
				error = expression[0].value
			}
		else:
			return {
				expression = expression,
				is_blocking = not "!" in found.strings[found.names.keyword] and found.strings[found.names.keyword] != "$>>"
			}

	else:
		return {
			index = found.get_start(),
			error = DMConstants.ERR_INCOMPLETE_EXPRESSION
		}


## Keep track of lines referencing titles because their own next_id might not have been resolved yet.
func add_reference_to_title(title: String, line: DMCompiledLine) -> void:
	if title in [DMConstants.ID_END, DMConstants.ID_END_CONVERSATION, DMConstants.ID_NULL]: return

	if not _goto_lines.has(title):
		_goto_lines[title] = []
	_goto_lines[title].append(line)


## Parse a nested block of child lines
func parse_children(tree_line: DMTreeLine, line: DMCompiledLine) -> Array[DMCompiledLine]:
	var children = parse_line_tree(tree_line, line)
	if children.size() > 0:
		line.next_id = children.front().id
		# The last child should jump to the next line after its parent condition group
		var last_child: DMCompiledLine = children.back()
		if last_child.next_id == DMConstants.ID_NULL:
			last_child.next_id = line.next_id_after
			if last_child.siblings.size() > 0:
				for sibling: Dictionary in last_child.siblings:
					lines.get(sibling.id).next_id = last_child.next_id

	return children


#endregion
```

## File: addons/dialogue_manager/compiler/compilation.gd.uid
```
uid://dsgpnyqg6cprg
```

## File: addons/dialogue_manager/compiler/compiled_line.gd
```
## A compiled line of dialogue.
class_name DMCompiledLine extends RefCounted


## The ID of the line
var id: String
## The translation key (or static line ID).
var translation_key: String = ""
## The type of line.
var type: String = ""
## The character name.
var character: String = ""
## Any interpolation expressions for the character name.
var character_replacements: Array[Dictionary] = []
## The text of the line.
var text: String = ""
## Any interpolation expressions for the text.
var text_replacements: Array[Dictionary] = []
## Any response siblings associated with this line.
var responses: PackedStringArray = []
## Any randomise or case siblings for this line.
var siblings: Array[Dictionary] = []
## Any lines said simultaneously.
var concurrent_lines: PackedStringArray = []
## Any tags on this line.
var tags: PackedStringArray = []
## The condition or mutation expression for this line.
var expression: Dictionary = {}
## The express as the raw text that was given.
var expression_text: String = ""
## The next sequential line to go to after this line.
var next_id: String = ""
## The next line to go to after this line if it is unknown and compile time.
var next_id_expression: Array[Dictionary] = []
## Whether this jump line should return after the jump target sequence has ended.
var is_snippet: bool = false
## The ID of the next sibling line.
var next_sibling_id: String = ""
## The ID after this line if it belongs to a block (eg. conditions).
var next_id_after: String = ""
## Any doc comments attached to this line.
var notes: String = ""


#region Hooks


func _init(initial_id: String, initial_type: String) -> void:
	id = initial_id
	type = initial_type


func _to_string() -> String:
	var s: Array = [
		"[%s]" % [type],
		"%s:" % [character] if character != "" else null,
		text if text != "" else null,
		expression if expression.size() > 0 else null,
		"[%s]" % [",".join(tags)] if tags.size() > 0 else null,
		str(siblings) if siblings.size() > 0 else null,
		str(responses) if responses.size() > 0 else null,
		"=> END" if "end" in next_id else "=> %s" % [next_id],
		"(~> %s)" % [next_sibling_id] if next_sibling_id != "" else null,
		"(==> %s)" % [next_id_after] if next_id_after != "" else null,
	].filter(func(item): return item != null)

	return " ".join(s)


#endregion

#region Helpers


## Express this line as a [Dictionary] that can be stored in a resource.
func to_data() -> Dictionary:
	var d: Dictionary = {
		id = id,
		type = type,
		next_id = next_id
	}

	if next_id_expression.size() > 0:
		d.next_id_expression = next_id_expression

	match type:
		DMConstants.TYPE_CONDITION:
			d.condition = expression
			if not next_sibling_id.is_empty():
				d.next_sibling_id = next_sibling_id
			d.next_id_after = next_id_after

		DMConstants.TYPE_WHILE:
			d.condition = expression
			d.next_id_after = next_id_after

		DMConstants.TYPE_MATCH:
			d.condition = expression
			d.next_id_after = next_id_after
			d.cases = siblings

		DMConstants.TYPE_MUTATION:
			d.mutation = expression

		DMConstants.TYPE_GOTO:
			d.is_snippet = is_snippet
			d.next_id_after = next_id_after
			if not siblings.is_empty():
				d.siblings = siblings

		DMConstants.TYPE_RANDOM:
			d.siblings = siblings

		DMConstants.TYPE_RESPONSE:
			d.text = text

			if not responses.is_empty():
				d.responses = responses

			if translation_key != text:
				d.translation_key = translation_key
			if not expression.is_empty():
				d.condition = expression
			if not character.is_empty():
				d.character = character
			if not character_replacements.is_empty():
				d.character_replacements = character_replacements
			if not text_replacements.is_empty():
				d.text_replacements = text_replacements
			if not tags.is_empty():
				d.tags = tags
			if not notes.is_empty():
				d.notes = notes
			if not expression_text.is_empty():
				d.condition_as_text = expression_text

		DMConstants.TYPE_DIALOGUE:
			d.text = text

			if translation_key != text:
				d.translation_key = translation_key

			if not character.is_empty():
				d.character = character
			if not character_replacements.is_empty():
				d.character_replacements = character_replacements
			if not text_replacements.is_empty():
				d.text_replacements = text_replacements
			if not tags.is_empty():
				d.tags = tags
			if not notes.is_empty():
				d.notes = notes
			if not siblings.is_empty():
				d.siblings = siblings
			if not concurrent_lines.is_empty():
				d.concurrent_lines = concurrent_lines

	return d


#endregion
```

## File: addons/dialogue_manager/compiler/compiled_line.gd.uid
```
uid://dg8j5hudp4210
```

## File: addons/dialogue_manager/compiler/compiler_regex.gd
```
## A collection of [RegEx] for use by the [DMCompiler].
class_name DMCompilerRegEx extends RefCounted


var IMPORT_REGEX: RegEx = RegEx.create_from_string("import \"(?<path>[^\"]+)\" as (?<prefix>[a-zA-Z_\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}][a-zA-Z_0-9\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}]+)")
var USING_REGEX: RegEx = RegEx.create_from_string("^using (?<state>.*)$")
var INDENT_REGEX: RegEx = RegEx.create_from_string("^\\t+")
var VALID_TITLE_REGEX: RegEx = RegEx.create_from_string("^[a-zA-Z_0-9\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}][a-zA-Z_0-9\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}]*$")
var BEGINS_WITH_NUMBER_REGEX: RegEx = RegEx.create_from_string("^\\d")
var CONDITION_REGEX: RegEx = RegEx.create_from_string("(if|elif|while|else if|match|when) (?<expression>.*)\\:?")
var WRAPPED_CONDITION_REGEX: RegEx = RegEx.create_from_string("\\[if (?<expression>.*)\\]")
var MUTATION_REGEX: RegEx = RegEx.create_from_string("(?<keyword>\\$\\>|\\$\\>\\>|do|do!|set) (?<expression>.*)")
var STATIC_LINE_ID_REGEX: RegEx = RegEx.create_from_string("\\[ID:(?<id>.*?)\\]")
var WEIGHTED_RANDOM_SIBLINGS_REGEX: RegEx = RegEx.create_from_string("^\\%(?<weight>[\\d.]+)?( \\[if (?<condition>.+?)\\])? ")
var GOTO_REGEX: RegEx = RegEx.create_from_string("=><? (?<goto>.*)")

var INLINE_RANDOM_REGEX: RegEx = RegEx.create_from_string("\\[\\[(?<options>.*?)\\]\\]")
var INLINE_CONDITIONALS_REGEX: RegEx = RegEx.create_from_string("\\[if (?<condition>.+?)\\](?<body>.*?)\\[\\/if\\]")

var IMAGE_TAGS_REGEX: RegEx = RegEx.create_from_string("\\[img.*?\\](?<path>.+?)\\[\\/img\\]")

var TAGS_REGEX: RegEx = RegEx.create_from_string("\\[#(?<tags>.*?)\\]")

var REPLACEMENTS_REGEX: RegEx = RegEx.create_from_string("{{(.*?)}}")

var TOKEN_DEFINITIONS: Dictionary = {
	DMConstants.TOKEN_FUNCTION: RegEx.create_from_string("^[a-zA-Z_\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}][a-zA-Z_0-9\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}]*\\("),
	DMConstants.TOKEN_DICTIONARY_REFERENCE: RegEx.create_from_string("^[a-zA-Z_\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}][a-zA-Z_0-9\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}]*\\["),
	DMConstants.TOKEN_PARENS_OPEN: RegEx.create_from_string("^\\("),
	DMConstants.TOKEN_PARENS_CLOSE: RegEx.create_from_string("^\\)"),
	DMConstants.TOKEN_BRACKET_OPEN: RegEx.create_from_string("^\\["),
	DMConstants.TOKEN_BRACKET_CLOSE: RegEx.create_from_string("^\\]"),
	DMConstants.TOKEN_BRACE_OPEN: RegEx.create_from_string("^\\{"),
	DMConstants.TOKEN_BRACE_CLOSE: RegEx.create_from_string("^\\}"),
	DMConstants.TOKEN_COLON: RegEx.create_from_string("^:"),
	DMConstants.TOKEN_COMPARISON: RegEx.create_from_string("^(==|<=|>=|<|>|!=|in )"),
	DMConstants.TOKEN_ASSIGNMENT: RegEx.create_from_string("^(\\+=|\\-=|\\*=|/=|=)"),
	DMConstants.TOKEN_NUMBER: RegEx.create_from_string("^\\-?\\d+(\\.\\d+)?"),
	DMConstants.TOKEN_OPERATOR: RegEx.create_from_string("^(\\+|\\-|\\*|/|%)"),
	DMConstants.TOKEN_COMMA: RegEx.create_from_string("^,"),
	DMConstants.TOKEN_NULL_COALESCE: RegEx.create_from_string("^\\?\\."),
	DMConstants.TOKEN_DOT: RegEx.create_from_string("^\\."),
	DMConstants.TOKEN_STRING: RegEx.create_from_string("^&?(\".*?\"|\'.*?\')"),
	DMConstants.TOKEN_NOT: RegEx.create_from_string("^(not( |$)|!)"),
	DMConstants.TOKEN_AND_OR: RegEx.create_from_string("^(and|or|&&|\\|\\|)( |$)"),
	DMConstants.TOKEN_VARIABLE: RegEx.create_from_string("^[a-zA-Z_\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}][a-zA-Z_0-9\\p{Emoji_Presentation}\\p{Han}\\p{Katakana}\\p{Hiragana}\\p{Cyrillic}]*"),
	DMConstants.TOKEN_COMMENT: RegEx.create_from_string("^#.*"),
	DMConstants.TOKEN_CONDITION: RegEx.create_from_string("^(if|elif|else)"),
	DMConstants.TOKEN_BOOL: RegEx.create_from_string("^(true|false)")
}
```

## File: addons/dialogue_manager/compiler/compiler_regex.gd.uid
```
uid://d3tvcrnicjibp
```

## File: addons/dialogue_manager/compiler/compiler_result.gd
```
## The result of using the [DMCompiler] to compile some dialogue.
class_name DMCompilerResult extends RefCounted


## Any paths that were imported into the compiled dialogue file.
var imported_paths: PackedStringArray = []

## Any "using" directives.
var using_states: PackedStringArray = []

## All titles in the file and the line they point to.
var titles: Dictionary = {}

## The first title in the file.
var first_title: String = ""

## All character names.
var character_names: PackedStringArray = []

## Any compilation errors.
var errors: Array[Dictionary] = []

## A map of all compiled lines.
var lines: Dictionary = {}

## The raw dialogue text.
var raw_text: String = ""
```

## File: addons/dialogue_manager/compiler/compiler_result.gd.uid
```
uid://dmk74tknimqvg
```

## File: addons/dialogue_manager/compiler/compiler.gd
```
## A compiler of Dialogue Manager dialogue.
class_name DMCompiler extends RefCounted


## Compile a dialogue script.
static func compile_string(text: String, path: String) -> DMCompilerResult:
	var compilation: DMCompilation = DMCompilation.new()
	compilation.compile(text, path)

	var result: DMCompilerResult = DMCompilerResult.new()
	result.imported_paths = compilation.imported_paths
	result.using_states = compilation.using_states
	result.character_names = compilation.character_names
	result.titles = compilation.titles
	result.first_title = compilation.first_title
	result.errors = compilation.errors
	result.lines = compilation.data
	result.raw_text = text

	return result


## Get the line type of a string. The returned string will match one of the [code]TYPE_[/code] constants of [DMConstants].
static func get_line_type(text: String) -> String:
	var compilation: DMCompilation = DMCompilation.new()
	return compilation.get_line_type(text)


## Get the static line ID (eg. [code][ID:SOMETHING][/code]) of some text.
static func get_static_line_id(text: String) -> String:
	var compilation: DMCompilation = DMCompilation.new()
	return compilation.extract_static_line_id(text)


## Get the translatable part of a line.
static func extract_translatable_string(text: String) -> String:
	var compilation: DMCompilation = DMCompilation.new()

	var tree_line = DMTreeLine.new("")
	tree_line.text = text
	var line: DMCompiledLine = DMCompiledLine.new("", compilation.get_line_type(text))
	compilation.parse_character_and_dialogue(tree_line, line, [tree_line], 0, null)

	return line.text


## Extract a mutation from a string.
static func extract_mutation(text: String) -> Dictionary:
	var compilation: DMCompilation = DMCompilation.new()
	return compilation.extract_mutation(text)


## Get the known titles in a dialogue script.
static func get_titles_in_text(text: String, path: String) -> Dictionary:
	var compilation: DMCompilation = DMCompilation.new()
	compilation.find_imported_titles(text, path)
	compilation.build_line_tree(text.split("\n"))
	return compilation.titles
```

## File: addons/dialogue_manager/compiler/compiler.gd.uid
```
uid://chtfdmr0cqtp4
```

## File: addons/dialogue_manager/compiler/expression_parser.gd
```
## A class for parsing a condition/mutation expression for use with the [DMCompiler].
class_name DMExpressionParser extends RefCounted


var include_comments: bool = false


# Reference to the common [RegEx] that the parser needs.
var regex: DMCompilerRegEx = DMCompilerRegEx.new()


## Break a string down into an expression.
func tokenise(text: String, line_type: String, index: int) -> Array:
	var tokens: Array[Dictionary] = []
	var limit: int = 0
	while text.strip_edges() != "" and limit < 1000:
		limit += 1
		var found = _find_match(text)
		if found.size() > 0:
			tokens.append({
				index = index,
				type = found.type,
				value = found.value
			})
			index += found.value.length()
			text = found.remaining_text
		elif text.begins_with(" "):
			index += 1
			text = text.substr(1)
		else:
			return _build_token_tree_error([], DMConstants.ERR_INVALID_EXPRESSION, index)

	return _build_token_tree(tokens, line_type, "")[0]


## Extract any expressions from some text
func extract_replacements(text: String, index: int) -> Array[Dictionary]:
	var founds: Array[RegExMatch] = regex.REPLACEMENTS_REGEX.search_all(text)

	if founds == null or founds.size() == 0:
		return []

	var replacements: Array[Dictionary] = []
	for found in founds:
		var replacement: Dictionary = {}
		var value_in_text: String = found.strings[0].substr(0, found.strings[0].length() - 2).substr(2)

		# If there are closing curlie hard-up against the end of a {{...}} block then check for further
		# curlies just outside of the block.
		var text_suffix: String = text.substr(found.get_end(0))
		var expression_suffix: String = ""
		while text_suffix.begins_with("}"):
			expression_suffix += "}"
			text_suffix = text_suffix.substr(1)
		value_in_text += expression_suffix

		var expression: Array = tokenise(value_in_text, DMConstants.TYPE_DIALOGUE, index + found.get_start(1))
		if expression.size() == 0:
			replacement = {
				index = index + found.get_start(1),
				error = DMConstants.ERR_INCOMPLETE_EXPRESSION
			}
		elif expression[0].type == DMConstants.TYPE_ERROR:
			replacement = {
				index = expression[0].i,
				error = expression[0].value
			}
		else:
			replacement = {
				value_in_text = "{{%s}}" % value_in_text,
				expression = expression
			}
		replacements.append(replacement)

	return replacements


#region Helpers


# Create a token that represents an error.
func _build_token_tree_error(tree: Array, error: int, index: int) -> Array:
	tree.insert(0, {
		type = DMConstants.TOKEN_ERROR,
		value = error,
		i = index
	})
	return tree


# Convert a list of tokens into an abstract syntax tree.
func _build_token_tree(tokens: Array[Dictionary], line_type: String, expected_close_token: String) -> Array:
	var tree: Array[Dictionary] = []
	var limit = 0
	while tokens.size() > 0 and limit < 1000:
		limit += 1
		var token = tokens.pop_front()

		var error = _check_next_token(token, tokens, line_type, expected_close_token)
		if error != OK:
			var error_token: Dictionary = tokens[1] if tokens.size() > 1 else token
			return [_build_token_tree_error(tree, error, error_token.index), tokens]

		match token.type:
			DMConstants.TOKEN_COMMENT:
				if include_comments:
					tree.append({
						type = DMConstants.TOKEN_COMMENT,
						value = token.value,
						i = token.index
					})

			DMConstants.TOKEN_FUNCTION:
				var sub_tree = _build_token_tree(tokens, line_type, DMConstants.TOKEN_PARENS_CLOSE)

				if sub_tree[0].size() > 0 and sub_tree[0][0].type == DMConstants.TOKEN_ERROR:
					return [_build_token_tree_error(tree, sub_tree[0][0].value, sub_tree[0][0].i), tokens]

				tree.append({
					type = DMConstants.TOKEN_FUNCTION,
					# Consume the trailing "("
					function = token.value.substr(0, token.value.length() - 1),
					value = _tokens_to_list(sub_tree[0]),
					i = token.index
				})
				tokens = sub_tree[1]

			DMConstants.TOKEN_DICTIONARY_REFERENCE:
				var sub_tree = _build_token_tree(tokens, line_type, DMConstants.TOKEN_BRACKET_CLOSE)

				if sub_tree[0].size() > 0 and sub_tree[0][0].type == DMConstants.TOKEN_ERROR:
					return [_build_token_tree_error(tree, sub_tree[0][0].value, sub_tree[0][0].i), tokens]

				var args = _tokens_to_list(sub_tree[0])
				if args.size() != 1:
					return [_build_token_tree_error(tree, DMConstants.ERR_INVALID_INDEX, token.index), tokens]

				tree.append({
					type = DMConstants.TOKEN_DICTIONARY_REFERENCE,
					# Consume the trailing "["
					variable = token.value.substr(0, token.value.length() - 1),
					value = args[0],
					i = token.index
				})
				tokens = sub_tree[1]

			DMConstants.TOKEN_BRACE_OPEN:
				var sub_tree = _build_token_tree(tokens, line_type, DMConstants.TOKEN_BRACE_CLOSE)

				if sub_tree[0].size() > 0 and sub_tree[0][0].type == DMConstants.TOKEN_ERROR:
					return [_build_token_tree_error(tree, sub_tree[0][0].value, sub_tree[0][0].i), tokens]

				var t = sub_tree[0]
				for i in range(0, t.size() - 2):
					# Convert Lua style dictionaries to string keys
					if t[i].type == DMConstants.TOKEN_VARIABLE and t[i+1].type == DMConstants.TOKEN_ASSIGNMENT:
						t[i].type = DMConstants.TOKEN_STRING
						t[i+1].type = DMConstants.TOKEN_COLON
						t[i+1].erase("value")

				tree.append({
					type = DMConstants.TOKEN_DICTIONARY,
					value = _tokens_to_dictionary(sub_tree[0]),
					i = token.index
				})

				tokens = sub_tree[1]

			DMConstants.TOKEN_BRACKET_OPEN:
				var sub_tree = _build_token_tree(tokens, line_type, DMConstants.TOKEN_BRACKET_CLOSE)

				if sub_tree[0].size() > 0 and sub_tree[0][0].type == DMConstants.TOKEN_ERROR:
					return [_build_token_tree_error(tree, sub_tree[0][0].value, sub_tree[0][0].i), tokens]

				var type = DMConstants.TOKEN_ARRAY
				var value = _tokens_to_list(sub_tree[0])

				# See if this is referencing a nested dictionary value
				if tree.size() > 0:
					var previous_token = tree[tree.size() - 1]
					if previous_token.type in [DMConstants.TOKEN_DICTIONARY_REFERENCE, DMConstants.TOKEN_DICTIONARY_NESTED_REFERENCE]:
						type = DMConstants.TOKEN_DICTIONARY_NESTED_REFERENCE
						value = value[0]

				tree.append({
					type = type,
					value = value,
					i = token.index
				})
				tokens = sub_tree[1]

			DMConstants.TOKEN_PARENS_OPEN:
				var sub_tree = _build_token_tree(tokens, line_type, DMConstants.TOKEN_PARENS_CLOSE)

				if sub_tree[0].size() > 0 and sub_tree[0][0].type == DMConstants.TOKEN_ERROR:
					return [_build_token_tree_error(tree, sub_tree[0][0].value, sub_tree[0][0].i), tokens]

				tree.append({
					type = DMConstants.TOKEN_GROUP,
					value = sub_tree[0],
					i = token.index
				})
				tokens = sub_tree[1]

			DMConstants.TOKEN_PARENS_CLOSE, \
			DMConstants.TOKEN_BRACE_CLOSE, \
			DMConstants.TOKEN_BRACKET_CLOSE:
				if token.type != expected_close_token:
					return [_build_token_tree_error(tree, DMConstants.ERR_UNEXPECTED_CLOSING_BRACKET, token.index), tokens]

				tree.append({
					type = token.type,
					i = token.index
				})

				return [tree, tokens]

			DMConstants.TOKEN_NOT:
				# Double nots negate each other
				if tokens.size() > 0 and tokens.front().type == DMConstants.TOKEN_NOT:
					tokens.pop_front()
				else:
					tree.append({
						type = token.type,
						i = token.index
					})

			DMConstants.TOKEN_COMMA, \
			DMConstants.TOKEN_COLON, \
			DMConstants.TOKEN_DOT, \
			DMConstants.TOKEN_NULL_COALESCE:
				tree.append({
					type = token.type,
					i = token.index
				})

			DMConstants.TOKEN_COMPARISON, \
			DMConstants.TOKEN_ASSIGNMENT, \
			DMConstants.TOKEN_OPERATOR, \
			DMConstants.TOKEN_AND_OR, \
			DMConstants.TOKEN_VARIABLE:
				var value = token.value.strip_edges()
				if value == "&&":
					value = "and"
				elif value == "||":
					value = "or"
				tree.append({
					type = token.type,
					value = value,
					i = token.index
				})

			DMConstants.TOKEN_STRING:
				if token.value.begins_with("&"):
					tree.append({
						type = token.type,
						value = StringName(token.value.substr(2, token.value.length() - 3)),
						i = token.index
					})
				else:
					tree.append({
						type = token.type,
						value = token.value.substr(1, token.value.length() - 2),
						i = token.index
					})

			DMConstants.TOKEN_CONDITION:
				return [_build_token_tree_error(tree, DMConstants.ERR_UNEXPECTED_CONDITION, token.index), token]

			DMConstants.TOKEN_BOOL:
				tree.append({
					type = token.type,
					value = token.value.to_lower() == "true",
					i = token.index
				})

			DMConstants.TOKEN_NUMBER:
				var value = token.value.to_float() if "." in token.value else token.value.to_int()
				# If previous token is a number and this one is a negative number then
				# inject a minus operator token in between them.
				if tree.size() > 0 and token.value.begins_with("-") and tree[tree.size() - 1].type == DMConstants.TOKEN_NUMBER:
					tree.append(({
						type = DMConstants.TOKEN_OPERATOR,
						value = "-",
						i = token.index
					}))
					tree.append({
						type = token.type,
						value = -1 * value,
						i = token.index
					})
				else:
					tree.append({
						type = token.type,
						value = value,
						i = token.index
					})

	if expected_close_token != "":
		var index: int = tokens[0].i if tokens.size() > 0 else 0
		return [_build_token_tree_error(tree, DMConstants.ERR_MISSING_CLOSING_BRACKET, index), tokens]

	return [tree, tokens]


# Check the next token to see if it is valid to follow this one.
func _check_next_token(token: Dictionary, next_tokens: Array[Dictionary], line_type: String, expected_close_token: String) -> Error:
	var next_token: Dictionary = { type = null }
	if next_tokens.size() > 0:
		next_token = next_tokens.front()

	# Guard for assigning in a condition. If the assignment token isn't inside a Lua dictionary
	# then it's an unexpected assignment in a condition line.
	if token.type == DMConstants.TOKEN_ASSIGNMENT and line_type == DMConstants.TYPE_CONDITION and not next_tokens.any(func(t): return t.type == expected_close_token):
		return DMConstants.ERR_UNEXPECTED_ASSIGNMENT

	# Special case for a negative number after this one
	if token.type == DMConstants.TOKEN_NUMBER and next_token.type == DMConstants.TOKEN_NUMBER and next_token.value.begins_with("-"):
		return OK

	var expected_token_types = []
	var unexpected_token_types = []
	match token.type:
		DMConstants.TOKEN_FUNCTION, \
		DMConstants.TOKEN_PARENS_OPEN:
			unexpected_token_types = [
				null,
				DMConstants.TOKEN_COMMA,
				DMConstants.TOKEN_COLON,
				DMConstants.TOKEN_COMPARISON,
				DMConstants.TOKEN_ASSIGNMENT,
				DMConstants.TOKEN_OPERATOR,
				DMConstants.TOKEN_AND_OR,
				DMConstants.TOKEN_DOT
			]

		DMConstants.TOKEN_BRACKET_CLOSE:
			unexpected_token_types = [
				DMConstants.TOKEN_NOT,
				DMConstants.TOKEN_BOOL,
				DMConstants.TOKEN_STRING,
				DMConstants.TOKEN_NUMBER,
				DMConstants.TOKEN_VARIABLE
			]

		DMConstants.TOKEN_BRACE_OPEN:
			expected_token_types = [
				DMConstants.TOKEN_STRING,
				DMConstants.TOKEN_VARIABLE,
				DMConstants.TOKEN_NUMBER,
				DMConstants.TOKEN_BRACE_CLOSE
			]

		DMConstants.TOKEN_PARENS_CLOSE, \
		DMConstants.TOKEN_BRACE_CLOSE:
			unexpected_token_types = [
				DMConstants.TOKEN_NOT,
				DMConstants.TOKEN_ASSIGNMENT,
				DMConstants.TOKEN_BOOL,
				DMConstants.TOKEN_STRING,
				DMConstants.TOKEN_NUMBER,
				DMConstants.TOKEN_VARIABLE
			]

		DMConstants.TOKEN_COMPARISON, \
		DMConstants.TOKEN_OPERATOR, \
		DMConstants.TOKEN_DOT, \
		DMConstants.TOKEN_NULL_COALESCE, \
		DMConstants.TOKEN_NOT, \
		DMConstants.TOKEN_AND_OR, \
		DMConstants.TOKEN_DICTIONARY_REFERENCE:
			unexpected_token_types = [
				null,
				DMConstants.TOKEN_COMMA,
				DMConstants.TOKEN_COLON,
				DMConstants.TOKEN_COMPARISON,
				DMConstants.TOKEN_ASSIGNMENT,
				DMConstants.TOKEN_OPERATOR,
				DMConstants.TOKEN_AND_OR,
				DMConstants.TOKEN_PARENS_CLOSE,
				DMConstants.TOKEN_BRACE_CLOSE,
				DMConstants.TOKEN_BRACKET_CLOSE,
				DMConstants.TOKEN_DOT
			]

		DMConstants.TOKEN_COMMA:
			unexpected_token_types = [
				null,
				DMConstants.TOKEN_COMMA,
				DMConstants.TOKEN_COLON,
				DMConstants.TOKEN_ASSIGNMENT,
				DMConstants.TOKEN_OPERATOR,
				DMConstants.TOKEN_AND_OR,
				DMConstants.TOKEN_PARENS_CLOSE,
				DMConstants.TOKEN_BRACE_CLOSE,
				DMConstants.TOKEN_BRACKET_CLOSE,
				DMConstants.TOKEN_DOT
			]

		DMConstants.TOKEN_COLON:
			unexpected_token_types = [
				DMConstants.TOKEN_COMMA,
				DMConstants.TOKEN_COLON,
				DMConstants.TOKEN_COMPARISON,
				DMConstants.TOKEN_ASSIGNMENT,
				DMConstants.TOKEN_OPERATOR,
				DMConstants.TOKEN_AND_OR,
				DMConstants.TOKEN_PARENS_CLOSE,
				DMConstants.TOKEN_BRACE_CLOSE,
				DMConstants.TOKEN_BRACKET_CLOSE,
				DMConstants.TOKEN_DOT
			]

		DMConstants.TOKEN_BOOL, \
		DMConstants.TOKEN_STRING, \
		DMConstants.TOKEN_NUMBER:
			unexpected_token_types = [
				DMConstants.TOKEN_NOT,
				DMConstants.TOKEN_ASSIGNMENT,
				DMConstants.TOKEN_BOOL,
				DMConstants.TOKEN_STRING,
				DMConstants.TOKEN_NUMBER,
				DMConstants.TOKEN_VARIABLE,
				DMConstants.TOKEN_FUNCTION,
				DMConstants.TOKEN_PARENS_OPEN,
				DMConstants.TOKEN_BRACE_OPEN,
				DMConstants.TOKEN_BRACKET_OPEN
			]

		DMConstants.TOKEN_VARIABLE:
			unexpected_token_types = [
				DMConstants.TOKEN_NOT,
				DMConstants.TOKEN_BOOL,
				DMConstants.TOKEN_STRING,
				DMConstants.TOKEN_NUMBER,
				DMConstants.TOKEN_VARIABLE,
				DMConstants.TOKEN_FUNCTION,
				DMConstants.TOKEN_PARENS_OPEN,
				DMConstants.TOKEN_BRACE_OPEN,
				DMConstants.TOKEN_BRACKET_OPEN
			]

	if (expected_token_types.size() > 0 and not next_token.type in expected_token_types) \
	or (unexpected_token_types.size() > 0 and next_token.type in unexpected_token_types):
		match next_token.type:
			null:
				return DMConstants.ERR_UNEXPECTED_END_OF_EXPRESSION

			DMConstants.TOKEN_FUNCTION:
				return DMConstants.ERR_UNEXPECTED_FUNCTION

			DMConstants.TOKEN_PARENS_OPEN, \
			DMConstants.TOKEN_PARENS_CLOSE:
				return DMConstants.ERR_UNEXPECTED_BRACKET

			DMConstants.TOKEN_COMPARISON, \
			DMConstants.TOKEN_ASSIGNMENT, \
			DMConstants.TOKEN_OPERATOR, \
			DMConstants.TOKEN_NOT, \
			DMConstants.TOKEN_AND_OR:
				return DMConstants.ERR_UNEXPECTED_OPERATOR

			DMConstants.TOKEN_COMMA:
				return DMConstants.ERR_UNEXPECTED_COMMA
			DMConstants.TOKEN_COLON:
				return DMConstants.ERR_UNEXPECTED_COLON
			DMConstants.TOKEN_DOT:
				return DMConstants.ERR_UNEXPECTED_DOT

			DMConstants.TOKEN_BOOL:
				return DMConstants.ERR_UNEXPECTED_BOOLEAN
			DMConstants.TOKEN_STRING:
				return DMConstants.ERR_UNEXPECTED_STRING
			DMConstants.TOKEN_NUMBER:
				return DMConstants.ERR_UNEXPECTED_NUMBER
			DMConstants.TOKEN_VARIABLE:
				return DMConstants.ERR_UNEXPECTED_VARIABLE

		return DMConstants.ERR_INVALID_EXPRESSION

	return OK


# Convert a series of comma separated tokens to an [Array].
func _tokens_to_list(tokens: Array[Dictionary]) -> Array[Array]:
	var list: Array[Array] = []
	var current_item: Array[Dictionary] = []
	for token in tokens:
		if token.type == DMConstants.TOKEN_COMMA:
			list.append(current_item)
			current_item = []
		else:
			current_item.append(token)

	if current_item.size() > 0:
		list.append(current_item)

	return list


# Convert a series of key/value tokens into a [Dictionary]
func _tokens_to_dictionary(tokens: Array[Dictionary]) -> Dictionary:
	var dictionary = {}
	for i in range(0, tokens.size()):
		if tokens[i].type == DMConstants.TOKEN_COLON:
			if tokens.size() == i + 2:
				dictionary[tokens[i - 1]] = tokens[i + 1]
			else:
				dictionary[tokens[i - 1]] = { type = DMConstants.TOKEN_GROUP, value = tokens.slice(i + 1), i = tokens[0].i }

	return dictionary


# Work out what the next token is from a string.
func _find_match(input: String) -> Dictionary:
	for key in regex.TOKEN_DEFINITIONS.keys():
		var regex = regex.TOKEN_DEFINITIONS.get(key)
		var found = regex.search(input)
		if found:
			return {
				type = key,
				remaining_text = input.substr(found.strings[0].length()),
				value = found.strings[0]
			}

	return {}


#endregion
```

## File: addons/dialogue_manager/compiler/expression_parser.gd.uid
```
uid://dbi4hbar8ubwu
```

## File: addons/dialogue_manager/compiler/resolved_goto_data.gd
```
## Data associated with a dialogue jump/goto line.
class_name DMResolvedGotoData extends RefCounted


## The title that was specified
var title: String = ""
## The target line's ID
var next_id: String = ""
## An expression to determine the target line at runtime.
var expression: Array[Dictionary] = []
## The given line text with the jump syntax removed.
var text_without_goto: String = ""
## Whether this is a jump-and-return style jump.
var is_snippet: bool = false
## A parse error if there was one.
var error: int
## The index in the string where
var index: int = 0

# An instance of the compiler [RegEx] list.
var regex: DMCompilerRegEx = DMCompilerRegEx.new()


func _init(text: String, titles: Dictionary) -> void:
	if not "=> " in text and not "=>< " in text: return

	if "=> " in text:
		text_without_goto = text.substr(0, text.find("=> ")).strip_edges()
	elif "=>< " in text:
		is_snippet = true
		text_without_goto = text.substr(0, text.find("=>< ")).strip_edges()

	var found: RegExMatch = regex.GOTO_REGEX.search(text)
	if found == null:
		return

	title = found.strings[found.names.goto].strip_edges()
	index = found.get_start(0)

	if title == "":
		error = DMConstants.ERR_UNKNOWN_TITLE
		return

	# "=> END!" means end the conversation, ignoring any "=><" chains.
	if title == "END!":
		next_id = DMConstants.ID_END_CONVERSATION

	# "=> END" means end the current title (and go back to the previous one if there is one
	# in the stack)
	elif title == "END":
		next_id = DMConstants.ID_END

	elif titles.has(title):
		next_id = titles.get(title)
	elif title.begins_with("{{"):
		var expression_parser: DMExpressionParser = DMExpressionParser.new()
		var title_expression: Array[Dictionary] = expression_parser.extract_replacements(title, 0)
		if title_expression.size() == 0:
			error = DMConstants.ERR_INCOMPLETE_EXPRESSION
		elif title_expression[0].has("error"):
			error = title_expression[0].error
		else:
			expression = title_expression[0].expression
	else:
		next_id = title
		error = DMConstants.ERR_UNKNOWN_TITLE


func _to_string() -> String:
	return "%s =>%s %s (%s)" % [text_without_goto, "<" if is_snippet else "", title, next_id]
```

## File: addons/dialogue_manager/compiler/resolved_goto_data.gd.uid
```
uid://llhl5pt47eoq
```

## File: addons/dialogue_manager/compiler/resolved_line_data.gd
```
## Any data associated with inline dialogue BBCodes.
class_name DMResolvedLineData extends RefCounted

## The line's text
var text: String = ""
## A map of speed changes against where they are found in the text.
var speeds: Dictionary = {}
## A list of any mutations to run and where they are found in the text.
var mutations: Array[Array] = []
## A duration reference for the line. Represented as "auto" or a stringified number.
var time: String = ""


func _init(line: String) -> void:
	text = line
	speeds = {}
	mutations = []
	time = ""

	var bbcodes: Array = []

	# Remove any escaped brackets (ie. "\[")
	var escaped_open_brackets: PackedInt32Array = []
	var escaped_close_brackets: PackedInt32Array = []
	for i in range(0, text.length() - 1):
		if text.substr(i, 2) == "\\[":
			text = text.substr(0, i) + "!" + text.substr(i + 2)
			escaped_open_brackets.append(i)
		elif text.substr(i, 2) == "\\]":
			text = text.substr(0, i) + "!" + text.substr(i + 2)
			escaped_close_brackets.append(i)

	# Extract all of the BB codes so that we know the actual text (we could do this easier with
	# a RichTextLabel but then we'd need to await idle_frame which is annoying)
	var bbcode_positions = find_bbcode_positions_in_string(text)
	var accumulaive_length_offset = 0
	for position in bbcode_positions:
		# Ignore our own markers
		if position.code in ["wait", "speed", "/speed", "$>", "$>>", "do", "do!", "set", "next", "if", "else", "/if"]:
			continue

		bbcodes.append({
			bbcode = position.bbcode,
			start = position.start,
			offset_start = position.start - accumulaive_length_offset
		})
		accumulaive_length_offset += position.bbcode.length()

	for bb in bbcodes:
		text = text.substr(0, bb.offset_start) + text.substr(bb.offset_start + bb.bbcode.length())

	# Now find any dialogue markers
	var next_bbcode_position = find_bbcode_positions_in_string(text, false)
	var limit = 0
	while next_bbcode_position.size() > 0 and limit < 1000:
		limit += 1

		var bbcode = next_bbcode_position[0]
		var index = bbcode.start
		var code = bbcode.code
		var raw_args = bbcode.raw_args
		var args = {}
		if code in ["$>", "$>>", "do", "do!", "set"]:
			args["value"] = DMCompiler.extract_mutation("%s %s" % [code, raw_args])
		else:
			# Could be something like:
			# 	"=1.0"
			# 	" rate=20 level=10"
			if raw_args and raw_args[0] == "=":
				raw_args = "value" + raw_args
			for pair in raw_args.strip_edges().split(" "):
				if "=" in pair:
					var bits = pair.split("=")
					args[bits[0]] = bits[1]

		match code:
			"wait":
				var wait: Dictionary = DMCompiler.extract_mutation("do wait(%s)" % [args.get("value", "null")])
				mutations.append([index, wait])
			"speed":
				speeds[index] = args.get("value").to_float()
			"/speed":
				speeds[index] = 1.0
			"$>", "$>>", "do", "do!", "set":
				mutations.append([index, args.get("value")])
			"next":
				time = args.get("value") if args.has("value") else "0"

		# Find any BB codes that are after this index and remove the length from their start
		var length = bbcode.bbcode.length()
		for bb in bbcodes:
			if bb.offset_start > bbcode.start:
				bb.offset_start -= length
				bb.start -= length

		# Find any escaped brackets after this that need moving
		for i in range(0, escaped_open_brackets.size()):
			if escaped_open_brackets[i] > bbcode.start:
				escaped_open_brackets[i] -= length
		for i in range(0, escaped_close_brackets.size()):
			if escaped_close_brackets[i] > bbcode.start:
				escaped_close_brackets[i] -= length

		text = text.substr(0, index) + text.substr(index + length)
		next_bbcode_position = find_bbcode_positions_in_string(text, false)

	# Put the BB Codes back in
	for bb in bbcodes:
		text = text.insert(bb.start, bb.bbcode)

	# Put the escaped brackets back in
	for index in escaped_open_brackets:
		text = text.left(index) + "[" + text.right(text.length() - index - 1)
	for index in escaped_close_brackets:
		text = text.left(index) + "]" + text.right(text.length() - index - 1)


func find_bbcode_positions_in_string(string: String, find_all: bool = true, include_conditions: bool = false) -> Array[Dictionary]:
	if not "[" in string: return []

	var positions: Array[Dictionary] = []

	var open_brace_count: int = 0
	var start: int = 0
	var bbcode: String = ""
	var code: String = ""
	var is_finished_code: bool = false
	for i in range(0, string.length()):
		if string[i] == "[":
			if open_brace_count == 0:
				start = i
				bbcode = ""
				code = ""
				is_finished_code = false
			open_brace_count += 1

		else:
			if not is_finished_code and (string[i].to_upper() != string[i] or ["/", "!", "$", ">"].has(string[i])):
				code += string[i]
			else:
				is_finished_code = true

		if open_brace_count > 0:
			bbcode += string[i]

		if string[i] == "]":
			open_brace_count -= 1
			if open_brace_count == 0 and (include_conditions or not code in ["if", "else", "/if"]):
				positions.append({
					bbcode = bbcode,
					code = code,
					start = start,
					end = i,
					raw_args = bbcode.substr(code.length() + 1, bbcode.length() - code.length() - 2).strip_edges()
				})

				if not find_all:
					return positions

	return positions
```

## File: addons/dialogue_manager/compiler/resolved_line_data.gd.uid
```
uid://0k6q8kukq0qa
```

## File: addons/dialogue_manager/compiler/resolved_tag_data.gd
```
## Tag data associated with a line of dialogue.
class_name DMResolvedTagData extends RefCounted


## The list of tags.
var tags: PackedStringArray = []
## The line with any tag syntax removed.
var text_without_tags: String = ""

# An instance of the compiler [RegEx].
var regex: DMCompilerRegEx = DMCompilerRegEx.new()


func _init(text: String) -> void:
	var resolved_tags: PackedStringArray = []
	var tag_matches: Array[RegExMatch] = regex.TAGS_REGEX.search_all(text)
	for tag_match in tag_matches:
		text = text.replace(tag_match.get_string(), "")
		var tags = tag_match.get_string().replace("[#", "").replace("]", "").replace(", ", ",").split(",")
		for tag in tags:
			tag = tag.replace("#", "")
			if not tag in resolved_tags:
				resolved_tags.append(tag)

	tags = resolved_tags
	text_without_tags = text
```

## File: addons/dialogue_manager/compiler/resolved_tag_data.gd.uid
```
uid://cqai3ikuilqfq
```

## File: addons/dialogue_manager/compiler/tree_line.gd
```
## An intermediate representation of a dialogue line before it gets compiled.
class_name DMTreeLine extends RefCounted


## The line number where this dialogue was found (after imported files have had their content imported).
var line_number: int = 0
## The parent [DMTreeLine] of this line.
## This is stored as a Weak Reference so that this RefCounted can elegantly free itself.
## Without it being a Weak Reference, this can easily cause a cyclical reference that keeps this resource alive.
var parent: WeakRef
## The ID of this line.
var id: String
## The type of this line (as a [String] defined in [DMConstants].
var type: String = ""
## Is this line part of a randomised group?
var is_random: bool = false
## The indent count for this line.
var indent: int = 0
## The text of this line.
var text: String = ""
## The child [DMTreeLine]s of this line.
var children: Array[DMTreeLine] = []
## Any doc comments attached to this line.
var notes: String = ""
## Is this a dialogue line that is the child of another dialogue line?
var is_nested_dialogue: bool = false


func _init(initial_id: String) -> void:
	id = initial_id


func _to_string() -> String:
	var tabs = []
	tabs.resize(indent)
	tabs.fill("\t")
	tabs = "".join(tabs)

	return tabs.join([tabs + "{\n",
		"\tid: %s\n" % [id],
		"\ttype: %s\n" % [type],
		"\tis_random: %s\n" % ["true" if is_random else "false"],
		"\ttext: %s\n" % [text],
		"\tnotes: %s\n" % [notes],
		"\tchildren: []\n" if children.size() == 0 else "\tchildren: [\n" + ",\n".join(children.map(func(child): return str(child))) + "]\n",
	"}"])
```

## File: addons/dialogue_manager/compiler/tree_line.gd.uid
```
uid://dsu4i84dpif14
```

## File: addons/dialogue_manager/components/editor_property/editor_property_control.gd
```
@tool

extends HBoxContainer


signal pressed()
signal resource_changed(next_resource: DialogueResource)


const ITEM_NEW: int = 100
const ITEM_QUICK_LOAD: int = 200
const ITEM_LOAD: int = 201
const ITEM_EDIT: int = 300
const ITEM_CLEAR: int = 301
const ITEM_FILESYSTEM: int = 400


@onready var button: Button = $ResourceButton
@onready var menu_button: Button = $MenuButton
@onready var menu: PopupMenu = $Menu
@onready var quick_open_dialog: ConfirmationDialog = $QuickOpenDialog
@onready var files_list = $QuickOpenDialog/FilesList
@onready var new_dialog: FileDialog = $NewDialog
@onready var open_dialog: FileDialog = $OpenDialog

var resource: Resource:
	set(next_resource):
		resource = next_resource
		if button:
			button.resource = resource
	get:
		return resource

var is_waiting_for_file: bool = false
var quick_selected_file: String = ""


func _ready() -> void:
	menu_button.icon = get_theme_icon("GuiDropdown", "EditorIcons")


func build_menu() -> void:
	menu.clear()

	menu.add_icon_item(DMPlugin.instance._get_plugin_icon(), "New Dialogue", ITEM_NEW)
	menu.add_separator()
	menu.add_icon_item(get_theme_icon("Load", "EditorIcons"), "Quick Load", ITEM_QUICK_LOAD)
	menu.add_icon_item(get_theme_icon("Load", "EditorIcons"), "Load", ITEM_LOAD)
	if resource:
		menu.add_icon_item(get_theme_icon("Edit", "EditorIcons"), "Edit", ITEM_EDIT)
		menu.add_icon_item(get_theme_icon("Clear", "EditorIcons"), "Clear", ITEM_CLEAR)
		menu.add_separator()
		menu.add_item("Show in FileSystem", ITEM_FILESYSTEM)

	menu.size = Vector2.ZERO


#region Signals


func _on_new_dialog_file_selected(path: String) -> void:
	DMPlugin.instance.main_view.new_file(path)
	is_waiting_for_file = false
	if DMCache.has_file(path):
		resource_changed.emit(load(path))
	else:
		var next_resource: DialogueResource = await DMPlugin.instance.import_plugin.compiled_resource
		next_resource.resource_path = path
		resource_changed.emit(next_resource)


func _on_open_dialog_file_selected(file: String) -> void:
	resource_changed.emit(load(file))


func _on_file_dialog_canceled() -> void:
	is_waiting_for_file = false


func _on_resource_button_pressed() -> void:
	if is_instance_valid(resource):
		EditorInterface.call_deferred("edit_resource", resource)

	elif menu.visible:
		menu.hide()
	else:
		build_menu()
		menu.position = get_viewport().position + Vector2i(
			button.global_position.x + button.size.x - menu.size.x,
			2 + menu_button.global_position.y + button.size.y
		)
		menu.popup()


func _on_resource_button_resource_dropped(next_resource: Resource) -> void:
	resource_changed.emit(next_resource)


func _on_menu_button_pressed() -> void:
	if menu.visible:
		menu.hide()
	else:
		build_menu()
		menu.position = get_viewport().position + Vector2i(
			menu_button.global_position.x + menu_button.size.x - menu.size.x,
			2 + menu_button.global_position.y + menu_button.size.y
		)
		menu.popup()


func _on_menu_id_pressed(id: int) -> void:
	match id:
		ITEM_NEW:
			is_waiting_for_file = true
			new_dialog.popup_centered()

		ITEM_QUICK_LOAD:
			quick_selected_file = ""
			files_list.files = DMCache.get_files()
			if resource:
				files_list.select_file(resource.resource_path)
			quick_open_dialog.popup_centered()
			files_list.focus_filter()

		ITEM_LOAD:
			is_waiting_for_file = true
			open_dialog.popup_centered()

		ITEM_EDIT:
			EditorInterface.call_deferred("edit_resource", resource)

		ITEM_CLEAR:
			resource_changed.emit(null)

		ITEM_FILESYSTEM:
			EditorInterface.get_file_system_dock().navigate_to_path(resource.resource_path)


func _on_files_list_file_double_clicked(file_path: String) -> void:
	resource_changed.emit(load(file_path))
	quick_open_dialog.hide()


func _on_files_list_file_selected(file_path: String) -> void:
	quick_selected_file = file_path


func _on_quick_open_dialog_confirmed() -> void:
	if quick_selected_file != "":
		resource_changed.emit(load(quick_selected_file))


#endregion
```

## File: addons/dialogue_manager/components/editor_property/editor_property_control.gd.uid
```
uid://dooe2pflnqtve
```

## File: addons/dialogue_manager/components/editor_property/editor_property_control.tscn
```
[gd_scene load_steps=4 format=3 uid="uid://ycn6uaj7dsrh"]

[ext_resource type="Script" uid="uid://dooe2pflnqtve" path="res://addons/dialogue_manager/components/editor_property/editor_property_control.gd" id="1_het12"]
[ext_resource type="PackedScene" uid="uid://b16uuqjuof3n5" path="res://addons/dialogue_manager/components/editor_property/resource_button.tscn" id="2_hh3d4"]
[ext_resource type="PackedScene" uid="uid://dnufpcdrreva3" path="res://addons/dialogue_manager/components/files_list.tscn" id="3_l8fp6"]

[node name="PropertyEditorButton" type="HBoxContainer"]
offset_right = 40.0
offset_bottom = 40.0
size_flags_horizontal = 3
theme_override_constants/separation = 0
script = ExtResource("1_het12")

[node name="ResourceButton" parent="." instance=ExtResource("2_hh3d4")]
layout_mode = 2
text = "<empty>"
text_overrun_behavior = 3
clip_text = true

[node name="MenuButton" type="Button" parent="."]
layout_mode = 2

[node name="Menu" type="PopupMenu" parent="."]

[node name="QuickOpenDialog" type="ConfirmationDialog" parent="."]
title = "Find Dialogue Resource"
size = Vector2i(400, 600)
min_size = Vector2i(400, 600)
ok_button_text = "Open"

[node name="FilesList" parent="QuickOpenDialog" instance=ExtResource("3_l8fp6")]

[node name="NewDialog" type="FileDialog" parent="."]
size = Vector2i(900, 750)
min_size = Vector2i(900, 750)
dialog_hide_on_ok = true
filters = PackedStringArray("*.dialogue ; Dialogue")

[node name="OpenDialog" type="FileDialog" parent="."]
title = "Open a File"
size = Vector2i(900, 750)
min_size = Vector2i(900, 750)
ok_button_text = "Open"
dialog_hide_on_ok = true
file_mode = 0
filters = PackedStringArray("*.dialogue ; Dialogue")

[connection signal="pressed" from="ResourceButton" to="." method="_on_resource_button_pressed"]
[connection signal="resource_dropped" from="ResourceButton" to="." method="_on_resource_button_resource_dropped"]
[connection signal="pressed" from="MenuButton" to="." method="_on_menu_button_pressed"]
[connection signal="id_pressed" from="Menu" to="." method="_on_menu_id_pressed"]
[connection signal="confirmed" from="QuickOpenDialog" to="." method="_on_quick_open_dialog_confirmed"]
[connection signal="file_double_clicked" from="QuickOpenDialog/FilesList" to="." method="_on_files_list_file_double_clicked"]
[connection signal="file_selected" from="QuickOpenDialog/FilesList" to="." method="_on_files_list_file_selected"]
[connection signal="canceled" from="NewDialog" to="." method="_on_file_dialog_canceled"]
[connection signal="file_selected" from="NewDialog" to="." method="_on_new_dialog_file_selected"]
[connection signal="canceled" from="OpenDialog" to="." method="_on_file_dialog_canceled"]
[connection signal="file_selected" from="OpenDialog" to="." method="_on_open_dialog_file_selected"]
```

## File: addons/dialogue_manager/components/editor_property/editor_property.gd
```
@tool

class_name DMDialogueEditorProperty extends EditorProperty


const DialoguePropertyEditorControl: PackedScene = preload("./editor_property_control.tscn")


var control = DialoguePropertyEditorControl.instantiate()
var current_value: DialogueResource
var is_updating: bool = false


func _init() -> void:
	add_child(control)

	control.resource = current_value

	control.resource_changed.connect(_on_resource_changed)


func _update_property() -> void:
	var next_value: DialogueResource = get_edited_object()[get_edited_property()]

	# The resource might have been deleted elsewhere so check that it's not in a weird state
	if is_instance_valid(next_value) and not next_value.resource_path.ends_with(".dialogue"):
		emit_changed(get_edited_property(), null)
		return

	if next_value == current_value: return

	is_updating = true
	current_value = next_value
	control.resource = current_value
	is_updating = false


#region Signals


func _on_resource_changed(next_resource: DialogueResource) -> void:
	emit_changed(get_edited_property(), next_resource)


#endregion
```

## File: addons/dialogue_manager/components/editor_property/editor_property.gd.uid
```
uid://nyypeje1a036
```

## File: addons/dialogue_manager/components/editor_property/resource_button.gd
```
@tool
extends Button


signal resource_dropped(next_resource: Resource)


var resource: Resource:
	set(next_resource):
		resource = next_resource
		if resource:
			icon = DMPlugin.instance._get_plugin_icon()
			text = resource.resource_path.get_file().replace(".dialogue", "")
		else:
			icon = null
			text = "<empty>"
	get:
		return resource


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_DRAG_BEGIN:
			var data = get_viewport().gui_get_drag_data()
			if typeof(data) == TYPE_DICTIONARY and data.type == "files" and data.files.size() > 0 and data.files[0].ends_with(".dialogue"):
				add_theme_stylebox_override("normal", get_theme_stylebox("focus", "LineEdit"))
				add_theme_stylebox_override("hover", get_theme_stylebox("focus", "LineEdit"))

		NOTIFICATION_DRAG_END:
			self.resource = resource
			remove_theme_stylebox_override("normal")
			remove_theme_stylebox_override("hover")


func _can_drop_data(at_position: Vector2, data) -> bool:
	if typeof(data) != TYPE_DICTIONARY: return false
	if data.type != "files": return false

	var files: PackedStringArray = Array(data.files).filter(func(f): return f.get_extension() == "dialogue")
	return files.size() > 0


func _drop_data(at_position: Vector2, data) -> void:
	var files: PackedStringArray = Array(data.files).filter(func(f): return f.get_extension() == "dialogue")

	if files.size() == 0: return

	resource_dropped.emit(load(files[0]))
```

## File: addons/dialogue_manager/components/editor_property/resource_button.gd.uid
```
uid://damhqta55t67c
```

## File: addons/dialogue_manager/components/editor_property/resource_button.tscn
```
[gd_scene load_steps=2 format=3 uid="uid://b16uuqjuof3n5"]

[ext_resource type="Script" uid="uid://damhqta55t67c" path="res://addons/dialogue_manager/components/editor_property/resource_button.gd" id="1_7u2i7"]

[node name="ResourceButton" type="Button"]
offset_right = 8.0
offset_bottom = 8.0
size_flags_horizontal = 3
script = ExtResource("1_7u2i7")
```

## File: addons/dialogue_manager/components/code_edit_syntax_highlighter.gd
```
@tool
class_name DMSyntaxHighlighter extends SyntaxHighlighter


var regex: DMCompilerRegEx = DMCompilerRegEx.new()
var compilation: DMCompilation = DMCompilation.new()
var expression_parser = DMExpressionParser.new()

var cache: Dictionary = {}


func _clear_highlighting_cache() -> void:
	cache.clear()


func _get_line_syntax_highlighting(line: int) -> Dictionary:
	expression_parser.include_comments = true

	var colors: Dictionary = {}
	var text_edit: TextEdit = get_text_edit()
	var text: String = text_edit.get_line(line)

	# Prevent an error from popping up while developing
	if not is_instance_valid(text_edit) or text_edit.theme_overrides.is_empty():
		return colors

	# Disable this, as well as the line at the bottom of this function to remove the cache.
	if text in cache:
		return cache[text]

	var theme: Dictionary = text_edit.theme_overrides

	var index: int = 0

	match DMCompiler.get_line_type(text):
		DMConstants.TYPE_USING:
			colors[index] = { color = theme.conditions_color }
			colors[index + "using ".length()] = { color = theme.text_color }

		DMConstants.TYPE_IMPORT:
			colors[index] = { color = theme.conditions_color }
			var import: RegExMatch = regex.IMPORT_REGEX.search(text)
			if import:
				colors[index + import.get_start("path") - 1] = { color = theme.strings_color }
				colors[index + import.get_end("path") + 1] = { color = theme.conditions_color }
				colors[index + import.get_start("prefix")] = { color = theme.text_color }

		DMConstants.TYPE_COMMENT:
			colors[index] = { color = theme.comments_color }

		DMConstants.TYPE_TITLE:
			colors[index] = { color = theme.titles_color }

		DMConstants.TYPE_CONDITION, DMConstants.TYPE_WHILE, DMConstants.TYPE_MATCH, DMConstants.TYPE_WHEN:
			colors[0] = { color = theme.conditions_color }
			index = text.find(" ")
			if index > -1:
				var expression: Array = expression_parser.tokenise(text.substr(index), DMConstants.TYPE_CONDITION, 0)
				if expression.size() == 0:
					colors[index] = { color = theme.critical_color }
				else:
					_highlight_expression(expression, colors, index)

		DMConstants.TYPE_MUTATION:
			colors[0] = { color = theme.mutations_line_color }
			index = text.find(" ")
			var expression: Array = expression_parser.tokenise(text.substr(index), DMConstants.TYPE_MUTATION, 0)
			if expression.size() == 0:
				colors[index] = { color = theme.critical_color }
			else:
				_highlight_expression(expression, colors, index)

		DMConstants.TYPE_GOTO:
			if text.strip_edges().begins_with("%"):
				colors[index] = { color = theme.symbols_color }
				index = text.find(" ")
			_highlight_goto(text, colors, index)

		DMConstants.TYPE_RANDOM:
			colors[index] = { color = theme.symbols_color }

		DMConstants.TYPE_DIALOGUE, DMConstants.TYPE_RESPONSE:
			if text.strip_edges().begins_with("%"):
				colors[index] = { color = theme.symbols_color }
				index = text.find(" ", text.find("%"))
			colors[index] = { color = theme.text_color.lerp(theme.symbols_color, 0.5) }

			var dialogue_text: String = text.substr(index, text.find("=>"))

			# Highlight character name (but ignore ":" within line ID reference)
			var split_index: int = dialogue_text.replace("\\:", "??").find(":")
			if text.substr(split_index - 3, 3) != "[ID":
				colors[index + split_index + 1] = { color = theme.text_color }
			else:
				# If there's no character name then just highlight the text as dialogue.
				colors[index] = { color = theme.text_color }

			# Interpolation
			var replacements: Array[RegExMatch] = regex.REPLACEMENTS_REGEX.search_all(dialogue_text)
			for replacement: RegExMatch in replacements:
				var expression_text: String = replacement.get_string().substr(0, replacement.get_string().length() - 2).substr(2)
				var expression: Array = expression_parser.tokenise(expression_text, DMConstants.TYPE_MUTATION, replacement.get_start())
				var expression_index: int = index + replacement.get_start()
				colors[expression_index] = { color = theme.symbols_color }
				if expression.size() == 0 or expression[0].type == DMConstants.TYPE_ERROR:
					colors[expression_index] = { color = theme.critical_color }
				else:
					_highlight_expression(expression, colors, index + 2)
				colors[expression_index + expression_text.length() + 2] = { color = theme.symbols_color }
				colors[expression_index + expression_text.length() + 4] = { color = theme.text_color }
			# Tags (and inline mutations)
			var resolved_line_data: DMResolvedLineData = DMResolvedLineData.new("")
			var bbcodes: Array[Dictionary] = resolved_line_data.find_bbcode_positions_in_string(dialogue_text, true, true)
			for bbcode: Dictionary in bbcodes:
				var tag: String = bbcode.code
				var code: String = bbcode.raw_args
				if code.begins_with("["):
					colors[index + bbcode.start] = { color = theme.symbols_color }
					colors[index + bbcode.start + 2] = { color = theme.text_color }
					var pipe_cursor: int = code.find("|")
					while pipe_cursor > -1:
						colors[index + bbcode.start + pipe_cursor + 1] = { color = theme.symbols_color }
						colors[index + bbcode.start + pipe_cursor + 2] = { color = theme.text_color }
						pipe_cursor = code.find("|", pipe_cursor + 1)
					colors[index + bbcode.end - 1] = { color = theme.symbols_color }
					colors[index + bbcode.end + 1] = { color = theme.text_color }
				else:
					colors[index + bbcode.start] = { color = theme.symbols_color }
					if tag.begins_with("$>") or tag.begins_with("do") or tag.begins_with("set") or tag.begins_with("if"):
						if tag.begins_with("if"):
							colors[index + bbcode.start + 1] = { color = theme.conditions_color }
						else:
							colors[index + bbcode.start + 1] = { color = theme.mutations_line_color }
						var expression: Array = expression_parser.tokenise(code, DMConstants.TYPE_MUTATION, bbcode.start + bbcode.code.length())
						if expression.size() == 0 or expression[0].type == DMConstants.TYPE_ERROR:
							colors[index + bbcode.start + tag.length() + 1] = { color = theme.critical_color }
						else:
							_highlight_expression(expression, colors, index + 2)
					# else and closing if have no expression
					elif tag.begins_with("else") or tag.begins_with("/if"):
						colors[index + bbcode.start + 1] = { color = theme.conditions_color }
					colors[index + bbcode.end] = { color = theme.symbols_color }
					colors[index + bbcode.end + 1] = { color = theme.text_color }
			# Jumps
			if "=> " in text or "=>< " in text:
				_highlight_goto(text, colors, index)

	# Order the dictionary keys to prevent CodeEdit from having issues
	var ordered_colors: Dictionary = {}
	var ordered_keys: Array = colors.keys()
	ordered_keys.sort()
	for key_index: int in ordered_keys:
		ordered_colors[key_index] = colors[key_index]

	cache[text] = ordered_colors
	return ordered_colors


func _highlight_expression(tokens: Array, colors: Dictionary, index: int) -> int:
	var theme: Dictionary = get_text_edit().theme_overrides
	var last_index: int = index
	for token: Dictionary in tokens:
		last_index = token.i
		match token.type:
			DMConstants.TOKEN_COMMENT:
				colors[index + token.i] = { color = theme.comments_color }

			DMConstants.TOKEN_CONDITION, DMConstants.TOKEN_AND_OR, DMConstants.TOKEN_NOT:
				colors[index + token.i] = { color = theme.conditions_color }

			DMConstants.TOKEN_VARIABLE:
				if token.value in ["true", "false"]:
					colors[index + token.i] = { color = theme.conditions_color }
				else:
					colors[index + token.i] = { color = theme.members_color }

			DMConstants.TOKEN_OPERATOR, DMConstants.TOKEN_COLON, \
			DMConstants.TOKEN_COMMA, DMConstants.TOKEN_DOT, DMConstants.TOKEN_NULL_COALESCE, \
			DMConstants.TOKEN_ASSIGNMENT, DMConstants.TOKEN_COMPARISON:
				if token.get("value", null) == "in":
					colors[index + token.i] = { color = theme.conditions_color }
				else:
					colors[index + token.i] = { color = theme.symbols_color }

			DMConstants.TOKEN_NUMBER:
				colors[index + token.i] = { color = theme.numbers_color }

			DMConstants.TOKEN_STRING:
				colors[index + token.i] = { color = theme.strings_color }

			DMConstants.TOKEN_FUNCTION:
				colors[index + token.i] = { color = theme.mutations_color }
				colors[index + token.i + token.function.length()] = { color = theme.symbols_color }
				for parameter: Array in token.value:
					last_index = _highlight_expression(parameter, colors, index)
			DMConstants.TOKEN_PARENS_CLOSE:
				colors[index + token.i] = { color = theme.symbols_color }

			DMConstants.TOKEN_DICTIONARY_REFERENCE:
				colors[index + token.i] = { color = theme.members_color }
				colors[index + token.i + token.variable.length()] = { color = theme.symbols_color }
				last_index = _highlight_expression(token.value, colors, index)
			DMConstants.TOKEN_ARRAY:
				colors[index + token.i] = { color = theme.symbols_color }
				for item: Array in token.value:
					last_index = _highlight_expression(item, colors, index)
			DMConstants.TOKEN_BRACKET_CLOSE:
				colors[index + token.i] = { color = theme.symbols_color }

			DMConstants.TOKEN_DICTIONARY:
				colors[index + token.i] = { color = theme.symbols_color }
				last_index = _highlight_expression(token.value.keys() + token.value.values(), colors, index)
			DMConstants.TOKEN_BRACE_CLOSE:
				colors[index + token.i] = { color = theme.symbols_color }
				last_index += 1

			DMConstants.TOKEN_GROUP:
				last_index = _highlight_expression(token.value, colors, index)

	return last_index


func _highlight_goto(text: String, colors: Dictionary, index: int) -> int:
	var theme: Dictionary = get_text_edit().theme_overrides
	var goto_data: DMResolvedGotoData = DMResolvedGotoData.new(text, {})
	colors[goto_data.index] = { color = theme.jumps_color }
	if "{{" in text:
		index = text.find("{{", goto_data.index)
		var last_index: int = 0
		if goto_data.error:
			colors[index + 2] = { color = theme.critical_color }
		else:
			last_index = _highlight_expression(goto_data.expression, colors, index)
		index = text.find("}}", index + last_index)
		colors[index] = { color = theme.jumps_color }

	return index
```

## File: addons/dialogue_manager/components/code_edit_syntax_highlighter.gd.uid
```
uid://klpiq4tk3t7a
```

## File: addons/dialogue_manager/components/code_edit.gd
```
@tool
class_name DMCodeEdit extends CodeEdit


signal active_title_change(title: String)
signal error_clicked(line_number: int)
signal external_file_requested(path: String, title: String)


const MUTATION_PREFIXES: PackedStringArray = ["$>", "$>>", "do ", "do! ", "set ", "if ", "elif ", "else if ", "match ", "when "]
const INLINE_MUTATION_PREFIXES: PackedStringArray = ["$> ", "$>> ", "do ", "do! ", "set ", "if ", "elif "]

# A link back to the owner `MainView`
var main_view: Control

# Theme overrides for syntax highlighting, etc
var theme_overrides: Dictionary:
	set(value):
		theme_overrides = value

		syntax_highlighter = DMSyntaxHighlighter.new()

		# General UI
		add_theme_color_override("font_color", theme_overrides.text_color)
		add_theme_color_override("background_color", theme_overrides.background_color)
		add_theme_color_override("current_line_color", theme_overrides.current_line_color)
		add_theme_font_override("font", get_theme_font("source", "EditorFonts"))
		add_theme_font_size_override("font_size", theme_overrides.font_size * theme_overrides.scale)
		font_size = round(theme_overrides.font_size)
	get:
		return theme_overrides

# Any parse errors
var errors: Array:
	set(next_errors):
		errors = next_errors
		for i in range(0, get_line_count()):
			var is_error: bool = false
			for error in errors:
				if error.line_number == i:
					is_error = true
			mark_line_as_error(i, is_error)
		_on_code_edit_caret_changed()
	get:
		return errors

# The last selection (if there was one) so we can remember it for refocusing
var last_selected_text: String

var font_size: int:
	set(value):
		font_size = value
		add_theme_font_size_override("font_size", font_size * theme_overrides.scale)
	get:
		return font_size

var WEIGHTED_RANDOM_PREFIX: RegEx = RegEx.create_from_string("^\\%[\\d.]+\\s")
var STATIC_REGEX: RegEx = RegEx.create_from_string("^static var (?<property>[a-zA-Z_0-9]+)(:\\s?(?<type>[a-zA-Z_0-9]+))?")
var STATIC_CONTENT_REGEX: RegEx = RegEx.create_from_string("static (var|func)")

var compiler_regex: DMCompilerRegEx = DMCompilerRegEx.new()
var _autoloads: Dictionary[String, String] = {}
var _autoload_member_cache: Dictionary[String, Dictionary] = {}


func _ready() -> void:
	# Add error gutter
	add_gutter(0)
	set_gutter_type(0, TextEdit.GUTTER_TYPE_ICON)

	# Add comment delimiter
	if not has_comment_delimiter("#"):
		add_comment_delimiter("#", "", true)

	syntax_highlighter = DMSyntaxHighlighter.new()

	# Keep track of any autoloads
	ProjectSettings.settings_changed.connect(_on_project_settings_changed)
	_on_project_settings_changed()


func _gui_input(event: InputEvent) -> void:
	# Handle shortcuts that come from the editor
	if event is InputEventKey and event.is_pressed():
		var shortcut: String = DMPlugin.get_editor_shortcut(event)
		match shortcut:
			"toggle_comment":
				toggle_comment()
				get_viewport().set_input_as_handled()
			"delete_line":
				delete_current_line()
				get_viewport().set_input_as_handled()
			"move_up":
				move_line(-1)
				get_viewport().set_input_as_handled()
			"move_down":
				move_line(1)
				get_viewport().set_input_as_handled()
			"text_size_increase":
				self.font_size += 1
				get_viewport().set_input_as_handled()
			"text_size_decrease":
				self.font_size -= 1
				get_viewport().set_input_as_handled()
			"text_size_reset":
				self.font_size = theme_overrides.font_size
				get_viewport().set_input_as_handled()
			"make_bold":
				insert_bbcode("[b]", "[/b]")
				get_viewport().set_input_as_handled()
			"make_italic":
				insert_bbcode("[i]", "[/i]")
				get_viewport().set_input_as_handled()

	elif event is InputEventMouse:
		match event.as_text():
			"Ctrl+Mouse Wheel Up", "Command+Mouse Wheel Up":
				self.font_size += 1
				get_viewport().set_input_as_handled()
			"Ctrl+Mouse Wheel Down", "Command+Mouse Wheel Down":
				self.font_size -= 1
				get_viewport().set_input_as_handled()


func _can_drop_data(at_position: Vector2, data) -> bool:
	if typeof(data) != TYPE_DICTIONARY: return false
	if data.type != "files": return false

	var files: PackedStringArray = Array(data.files)
	return files.size() > 0


func _drop_data(at_position: Vector2, data: Variant) -> void:
	var replace_regex: RegEx = RegEx.create_from_string("[^a-zA-Z_0-9]+")

	if typeof(data) == TYPE_STRING: return

	var files: PackedStringArray = Array(data.files)
	for file: String in files:
		# Don't import the file into itself
		if file == main_view.current_file_path: continue

		if file.get_extension() == "dialogue":
			var known_aliases: PackedStringArray = []
			var path: String = file.replace("res://", "").replace(".dialogue", "")
			# Find the first non-import line in the file to add our import
			var lines: PackedStringArray = text.split("\n")
			for i: int in range(0, lines.size()):
				if lines[i].begins_with("import "):
					var found: RegExMatch = compiler_regex.IMPORT_REGEX.search(lines[i])
					if found:
						known_aliases.append(found.strings[found.names.prefix])
				else:
					var alias: String = ""
					var bits: PackedStringArray = replace_regex.sub(path, "|", true).split("|")
					bits.reverse()
					for end: int in range(1, bits.size() + 1):
						alias =  "_".join(bits.slice(0, end))
						if not alias in known_aliases:
							break
					insert_line_at(i, "import \"%s\" as %s\n" % [file, alias])
					set_caret_line(i)
					break
		else:
			var cursor: Vector2 = get_line_column_at_pos(at_position)
			if cursor.x > -1 and cursor.y > -1:
				set_cursor(cursor)
				remove_secondary_carets()
				var resource: Resource = load(file)
				# If the dropped file is an audio stream then assume it's a voice reference
				if is_instance_of(resource, AudioStream):
					var current_voice_regex: RegEx = RegEx.create_from_string("\\[#voice=.+\\]")
					var path: String = ResourceUID.call("path_to_uid", file) if ResourceUID.has_method("path_to_uid") else file
					var line_text: String = get_line(cursor.y)
					var voice_text: String = "[#voice=%s]" % [path]
					if current_voice_regex.search(line_text):
						set_line(cursor.y, current_voice_regex.replace(get_line(cursor.y), voice_text))
					else:
						insert_text(" " + voice_text, cursor.y, line_text.length())
				# Other wise it's just a file reference
				else:
					insert_text("\"%s\"" % file, cursor.y, cursor.x)
	grab_focus()


func _request_code_completion(force: bool) -> void:
	var cursor: Vector2 = get_cursor()
	var current_line: String = get_line(cursor.y)

	_add_jump_completions(current_line, cursor)
	_add_character_name_completions(current_line)
	_add_mutation_completions(current_line, cursor)

	update_code_completion_options(true)
	if get_code_completion_options().size() == 0:
		cancel_code_completion()


func _filter_code_completion_candidates(candidates: Array) -> Array:
	# Not sure why but if this method isn't overridden then all completions are wrapped in quotes.
	return candidates


func _confirm_code_completion(replace: bool) -> void:
	var completion: Dictionary = get_code_completion_option(get_code_completion_selected_index())
	begin_complex_operation()
	# Delete any part of the text that we've already typed
	for i: int in range(0, completion.display_text.length() - completion.insert_text.length()):
		backspace()
	# Insert the whole match
	insert_text_at_caret(completion.display_text)
	end_complex_operation()

	if completion.display_text.ends_with("()"):
		set_cursor(get_cursor() - Vector2.RIGHT)

	# Close the autocomplete menu on the next tick
	call_deferred("cancel_code_completion")


#region Completion Helpers


# Add completions for jump targets (=> and =><).
func _add_jump_completions(current_line: String, cursor: Vector2) -> void:
	if not ("=> " in current_line or "=>< " in current_line): return
	if cursor.x <= current_line.find("=>"): return

	var prompt: String = current_line.split("=>")[1]
	if prompt.begins_with("< "):
		prompt = prompt.substr(2)
	else:
		prompt = prompt.substr(1)

	if "=> " in current_line:
		if _matches_prompt(prompt, "end"):
			add_code_completion_option(CodeEdit.KIND_CLASS, "END", "END".substr(prompt.length()), theme_overrides.text_color, get_theme_icon("Stop", "EditorIcons"))
		if _matches_prompt(prompt, "end!"):
			add_code_completion_option(CodeEdit.KIND_CLASS, "END!", "END!".substr(prompt.length()), theme_overrides.text_color, get_theme_icon("Stop", "EditorIcons"))

	# Get all titles, including those in imports
	for title: String in DMCompiler.get_titles_in_text(text, main_view.current_file_path):
		# Ignore any imported titles that aren't resolved to human readable.
		if title.to_int() > 0:
			continue
		elif "/" in title:
			var bits: PackedStringArray = title.split("/")
			if _matches_prompt(prompt, bits[0]) or _matches_prompt(prompt, bits[1]):
				add_code_completion_option(CodeEdit.KIND_CLASS, title, title.substr(prompt.length()), theme_overrides.text_color, get_theme_icon("CombineLines", "EditorIcons"))
		elif _matches_prompt(prompt, title):
			add_code_completion_option(CodeEdit.KIND_CLASS, title, title.substr(prompt.length()), theme_overrides.text_color, get_theme_icon("ArrowRight", "EditorIcons"))


# Add completions for character names at the start of dialogue lines.
func _add_character_name_completions(current_line: String) -> void:
	# Ignore names on mutation lines
	for prefix: String in MUTATION_PREFIXES:
		if current_line.strip_edges().begins_with(prefix):
			return

	var name_so_far: String = WEIGHTED_RANDOM_PREFIX.sub(current_line.strip_edges(), "")
	if name_so_far == "" or name_so_far[0].to_upper() != name_so_far[0]:
		return

	var names: PackedStringArray = get_character_names(name_so_far)
	for character_name: String in names:
		add_code_completion_option(CodeEdit.KIND_CLASS, character_name + ": ", character_name.substr(name_so_far.length()) + ": ", theme_overrides.text_color, get_theme_icon("Sprite2D", "EditorIcons"))


# Add state/mutation completions.
func _add_mutation_completions(current_line: String, cursor: Vector2) -> void:
	# Check for inline mutation context first (e.g., "Nathan: Hello [$> SomeGlobal.")
	var inline_context: Dictionary = _get_inline_mutation_context(current_line, cursor.x)
	var mutation_expression: String = ""
	var is_inline_mutation: bool = not inline_context.is_empty()
	var is_using_line: bool = false

	if is_inline_mutation:
		mutation_expression = inline_context.get("expression", "")
	else:
		# Match autoloads on full mutation lines (MUTATION_PREFIXES + "using ")
		for prefix in MUTATION_PREFIXES + PackedStringArray(["using "]):
			if current_line.strip_edges().begins_with(prefix) and cursor.x > current_line.find(prefix):
				mutation_expression = current_line.substr(0, cursor.x).strip_edges().substr(3)
				is_using_line = current_line.strip_edges().begins_with("using ")
				break

	if mutation_expression == "" and not is_inline_mutation:
		return

	# Find the last token (the part being typed)
	var possible_prompt: String = mutation_expression.reverse()
	possible_prompt = possible_prompt.substr(0, possible_prompt.find(" "))
	possible_prompt = possible_prompt.substr(0, possible_prompt.find("("))
	possible_prompt = possible_prompt.reverse()
	var segments: PackedStringArray = possible_prompt.split(".")
	var auto_completes: Array[Dictionary] = []

	if segments.size() == 1:
		# Suggest autoloads and state shortcuts
		auto_completes = _get_autoload_completions(segments[0])
	elif not is_using_line:
		if not segments[0] in _autoloads.keys():
			# See if the first segment is a property of a shortcut
			var shortcut: String = _find_shortcut_with_member(segments[0])
			if not shortcut.is_empty():
				segments.insert(0, shortcut)
		# Suggest members of an autoload or nested property
		auto_completes = _get_member_completions(segments)

	var prompt: String = segments[-1].to_lower()

	# Add true/false
	if prompt.length() > 1:
		var icon: Texture2D = _get_icon_for_type("keyword")
		var color: Color = theme_overrides.conditions_color
		if "true".contains(prompt):
			add_code_completion_option(CodeEdit.KIND_CONSTANT, "true", "true".substr(prompt.length()), color, icon)
		if "false".contains(prompt):
			add_code_completion_option(CodeEdit.KIND_CONSTANT, "false", "false".substr(prompt.length()), color, icon)

	auto_completes.sort_custom(func(a, b):
		return a.text.to_lower().similarity(prompt) > b.text.to_lower().similarity(prompt)
	)
	for auto_complete: Dictionary in auto_completes:
		var icon: Texture2D = _get_icon_for_type(auto_complete.type)
		var display_text: String = auto_complete.text
		if auto_complete.type == "method":
			display_text += "()"
		var insert: String = display_text.substr(auto_complete.prompt.length())
		add_code_completion_option(CodeEdit.KIND_CLASS, display_text, insert, theme_overrides.text_color, icon)


# Find the shortcut that a member name belongs to.
func _find_shortcut_with_member(member_name: String) -> String:
	for autoload: String in _get_state_shortcuts():
		for member: Dictionary in _get_members_for_base_script(autoload):
			if member.name == member_name:
				return autoload
	return ""


# Get completions for autoload names and state shortcut members.
func _get_autoload_completions(prompt: String) -> Array[Dictionary]:
	var completions: Array[Dictionary] = []
	for autoload: String in _autoloads.keys():
		if _matches_prompt(prompt, autoload):
			completions.append({ prompt = prompt, text = autoload, type = "script" })
	for autoload: String in _get_state_shortcuts():
		for member: Dictionary in _get_members_for_base_script(autoload):
			if _matches_prompt(prompt, member.name):
				completions.append({ prompt = prompt, text = member.name, type = member.type })
	return completions


# Get completions for members of an autoload or nested property chain.
func _get_member_completions(segments: PackedStringArray) -> Array[Dictionary]:
	var completions: Array[Dictionary] = []
	var prompt: String = segments[-1]
	var members: Array[Dictionary] = []

	if segments.size() == 2:
		# Direct autoload property access (e.g., "SomeGlobal.property")
		members = _get_members_for_base_script(segments[0])
	else:
		# Nested property access (e.g., "SomeGlobal.a_class_property.nested")
		var chain_segments: PackedStringArray = segments.slice(0, segments.size() - 1)
		var resolved_script: Variant = _resolve_script_for_property_chain(chain_segments)
		if resolved_script != null:
			members = _get_members_for_script(resolved_script)

	for member: Dictionary in members:
		if _matches_prompt(prompt, member.name):
			completions.append({ prompt = prompt, text = member.name, type = member.type })
	return completions


# Get the appropriate icon for a member type.
func _get_icon_for_type(type: String) -> Texture2D:
	match type:
		"keyword":
			return get_theme_icon("CodeHighlighter", "EditorIcons")
		"script":
			return get_theme_icon("Script", "EditorIcons")
		"property":
			return get_theme_icon("MemberProperty", "EditorIcons")
		"method":
			return get_theme_icon("MemberMethod", "EditorIcons")
		"signal":
			return get_theme_icon("MemberSignal", "EditorIcons")
		"constant":
			return get_theme_icon("MemberConstant", "EditorIcons")
		"enum":
			return get_theme_icon("Enum", "EditorIcons")
	return null


#endregion

#region Cursor Helpers


## Get the current caret position as a Vector2 (x=column, y=line).
func get_cursor() -> Vector2:
	return Vector2(get_caret_column(), get_caret_line())


## Set the caret position from a Vector2 (x=column, y=line).
func set_cursor(from_cursor: Vector2) -> void:
	set_caret_line(from_cursor.y, false)
	set_caret_column(from_cursor.x, false)


# Check if a prompt fuzzy-matches a candidate.
func _matches_prompt(prompt: String, candidate: String) -> bool:
	if prompt.length() > candidate.length(): return false
	if prompt.is_empty(): return true

	# Fuzzy match characters in order
	candidate = candidate.to_lower()
	var next_index: int = 0
	for char: String in prompt.to_lower():
		next_index = candidate.find(char, next_index) + 1
		if next_index == 0:
			return false
	return true


#endregion

#region Autoload and Script Helpers


# Get autoload shortcuts from settings and "using" clauses.
func _get_state_shortcuts() -> PackedStringArray:
	# Get any shortcuts defined in settings
	var shortcuts: PackedStringArray = DMSettings.get_setting(DMSettings.STATE_AUTOLOAD_SHORTCUTS, [])
	# Check for "using" clauses
	for line: String in text.split("\n"):
		var found: RegExMatch = compiler_regex.USING_REGEX.search(line)
		if found:
			shortcuts.append(found.strings[found.names.state])
	# Check for any other script sources
	for extra_script_source: String in DMSettings.get_setting(DMSettings.EXTRA_AUTO_COMPLETE_SCRIPT_SOURCES, []):
		if extra_script_source:
			shortcuts.append(extra_script_source)

	return shortcuts


# Get all members (methods, properties, signals, constants) for an autoload.
func _get_members_for_base_script(base_script_name: String) -> Array[Dictionary]:
	# Debounce method list lookups
	if _autoload_member_cache.has(base_script_name) \
	and _autoload_member_cache.get(base_script_name).get("at") > Time.get_ticks_msec() - 10000:
		return _autoload_member_cache.get(base_script_name).get("members")

	if not _autoloads.has(base_script_name) \
	and not base_script_name.begins_with("res://") \
	and not base_script_name.begins_with("uid://"):
		return []

	var autoload: Variant = load(_autoloads.get(base_script_name, base_script_name))
	if autoload is PackedScene:
		var node: Node = autoload.instantiate()
		autoload = node.get_script()
		node.free()
	var script: Script = autoload if autoload is Script else autoload.get_script()

	if not is_instance_valid(script): return []

	var members: Array[Dictionary] = _get_members_for_script(script)

	_autoload_member_cache[base_script_name] = {
		at = Time.get_ticks_msec(),
		members = members
	}

	return members


# Get all members (methods, properties, signals, constants) for a Script.
func _get_members_for_script(script: Variant) -> Array[Dictionary]:
	var members: Array[Dictionary] = []

	# Its an enum:
	if script is Dictionary:
		for key: String in script.keys():
			members.append({
				name = key,
				type = "enum"
			})
		return members

	# Otherwise its a script
	if not is_instance_valid(script): return []

	if script.resource_path.is_empty() or script.resource_path.ends_with(".gd"):
		for m: Dictionary in script.get_script_method_list():
			if not m.name.begins_with("@"):
				members.append({
					name = m.name,
					type = "method"
				})
		for m: Dictionary in script.get_script_property_list():
			if not m.name.ends_with(".gd") and not m.name.contains("Built-in"):
				members.append({
					name = m.name,
					type = "property",
					"class_name" = m.get("class_name", "")
				})
		for m: Dictionary in script.get_script_signal_list():
			members.append({
				name = m.name,
				type = "signal"
			})
		for c: String in script.get_script_constant_map():
			members.append({
				name = c,
				type = "constant"
			})

		# Check for static properties
		for line: String in script.source_code.split("\n"):
			var matching: RegExMatch = STATIC_REGEX.search(line)
			if matching:
				members.append({
					name = matching.strings[matching.names.property],
					type = "property"
				})
	elif script.resource_path.ends_with(".cs"):
		var dotnet: RefCounted = load(DMPlugin.get_plugin_path() + "/DialogueManager.cs").new()
		for m: Dictionary in dotnet.GetMembersForScript(script):
			members.append(m)

	return members


# Get the Script for a given class name.
func _get_script_for_class_name(class_name_to_find: String) -> Script:
	if class_name_to_find == "": return null

	for class_data: Dictionary in ProjectSettings.get_global_class_list():
		if class_data.get(&"class") == class_name_to_find:
			return load(class_data.path)

	return null


# Get method info (args, return type) for a method in a Script.
func _get_method_info_from_script(script: Script, method_name: String) -> Dictionary:
	if not is_instance_valid(script): return {}

	if script.resource_path.ends_with(".gd"):
		for m: Dictionary in script.get_script_method_list():
			if m.name == method_name:
				return m
	elif script.resource_path.ends_with(".cs"):
		var dotnet: RefCounted = load(DMPlugin.get_plugin_path() + "/DialogueManager.cs").new()
		for m: Dictionary in dotnet.GetMembersForScript(script):
			if m.get("name") == method_name and m.get("type") == "method":
				return m

	return {}


# Format method arguments into a hint string for display.
func _format_method_hint(method_info: Dictionary) -> String:
	if method_info.is_empty(): return ""

	var args: Array = method_info.get("args", [])
	if args.size() == 0: return ""

	var hint_parts: PackedStringArray = []
	for arg: Dictionary in args:
		var arg_name: String = arg.get("name", "")
		var arg_type: int = arg.get("type", TYPE_NIL)
		var arg_class_name: String = arg.get("class_name", "")

		var type_name: String = ""
		if arg_class_name != "":
			type_name = arg_class_name
		elif arg_type != TYPE_NIL:
			type_name = type_string(arg_type)

		if type_name != "":
			hint_parts.append("%s: %s" % [arg_name, type_name])
		else:
			hint_parts.append(arg_name)

	return ", ".join(hint_parts)


#endregion

#region Symbol Resolution Helpers


# Find the line number where a member is defined in a script's source code.
func _find_definition_in_script(script: Script, member_name: String) -> int:
	if not is_instance_valid(script): return -1

	var lines: PackedStringArray = script.source_code.split("\n")

	var method_regex: RegEx = RegEx.create_from_string("^\\s*func\\s+" + member_name + "\\s*\\(")
	var property_regex: RegEx = RegEx.create_from_string("^\\s*var\\s+" + member_name + "\\s*[:\\s=]")
	var signal_regex: RegEx = RegEx.create_from_string("^\\s*signal\\s+" + member_name + "\\s*[\\(\\s]")
	var const_regex: RegEx = RegEx.create_from_string("^\\s*const\\s+" + member_name + "\\s*[:\\s=]")
	var enum_regex: RegEx = RegEx.create_from_string("^\\s*enum\\s+" + member_name + "[\\s$]")
	var inner_class_regex: RegEx = RegEx.create_from_string("^\\s*class\\s+" + member_name + ":")

	for i: int in range(lines.size()):
		var line: String = lines[i]
		if method_regex.search(line) \
		or property_regex.search(line) \
		or signal_regex.search(line) \
		or const_regex.search(line) \
		or enum_regex.search(line) \
		or inner_class_regex.search(line):
			# Editor line numbers start at 1
			return i + 1

	return -1


# Resolve the symbol at a given position in a mutation line for definition lookup.
func _resolve_mutation_symbol_at_position(line_text: String, column: int) -> Dictionary:
	if not _is_in_mutation_context(line_text, column):
		return {}

	var symbol: String = get_word_at_pos(get_local_mouse_pos())
	if symbol.is_empty(): return {}

	# Find the full chain by looking backwards from the token start for dots and identifiers
	var token_start: int = column
	while token_start > 0 and line_text[token_start - 1].is_valid_ascii_identifier():
		token_start -= 1

	var chain_start: int = token_start
	while chain_start > 0:
		var prev_char: String = line_text[chain_start - 1]
		if prev_char == ".":
			chain_start -= 1
			# Continue backwards to get the identifier before the dot
			while chain_start > 0 and line_text[chain_start - 1].is_valid_ascii_identifier():
				chain_start -= 1
		else:
			break

	var full_chain: String = line_text.substr(chain_start, token_start + symbol.length() - chain_start)
	# Remove any trailing parentheses content
	if "(" in full_chain:
		full_chain = full_chain.substr(0, full_chain.find("("))

	var segments: PackedStringArray = full_chain.split(".")

	# Check if it starts with an autoload
	if not segments[0] in _autoloads.keys():
		var shortcut: String = _find_shortcut_with_member(segments[0])
		if shortcut.is_empty():
			return {}
		else:
			segments.insert(0, shortcut)

	# The symbol we clicked on is the last segment
	var member_name: String = segments[-1]

	# Resolve the script that contains this member
	var target_script: Variant = null
	if segments.size() == 1 and segments[0] in _autoloads.keys():
		member_name = "class_name"
		var target: Variant = load(_autoloads.get(segments[0]))
		if target is PackedScene:
			var node: Node = target.instantiate()
			target = node.get_script()
			node.free()
		target_script = target if target is Script else target.get_script()
	else:
		var object_segments: PackedStringArray = segments.slice(0, segments.size() - 1)
		target_script = _resolve_script_for_property_chain(object_segments)

	if target_script == null:
		return {}
	elif target_script is Dictionary:
		return {
			"script": _resolve_script_for_property_chain(segments.slice(0, -2)),
			"member_name": segments.slice(0, -1)[segments.size() - 2],
			"symbol": symbol
		}
	# C# symbol lookups aren't supported
	if target_script is Script and target_script.resource_path.ends_with(".cs"):
		return {}

	return {
		"script": target_script,
		"member_name": member_name,
		"symbol": symbol
	}


# Update the code hint to show method parameter information.
func _update_code_hint() -> void:
	var cursor: Vector2 = get_cursor()
	var current_line: String = get_line(cursor.y)
	var text_before_cursor: String = current_line.substr(0, cursor.x)

	# Check if we're in a mutation context (inline or full line)
	var inline_context: Dictionary = _get_inline_mutation_context(current_line, cursor.x)
	if not _is_in_mutation_context(current_line, cursor.x):
		set_code_hint("")
		return

	# For inline mutations, scope to the bracket content
	var expression_text: String = text_before_cursor
	if not inline_context.is_empty():
		var bracket_start: int = inline_context.get("bracket_start", 0)
		expression_text = current_line.substr(bracket_start + 1, cursor.x - bracket_start - 1)

	# Check if cursor is inside parentheses by counting unmatched opening parens
	var paren_depth: int = 0
	var last_open_parenthesis_pos: int = -1
	for i: int in range(expression_text.length()):
		if expression_text[i] == "(":
			paren_depth += 1
			last_open_parenthesis_pos = i
		elif expression_text[i] == ")":
			paren_depth -= 1

	if paren_depth <= 0 or last_open_parenthesis_pos == -1:
		set_code_hint("")
		return

	# Extract the expression before the opening parenthesis
	var expression_before_parenthesis: String = expression_text.substr(0, last_open_parenthesis_pos).strip_edges()

	# Find the method chain (last token before the paren)
	var method_chain: String = ""
	for i: int in range(expression_before_parenthesis.length() - 1, -1, -1):
		var c: String = expression_before_parenthesis[i]
		if c == " " or c == "(" or c == "," or c == "=" or c == ">" or c == "!":
			method_chain = expression_before_parenthesis.substr(i + 1)
			break
		if i == 0:
			method_chain = expression_before_parenthesis

	if method_chain == "":
		set_code_hint("")
		return

	# Parse the method chain into segments
	var segments: PackedStringArray = method_chain.split(".")
	if segments.is_empty():
		set_code_hint("")
		return

	# The last segment is the method name
	var method_name: String = segments[-1]

	# Check if it starts with an autoload
	if not segments[0] in _autoloads.keys():
		var shortcut: String = _find_shortcut_with_member(segments[0])
		if shortcut.is_empty():
			set_code_hint("")
			return
		else:
			segments.insert(0, shortcut)

	# Resolve the script for the object the method is called on
	var object_segments: PackedStringArray = segments.slice(0, segments.size() - 1)
	var target_script: Variant = _resolve_script_for_property_chain(object_segments)

	if target_script == null or not target_script is Script:
		set_code_hint("")
		return

	# Get the method info and format the hint
	var method_info: Dictionary = _get_method_info_from_script(target_script, method_name)
	var hint: String = _format_method_hint(method_info)

	set_code_hint(hint)


#endregion

#region Mutation Context Helpers


# Get the inline mutation context if the cursor is inside an inline mutation bracket.
# Returns a dictionary with "expression" key containing the text to autocomplete,
# or an empty dictionary if not in an inline mutation context.
func _get_inline_mutation_context(line: String, cursor_x: int) -> Dictionary:
	# Find all bracket positions and determine if cursor is inside one
	var bracket_depth: int = 0
	var bracket_start: int = -1
	var bracket_content_start: int = -1

	for i: int in range(line.length()):
		if i >= cursor_x:
			break

		if line[i] == "[":
			bracket_depth += 1
			if bracket_depth == 1:
				bracket_start = i
				bracket_content_start = i + 1
		elif line[i] == "]":
			bracket_depth -= 1
			if bracket_depth == 0:
				bracket_start = -1
				bracket_content_start = -1

	# Not inside brackets
	if bracket_start == -1 or bracket_content_start == -1:
		return {}

	# Get the content inside the brackets up to cursor
	var bracket_content: String = line.substr(bracket_content_start, cursor_x - bracket_content_start)

	# Check if this is a mutation tag
	for prefix: String in INLINE_MUTATION_PREFIXES:
		if bracket_content.begins_with(prefix):
			# Return the expression part (after the tag)
			var expression: String = bracket_content.substr(prefix.length())
			return { "expression": expression, "bracket_start": bracket_start }

	return {}


# Check if the cursor is in a mutation context (either inline or full mutation line).
func _is_in_mutation_context(line: String, cursor_x: int) -> bool:
	if not _get_inline_mutation_context(line, cursor_x).is_empty():
		return true
	for prefix: String in MUTATION_PREFIXES:
		if line.strip_edges().begins_with(prefix):
			return true
	return false


# Resolve the Script for a chain of property accesses (e.g., "Autoload.prop1.prop2").
func _resolve_script_for_property_chain(segments: PackedStringArray) -> Variant:
	if segments.size() == 0: return null

	var autoload: Variant = null

	if segments[0].begins_with("uid://") or segments[0].begins_with("res://"):
		autoload = load(segments[0])
	elif _autoloads.has(segments[0]):
		autoload = load(_autoloads.get(segments[0]))
	else:
		return null

	if autoload is PackedScene:
		var node: Node = autoload.instantiate()
		autoload = node.get_script()
		node.free()
	elif not autoload is Script:
		autoload = autoload.get_script()

	var current_script: Variant = autoload

	if not is_instance_valid(current_script): return null
	if (segments.size() == 1): return current_script

	# Walk through each property in the chain (except the last one which is what we're completing)
	for i: int in range(1, segments.size()):
		var property_name: String = segments[i]
		var found_property: bool = false

		# Regular properties
		for property_info: Dictionary in current_script.get_script_property_list():
			if property_info.name == property_name:
				var prop_class_name: String = property_info.get("class_name", "")
				if prop_class_name != "":
					current_script = _get_script_for_class_name(prop_class_name)
					if current_script == null:
						return null
					found_property = true
					break
				else:
					# Property doesn't have a class type, can't go deeper
					return null

		# Check for inner classes and enums
		if not found_property:
			for constant: String in current_script.get_script_constant_map():
				if constant == property_name:
					var constant_value: Variant = current_script.get_script_constant_map().get(constant)
					# Inner class
					if constant_value is Script:
						current_script = constant_value
						found_property = true
						break
					# Enum
					if constant_value is Dictionary:
						current_script = constant_value
						found_property = true
						break
					else:
						# Constant isn't an enum or an inner class
						return null

		# Static properties. NOTE: Godot doesn't programatically find static properties
		# so we have to manually find them.
		if not found_property and current_script is Script and current_script.source_code.contains("static var"):
			for line: String in current_script.source_code.split("\n"):
				var matched: RegExMatch = STATIC_REGEX.search(line)
				if matched and matched.strings[matched.names.property] == property_name:
					if matched.names.has("type"):
						var type: String = matched.strings[matched.names.type]
						current_script = _get_script_for_class_name(type)
						if current_script == null:
							return null
						found_property = true
						break
					else:
						return null

		if not found_property:
			return null

	return current_script


#endregion

#region Title and Character Helpers


## Get a list of titles from the current text.
func get_titles() -> PackedStringArray:
	var titles: PackedStringArray = PackedStringArray([])
	var lines: PackedStringArray = text.split("\n")
	for line: String in lines:
		if line.strip_edges().begins_with("~ "):
			titles.append(line.strip_edges().substr(2))

	return titles


## Work out what the next title above the current line is
func check_active_title() -> void:
	var line_number: int = get_caret_line()
	var lines: PackedStringArray = text.split("\n")
	# Look at each line above this one to find the next title line
	for i: int in range(line_number, -1, -1):
		if lines[i].begins_with("~ "):
			active_title_change.emit(lines[i].replace("~ ", ""))
			return

	active_title_change.emit("")


## Move the caret line to match a given title.
func go_to_title(title: String, create_if_none: bool = false) -> void:
	var found_title: bool = false

	var lines = text.split("\n")
	for i: int in range(0, lines.size()):
		if lines[i].strip_edges() == "~ " + title:
			found_title = true
			set_caret_line(i)
			center_viewport_to_caret()

	if create_if_none and not found_title:
		text += "\n\n\n~ %s\n\n=> END" % [title]
		set_caret_line(text.split("\n").size() - 2)
		center_viewport_to_caret()


## Get all character names from the dialogue that match the given prefix.
func get_character_names(beginning_with: String) -> PackedStringArray:
	var names: PackedStringArray = []
	var lines = text.split("\n")
	for line: String in lines:
		if ": " in line:
			var character_name: String = WEIGHTED_RANDOM_PREFIX.sub(line.split(": ")[0].strip_edges(), "")
			if not character_name in names and _matches_prompt(beginning_with, character_name):
				names.append(character_name)
	return names


#endregion

#region Text Editing Helpers


## Mark a line as an error or not.
func mark_line_as_error(line_number: int, is_error: bool) -> void:
	# Lines display counting from 1 but are actually indexed from 0
	line_number -= 1

	if line_number < 0: return

	if is_error:
		set_line_background_color(line_number, theme_overrides.error_line_color)
		set_line_gutter_icon(line_number, 0, get_theme_icon("StatusError", "EditorIcons"))
	else:
		set_line_background_color(line_number, Color(0, 0, 0, 0))
		set_line_gutter_icon(line_number, 0, null)


## Insert or wrap some bbcode at the caret/selection.
func insert_bbcode(open_tag: String, close_tag: String = "") -> void:
	if close_tag == "":
		insert_text_at_caret(open_tag)
		grab_focus()
	else:
		var selected_text: String = get_selected_text()
		insert_text_at_caret("%s%s%s" % [open_tag, selected_text, close_tag])
		grab_focus()
		set_caret_column(get_caret_column() - close_tag.length())


## Insert text at current caret position. Moves caret down 1 line if not "=> END".
func insert_text_at_cursor(text_to_insert: String) -> void:
	if text_to_insert != "=> END":
		insert_text_at_caret(text_to_insert + "\n")
		set_caret_line(get_caret_line() + 1)
	else:
		insert_text_at_caret(text_to_insert)
	grab_focus()


## Toggle the selected lines as comments.
func toggle_comment() -> void:
	begin_complex_operation()

	var comment_delimiter: String = delimiter_comments[0]
	var is_first_line: bool = true
	var will_comment: bool = true
	var selections: Array = []
	var line_offsets: Dictionary = {}

	for caret_index in range(0, get_caret_count()):
		var from_line: int = get_caret_line(caret_index)
		var from_column: int = get_caret_column(caret_index)
		var to_line: int = get_caret_line(caret_index)
		var to_column: int = get_caret_column(caret_index)

		if has_selection(caret_index):
			from_line = get_selection_from_line(caret_index)
			to_line = get_selection_to_line(caret_index)
			from_column = get_selection_from_column(caret_index)
			to_column = get_selection_to_column(caret_index)

		selections.append({
			from_line = from_line,
			from_column = from_column,
			to_line = to_line,
			to_column = to_column
		})

		for line_number: int in range(from_line, to_line + 1):
			if line_offsets.has(line_number): continue

			var line_text: String = get_line(line_number)

			# The first line determines if we are commenting or uncommentingg
			if is_first_line:
				is_first_line = false
				will_comment = not line_text.strip_edges().begins_with(comment_delimiter)

			# Only comment/uncomment if the current line needs to
			if will_comment:
				set_line(line_number, comment_delimiter + line_text)
				line_offsets[line_number] = 1
			elif line_text.begins_with(comment_delimiter):
				set_line(line_number, line_text.substr(comment_delimiter.length()))
				line_offsets[line_number] = -1
			else:
				line_offsets[line_number] = 0

	for caret_index in range(0, get_caret_count()):
		var selection: Dictionary = selections[caret_index]
		select(
			selection.from_line,
			selection.from_column + line_offsets[selection.from_line],
			selection.to_line,
			selection.to_column + line_offsets[selection.to_line],
			caret_index
		)
		set_caret_column(selection.from_column + line_offsets[selection.from_line], false, caret_index)

	end_complex_operation()

	text_set.emit()
	text_changed.emit()


## Remove the current line.
func delete_current_line() -> void:
	var cursor: Vector2 = get_cursor()
	if get_line_count() == 1:
		select_all()
	elif cursor.y == 0:
		select(0, 0, 1, 0)
	else:
		select(cursor.y - 1, get_line_width(cursor.y - 1), cursor.y, get_line_width(cursor.y))
	delete_selection()
	text_changed.emit()


## Move the selected lines up or down.
func move_line(offset: int) -> void:
	offset = clamp(offset, -1, 1)

	var starting_scroll: float = scroll_vertical
	var cursor: Vector2 = get_cursor()
	var reselect: bool = false
	var from: int = cursor.y
	var to: int = cursor.y
	if has_selection():
		reselect = true
		from = get_selection_from_line()
		to = get_selection_to_line()

	var lines: PackedStringArray = text.split("\n")

	# Prevent the lines from being out of bounds
	if from + offset < 0 or to + offset >= lines.size(): return

	var target_from_index: int = from - 1 if offset == -1 else to + 1
	var target_to_index: int = to if offset == -1 else from
	var line_to_move: String = lines[target_from_index]
	lines.remove_at(target_from_index)
	lines.insert(target_to_index, line_to_move)

	text = "\n".join(lines)

	cursor.y += offset
	set_cursor(cursor)
	from += offset
	to += offset
	if reselect:
		select(from, 0, to, get_line_width(to))

	text_changed.emit()
	scroll_vertical = starting_scroll + offset


#endregion

#region Signals


func _on_project_settings_changed() -> void:
	_autoloads = {}

	# Add any actual autoloads
	var project = ConfigFile.new()
	project.load("res://project.godot")
	if project.has_section("autoload"):
		for autoload: String in project.get_section_keys("autoload"):
			if autoload != "DialogueManager":
				_autoloads[autoload] = project.get_value("autoload", autoload).substr(1)

	# Add project-defined classes if they contain static properties or methods
	var plugin_path: String = DMPlugin.get_plugin_path()
	if not plugin_path.is_empty():
		for script_info: Dictionary in ProjectSettings.get_global_class_list():
			if not script_info.path.begins_with(plugin_path):
				var script: Script = load(script_info.path)
				var static_match: RegExMatch = STATIC_CONTENT_REGEX.search(script.source_code)
				if static_match:
					_autoloads[script_info.class] = script_info.path


func _on_code_edit_symbol_validate(symbol: String) -> void:
	if symbol.begins_with("res://") and symbol.ends_with(".dialogue"):
		set_symbol_lookup_word_as_valid(true)
		return

	for title: String in get_titles():
		if symbol == title:
			set_symbol_lookup_word_as_valid(true)
			return

	# Check if it's a mutation line symbol
	var cursor: Vector2 = get_line_column_at_pos(get_local_mouse_pos())
	var line_text: String = get_line(cursor.y)
	var symbol_info: Dictionary = _resolve_mutation_symbol_at_position(line_text, cursor.x)
	if not symbol_info.is_empty() and symbol_info.get("symbol") == symbol:
		var script: Script = symbol_info.get("script")
		var member_name: String = symbol_info.get("member_name")
		if member_name == "class_name":
			set_symbol_lookup_word_as_valid(true)
			return
		else:
			var line_number: int = _find_definition_in_script(script, member_name)
			if line_number > 0:
				set_symbol_lookup_word_as_valid(true)
				return

	set_symbol_lookup_word_as_valid(false)


func _on_code_edit_symbol_lookup(symbol: String, line: int, column: int) -> void:
	if symbol.begins_with("res://") and symbol.ends_with(".dialogue"):
		external_file_requested.emit(symbol, "")
		return

	# Check if it's a title
	for title: String in get_titles():
		if symbol == title:
			go_to_title(symbol)
			return

	# Check if it's a mutation line symbol
	var line_text: String = get_line(line)
	var symbol_info: Dictionary = _resolve_mutation_symbol_at_position(line_text, column)
	if not symbol_info.is_empty() and symbol_info.get("symbol") == symbol:
		var script: Script = symbol_info.get("script")
		var member_name: String = symbol_info.get("member_name")
		if member_name == "class_name":
			EditorInterface.edit_script(script, 1, 0, true)
			EditorInterface.set_main_screen_editor.call_deferred("Script")
		else:
			var line_number: int = _find_definition_in_script(script, member_name)
			if line_number > 0:
				# Open the script in the editor
				EditorInterface.edit_script(script, line_number, 0, true)
				EditorInterface.set_main_screen_editor.call_deferred("Script")
				return


func _on_code_edit_text_changed() -> void:
	request_code_completion(true)
	_update_code_hint()


func _on_code_edit_text_set() -> void:
	queue_redraw()


func _on_code_edit_caret_changed() -> void:
	check_active_title()
	last_selected_text = get_selected_text()
	_update_code_hint()


func _on_code_edit_gutter_clicked(line: int, gutter: int) -> void:
	var line_errors = errors.filter(func(error): return error.line_number == line)
	if line_errors.size() > 0:
		error_clicked.emit(line)


#endregion
```

## File: addons/dialogue_manager/components/code_edit.gd.uid
```
uid://djeybvlb332mp
```

## File: addons/dialogue_manager/components/code_edit.tscn
```
[gd_scene format=3 uid="uid://civ6shmka5e8u"]

[ext_resource type="Script" uid="uid://klpiq4tk3t7a" path="res://addons/dialogue_manager/components/code_edit_syntax_highlighter.gd" id="1_58cfo"]
[ext_resource type="Script" uid="uid://djeybvlb332mp" path="res://addons/dialogue_manager/components/code_edit.gd" id="1_g324i"]

[sub_resource type="SyntaxHighlighter" id="SyntaxHighlighter_crbvo"]
script = ExtResource("1_58cfo")

[node name="CodeEdit" type="CodeEdit" unique_id=236286673]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2
text = "~ title_thing

if this = \"that\" or 'this'
Nathan: Something
- Then [if test.thing() == 2.0] => somewhere
- Other => END!

~ somewhere

set has_something = true
=> END"
scroll_past_end_of_file = true
minimap_draw = true
syntax_highlighter = SubResource("SyntaxHighlighter_crbvo")
highlight_all_occurrences = true
highlight_current_line = true
draw_tabs = true
symbol_lookup_on_click = true
line_folding = true
gutters_draw_line_numbers = true
gutters_draw_fold_gutter = true
delimiter_strings = Array[String](["\" \""])
delimiter_comments = Array[String](["#"])
code_completion_enabled = true
code_completion_prefixes = Array[String]([">", "<"])
indent_automatic = true
auto_brace_completion_enabled = true
auto_brace_completion_highlight_matching = true
auto_brace_completion_pairs = {
"\"": "\"",
"(": ")",
"[": "]",
"{": "}"
}
script = ExtResource("1_g324i")

[connection signal="caret_changed" from="." to="." method="_on_code_edit_caret_changed"]
[connection signal="gutter_clicked" from="." to="." method="_on_code_edit_gutter_clicked"]
[connection signal="symbol_lookup" from="." to="." method="_on_code_edit_symbol_lookup"]
[connection signal="symbol_validate" from="." to="." method="_on_code_edit_symbol_validate"]
[connection signal="text_changed" from="." to="." method="_on_code_edit_text_changed"]
[connection signal="text_set" from="." to="." method="_on_code_edit_text_set"]
```

## File: addons/dialogue_manager/components/download_update_panel.gd
```
@tool
extends Control


signal failed()
signal updated(updated_to_version: String)


const DialogueConstants = preload("../constants.gd")

const TEMP_FILE_NAME = "user://temp.zip"


@onready var logo: TextureRect = %Logo
@onready var label: Label = $VBox/Label
@onready var http_request: HTTPRequest = $HTTPRequest
@onready var download_button: Button = %DownloadButton

var next_version_release: Dictionary:
	set(value):
		next_version_release = value
		label.text = DialogueConstants.translate(&"update.is_available_for_download") % value.tag_name.substr(1)
	get:
		return next_version_release


func _ready() -> void:
	$VBox/Center/DownloadButton.text = DialogueConstants.translate(&"update.download_update")
	$VBox/Center2/NotesButton.text = DialogueConstants.translate(&"update.release_notes")


### Signals


func _on_download_button_pressed() -> void:
	# Safeguard the actual dialogue manager repo from accidentally updating itself
	if FileAccess.file_exists("res://tests/test_basic_dialogue.gd"):
		prints("You can't update the addon from within itself.")
		failed.emit()
		return

	http_request.request(next_version_release.zipball_url)
	download_button.disabled = true
	download_button.text = DialogueConstants.translate(&"update.downloading")


func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if result != HTTPRequest.RESULT_SUCCESS:
		failed.emit()
		return

	# Save the downloaded zip
	var zip_file: FileAccess = FileAccess.open(TEMP_FILE_NAME, FileAccess.WRITE)
	zip_file.store_buffer(body)
	zip_file.close()

	OS.move_to_trash(ProjectSettings.globalize_path("res://addons/dialogue_manager"))

	var zip_reader: ZIPReader = ZIPReader.new()
	zip_reader.open(TEMP_FILE_NAME)
	var files: PackedStringArray = zip_reader.get_files()

	var base_path = files[1]
	# Remove archive folder
	files.remove_at(0)
	# Remove assets folder
	files.remove_at(0)

	for path in files:
		var new_file_path: String = path.replace(base_path, "")
		if path.ends_with("/"):
			DirAccess.make_dir_recursive_absolute("res://addons/%s" % new_file_path)
		else:
			var file: FileAccess = FileAccess.open("res://addons/%s" % new_file_path, FileAccess.WRITE)
			file.store_buffer(zip_reader.read_file(path))

	zip_reader.close()
	DirAccess.remove_absolute(TEMP_FILE_NAME)

	updated.emit(next_version_release.tag_name.substr(1))


func _on_notes_button_pressed() -> void:
	OS.shell_open(next_version_release.html_url)
```

## File: addons/dialogue_manager/components/download_update_panel.gd.uid
```
uid://kpwo418lb2t2
```

## File: addons/dialogue_manager/components/download_update_panel.tscn
```
[gd_scene load_steps=3 format=3 uid="uid://qdxrxv3c3hxk"]

[ext_resource type="Script" uid="uid://kpwo418lb2t2" path="res://addons/dialogue_manager/components/download_update_panel.gd" id="1_4tm1k"]
[ext_resource type="Texture2D" uid="uid://d3baj6rygkb3f" path="res://addons/dialogue_manager/assets/update.svg" id="2_4o2m6"]

[node name="DownloadUpdatePanel" type="Control"]
layout_mode = 3
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2
script = ExtResource("1_4tm1k")

[node name="HTTPRequest" type="HTTPRequest" parent="."]

[node name="VBox" type="VBoxContainer" parent="."]
layout_mode = 1
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
offset_left = -1.0
offset_top = 9.0
offset_right = -1.0
offset_bottom = 9.0
grow_horizontal = 2
grow_vertical = 2
theme_override_constants/separation = 10

[node name="Logo" type="TextureRect" parent="VBox"]
unique_name_in_owner = true
clip_contents = true
custom_minimum_size = Vector2(300, 80)
layout_mode = 2
texture = ExtResource("2_4o2m6")
stretch_mode = 5

[node name="Label" type="Label" parent="VBox"]
layout_mode = 2
text = "v1.2.3 is available for download."
horizontal_alignment = 1

[node name="Center" type="CenterContainer" parent="VBox"]
layout_mode = 2

[node name="DownloadButton" type="Button" parent="VBox/Center"]
unique_name_in_owner = true
layout_mode = 2
text = "Download update"

[node name="Center2" type="CenterContainer" parent="VBox"]
layout_mode = 2

[node name="NotesButton" type="LinkButton" parent="VBox/Center2"]
layout_mode = 2
text = "Read release notes"

[connection signal="request_completed" from="HTTPRequest" to="." method="_on_http_request_request_completed"]
[connection signal="pressed" from="VBox/Center/DownloadButton" to="." method="_on_download_button_pressed"]
[connection signal="pressed" from="VBox/Center2/NotesButton" to="." method="_on_notes_button_pressed"]
```

## File: addons/dialogue_manager/components/errors_panel.gd
```
@tool
extends HBoxContainer


signal error_pressed(line_number)


const DialogueConstants = preload("../constants.gd")


@onready var error_button: Button = $ErrorButton
@onready var next_button: Button = $NextButton
@onready var count_label: Label = $CountLabel
@onready var previous_button: Button = $PreviousButton

## The index of the current error being shown
var error_index: int = 0:
	set(next_error_index):
		error_index = wrap(next_error_index, 0, errors.size())
		show_error()
	get:
		return error_index

## The list of all errors
var errors: Array = []:
	set(next_errors):
		errors = next_errors
		self.error_index = 0
	get:
		return errors


func _ready() -> void:
	apply_theme()
	hide()


## Set up colors and icons
func apply_theme() -> void:
	error_button.add_theme_color_override("font_color", get_theme_color("error_color", "Editor"))
	error_button.add_theme_color_override("font_hover_color", get_theme_color("error_color", "Editor"))
	error_button.icon = get_theme_icon("StatusError", "EditorIcons")
	previous_button.icon = get_theme_icon("ArrowLeft", "EditorIcons")
	next_button.icon = get_theme_icon("ArrowRight", "EditorIcons")


## Move the error index to match a given line
func show_error_for_line_number(line_number: int) -> void:
	for i in range(0, errors.size()):
		if errors[i].line_number == line_number:
			self.error_index = i


## Show the current error
func show_error() -> void:
	if errors.size() == 0:
		hide()
	else:
		show()
		count_label.text = DialogueConstants.translate(&"n_of_n").format({ index = error_index + 1, total = errors.size() })
		var error = errors[error_index]
		error_button.text = DialogueConstants.translate(&"errors.line_and_message").format({ line = error.line_number, column = error.column_number, message = DialogueConstants.get_error_message(error.error) })
		if error.has("external_error"):
			error_button.text += " " + DialogueConstants.get_error_message(error.external_error)


### Signals


func _on_errors_panel_theme_changed() -> void:
	apply_theme()


func _on_error_button_pressed() -> void:
	error_pressed.emit(errors[error_index].line_number, errors[error_index].column_number)


func _on_previous_button_pressed() -> void:
	self.error_index -= 1
	_on_error_button_pressed()


func _on_next_button_pressed() -> void:
	self.error_index += 1
	_on_error_button_pressed()
```

## File: addons/dialogue_manager/components/errors_panel.gd.uid
```
uid://d2l8nlb6hhrfp
```

## File: addons/dialogue_manager/components/errors_panel.tscn
```
[gd_scene load_steps=4 format=3 uid="uid://cs8pwrxr5vxix"]

[ext_resource type="Script" uid="uid://d2l8nlb6hhrfp" path="res://addons/dialogue_manager/components/errors_panel.gd" id="1_nfm3c"]

[sub_resource type="Image" id="Image_w0gko"]
data = {
"data": PackedByteArray(255, 255, 255, 0, 255, 255, 255, 0, 255, 128, 128, 4, 255, 128, 128, 4, 255, 128, 128, 4, 255, 128, 128, 4, 255, 128, 128, 4, 255, 128, 128, 4, 255, 128, 128, 4, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 131, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 131, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 131, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 94, 94, 127, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 128, 128, 4, 255, 128, 128, 4, 255, 128, 128, 4, 255, 128, 128, 4, 255, 128, 128, 4, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 231, 255, 93, 93, 55, 255, 97, 97, 58, 255, 93, 93, 233, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 231, 255, 94, 94, 54, 255, 94, 94, 57, 255, 93, 93, 233, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 97, 97, 42, 255, 255, 255, 0, 255, 255, 255, 0, 255, 97, 97, 42, 255, 93, 93, 233, 255, 93, 93, 232, 255, 93, 93, 41, 255, 255, 255, 0, 255, 255, 255, 0, 255, 97, 97, 42, 255, 93, 93, 233, 255, 93, 93, 232, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 96, 96, 45, 255, 97, 97, 42, 255, 255, 255, 0, 255, 97, 97, 42, 255, 97, 97, 42, 255, 255, 255, 0, 255, 98, 98, 47, 255, 97, 97, 42, 255, 255, 255, 0, 255, 97, 97, 42, 255, 97, 97, 42, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 96, 96, 45, 255, 93, 93, 235, 255, 93, 93, 233, 255, 97, 97, 42, 255, 255, 255, 0, 255, 255, 255, 0, 255, 94, 94, 46, 255, 93, 93, 236, 255, 93, 93, 233, 255, 97, 97, 42, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 235, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 233, 255, 95, 95, 59, 255, 96, 96, 61, 255, 93, 93, 235, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 233, 255, 95, 95, 59, 255, 96, 96, 61, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 93, 93, 252, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0),
"format": "RGBA8",
"height": 16,
"mipmaps": false,
"width": 16
}

[sub_resource type="ImageTexture" id="ImageTexture_s6fxl"]
image = SubResource("Image_w0gko")

[node name="ErrorsPanel" type="HBoxContainer"]
visible = false
offset_right = 1024.0
offset_bottom = 600.0
grow_horizontal = 2
grow_vertical = 2
script = ExtResource("1_nfm3c")
metadata/_edit_layout_mode = 1

[node name="ErrorButton" type="Button" parent="."]
layout_mode = 2
size_flags_horizontal = 3
theme_override_colors/font_color = Color(0, 0, 0, 1)
theme_override_colors/font_hover_color = Color(0, 0, 0, 1)
theme_override_constants/h_separation = 3
icon = SubResource("ImageTexture_s6fxl")
flat = true
alignment = 0
text_overrun_behavior = 4

[node name="Spacer" type="Control" parent="."]
custom_minimum_size = Vector2(40, 0)
layout_mode = 2

[node name="PreviousButton" type="Button" parent="."]
layout_mode = 2
icon = SubResource("ImageTexture_s6fxl")
flat = true

[node name="CountLabel" type="Label" parent="."]
layout_mode = 2

[node name="NextButton" type="Button" parent="."]
layout_mode = 2
icon = SubResource("ImageTexture_s6fxl")
flat = true

[connection signal="pressed" from="ErrorButton" to="." method="_on_error_button_pressed"]
[connection signal="pressed" from="PreviousButton" to="." method="_on_previous_button_pressed"]
[connection signal="pressed" from="NextButton" to="." method="_on_next_button_pressed"]
```

## File: addons/dialogue_manager/components/files_list.gd
```
@tool
extends VBoxContainer


signal file_selected(file_path: String)
signal file_popup_menu_requested(at_position: Vector2)
signal file_double_clicked(file_path: String)
signal file_middle_clicked(file_path: String)


const DialogueConstants = preload("../constants.gd")

const MODIFIED_SUFFIX = "(*)"


@export var icon: Texture2D

@onready var filter_edit: LineEdit = $FilterEdit
@onready var list: ItemList = $List

var file_map: Dictionary = {}

var current_file_path: String = ""
var last_selected_file_path: String = ""

var files: PackedStringArray = []:
	set(next_files):
		files = next_files
		files.sort()
		update_file_map()
		apply_filter()
	get:
		return files

var unsaved_files: Array[String] = []

var filter: String = "":
	set(next_filter):
		filter = next_filter
		apply_filter()
	get:
		return filter


func _ready() -> void:
	apply_theme()

	filter_edit.placeholder_text = DialogueConstants.translate(&"files_list.filter")


func focus_filter() -> void:
	filter_edit.grab_focus()


func select_file(file: String) -> void:
	list.deselect_all()
	for i in range(0, list.get_item_count()):
		var item_text = list.get_item_text(i).replace(MODIFIED_SUFFIX, "")
		if item_text == get_nice_file(file, item_text.count("/") + 1):
			list.select(i)
			last_selected_file_path = file


func mark_file_as_unsaved(file: String, is_unsaved: bool) -> void:
	if not file in unsaved_files and is_unsaved:
		unsaved_files.append(file)
	elif file in unsaved_files and not is_unsaved:
		unsaved_files.erase(file)
	apply_filter()


func update_file_map() -> void:
	file_map = {}
	for file in files:
		var nice_file: String = get_nice_file(file)

		# See if a value with just the file name is already in the map
		for key in file_map.keys():
			if file_map[key] == nice_file:
				var bit_count = nice_file.count("/") + 2

				var existing_nice_file = get_nice_file(key, bit_count)
				nice_file = get_nice_file(file, bit_count)

				while nice_file == existing_nice_file:
					bit_count += 1
					existing_nice_file = get_nice_file(key, bit_count)
					nice_file = get_nice_file(file, bit_count)

				file_map[key] = existing_nice_file

		file_map[file] = nice_file


func get_nice_file(file_path: String, path_bit_count: int = 1) -> String:
	var bits = file_path.replace("res://", "").replace(".dialogue", "").split("/")
	bits = bits.slice(-path_bit_count)
	return "/".join(bits)


func apply_filter() -> void:
	list.clear()
	for file in file_map.keys():
		if filter == "" or filter.to_lower() in file.to_lower():
			var nice_file = file_map[file]
			if file in unsaved_files:
				nice_file += MODIFIED_SUFFIX
			var new_id := list.add_item(nice_file)
			list.set_item_icon(new_id, icon)

	select_file(current_file_path)


func apply_theme() -> void:
	if is_instance_valid(filter_edit):
		filter_edit.right_icon = get_theme_icon("Search", "EditorIcons")
	if is_instance_valid(list):
		list.add_theme_stylebox_override("panel", get_theme_stylebox("panel", "Panel"))


### Signals


func _on_theme_changed() -> void:
	apply_theme()


func _on_filter_edit_text_changed(new_text: String) -> void:
	self.filter = new_text


func _on_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	var item_text = list.get_item_text(index).replace(MODIFIED_SUFFIX, "")
	var file = file_map.find_key(item_text)

	if mouse_button_index == MOUSE_BUTTON_LEFT or mouse_button_index == MOUSE_BUTTON_RIGHT:
		select_file(file)
		file_selected.emit(file)
		if mouse_button_index == MOUSE_BUTTON_RIGHT:
			file_popup_menu_requested.emit(at_position)

	if mouse_button_index == MOUSE_BUTTON_MIDDLE:
		file_middle_clicked.emit(file)


func _on_list_item_activated(index: int) -> void:
	var item_text = list.get_item_text(index).replace(MODIFIED_SUFFIX, "")
	var file = file_map.find_key(item_text)
	select_file(file)
	file_double_clicked.emit(file)
```

## File: addons/dialogue_manager/components/files_list.gd.uid
```
uid://dqa4a4wwoo0aa
```

## File: addons/dialogue_manager/components/files_list.tscn
```
[gd_scene load_steps=3 format=3 uid="uid://dnufpcdrreva3"]

[ext_resource type="Script" uid="uid://dqa4a4wwoo0aa" path="res://addons/dialogue_manager/components/files_list.gd" id="1_cytii"]
[ext_resource type="Texture2D" uid="uid://d3lr2uas6ax8v" path="res://addons/dialogue_manager/assets/icon.svg" id="2_3ijx1"]

[node name="FilesList" type="VBoxContainer"]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2
size_flags_vertical = 3
script = ExtResource("1_cytii")
icon = ExtResource("2_3ijx1")

[node name="FilterEdit" type="LineEdit" parent="."]
layout_mode = 2
placeholder_text = "Filter files"
clear_button_enabled = true

[node name="List" type="ItemList" parent="."]
layout_mode = 2
size_flags_vertical = 3
allow_rmb_select = true

[connection signal="theme_changed" from="." to="." method="_on_theme_changed"]
[connection signal="text_changed" from="FilterEdit" to="." method="_on_filter_edit_text_changed"]
[connection signal="item_activated" from="List" to="." method="_on_list_item_activated"]
[connection signal="item_clicked" from="List" to="." method="_on_list_item_clicked"]
```

## File: addons/dialogue_manager/components/search_and_replace.gd
```
@tool
extends VBoxContainer


signal open_requested()
signal close_requested()


const DialogueConstants = preload("../constants.gd")


@onready var input: LineEdit = $Search/Input
@onready var result_label: Label = $Search/ResultLabel
@onready var previous_button: Button = $Search/PreviousButton
@onready var next_button: Button = $Search/NextButton
@onready var match_case_button: CheckBox = $Search/MatchCaseCheckBox
@onready var replace_check_button: CheckButton = $Search/ReplaceCheckButton
@onready var replace_panel: HBoxContainer = $Replace
@onready var replace_input: LineEdit = $Replace/Input
@onready var replace_button: Button = $Replace/ReplaceButton
@onready var replace_all_button: Button = $Replace/ReplaceAllButton

# The code edit we will be affecting (for some reason exporting this didn't work)
var code_edit: CodeEdit:
	set(next_code_edit):
		code_edit = next_code_edit
		code_edit.gui_input.connect(_on_text_edit_gui_input)
		code_edit.text_changed.connect(_on_text_edit_text_changed)
	get:
		return code_edit

var results: Array = []
var result_index: int = -1:
	set(next_result_index):
		result_index = next_result_index
		if results.size() > 0:
			var r = results[result_index]
			code_edit.set_caret_line(r[0])
			code_edit.select(r[0], r[1], r[0], r[1] + r[2])
			code_edit.center_viewport_to_caret()
		else:
			result_index = -1
			if is_instance_valid(code_edit):
				code_edit.deselect()

		result_label.text = DialogueConstants.translate(&"n_of_n").format({ index = result_index + 1, total = results.size() })
	get:
		return result_index


func _ready() -> void:
	apply_theme()

	input.placeholder_text = DialogueConstants.translate(&"search.placeholder")
	previous_button.tooltip_text = DialogueConstants.translate(&"search.previous")
	next_button.tooltip_text = DialogueConstants.translate(&"search.next")
	match_case_button.text = DialogueConstants.translate(&"search.match_case")
	$Search/ReplaceCheckButton.text = DialogueConstants.translate(&"search.toggle_replace")
	replace_button.text = DialogueConstants.translate(&"search.replace")
	replace_all_button.text = DialogueConstants.translate(&"search.replace_all")
	$Replace/ReplaceLabel.text = DialogueConstants.translate(&"search.replace_with")

	self.result_index = -1

	replace_panel.hide()
	replace_button.disabled = true
	replace_all_button.disabled = true

	hide()


func focus_line_edit() -> void:
	input.grab_focus()
	input.select_all()
	search()


func apply_theme() -> void:
	if is_instance_valid(previous_button):
		previous_button.icon = get_theme_icon("ArrowLeft", "EditorIcons")
	if is_instance_valid(next_button):
		next_button.icon = get_theme_icon("ArrowRight", "EditorIcons")


# Find text in the code
func search(text: String = "", default_result_index: int = 0) -> void:
	results.clear()

	if text == "":
		text = input.text

	var lines = code_edit.text.split("\n")
	for line_number in range(0, lines.size()):
		var line = lines[line_number]

		var column = find_in_line(line, text, 0)
		while column > -1:
			results.append([line_number, column, text.length()])
			column = find_in_line(line, text, column + 1)

	if results.size() > 0:
		replace_button.disabled = false
		replace_all_button.disabled = false
	else:
		replace_button.disabled = true
		replace_all_button.disabled = true

	self.result_index = clamp(default_result_index, 0, results.size() - 1)


# Find text in a string and match case if requested
func find_in_line(line: String, text: String, from_index: int = 0) -> int:
	if match_case_button.button_pressed:
		return line.find(text, from_index)
	else:
		return line.findn(text, from_index)


#region Signals


func _on_text_edit_gui_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		match event.as_text():
			"Ctrl+F", "Command+F":
				open_requested.emit()
				get_viewport().set_input_as_handled()
			"Ctrl+Shift+R", "Command+Shift+R":
				replace_check_button.set_pressed(true)
				open_requested.emit()
				get_viewport().set_input_as_handled()


func _on_text_edit_text_changed() -> void:
	results.clear()


func _on_search_and_replace_theme_changed() -> void:
	apply_theme()


func _on_input_text_changed(new_text: String) -> void:
	search(new_text)


func _on_previous_button_pressed() -> void:
	self.result_index = wrapi(result_index - 1, 0, results.size())


func _on_next_button_pressed() -> void:
	self.result_index = wrapi(result_index + 1, 0, results.size())


func _on_search_and_replace_visibility_changed() -> void:
	if is_instance_valid(input):
		if visible:
			input.grab_focus()
			var selection = code_edit.get_selected_text()
			if input.text == "" and selection != "":
				input.text = selection
				search(selection)
			else:
				search()
		else:
			input.text = ""


func _on_input_gui_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		match event.as_text():
			"Enter":
				if results.size() == 0:
					search(input.text)
				self.result_index = wrapi(result_index + 1, 0, results.size())
			"Escape":
				emit_signal("close_requested")


func _on_replace_button_pressed() -> void:
	if result_index == -1: return

	# Replace the selection at result index
	var r: Array = results[result_index]
	code_edit.begin_complex_operation()
	var lines: PackedStringArray = code_edit.text.split("\n")
	var line: String = lines[r[0]]
	line = line.substr(0, r[1]) + replace_input.text + line.substr(r[1] + r[2])
	lines[r[0]] = line
	code_edit.text = "\n".join(lines)
	code_edit.end_complex_operation()
	code_edit.text_changed.emit()

	search(input.text, result_index)


func _on_replace_all_button_pressed() -> void:
	if match_case_button.button_pressed:
		code_edit.text = code_edit.text.replace(input.text, replace_input.text)
	else:
		code_edit.text = code_edit.text.replacen(input.text, replace_input.text)
	search()
	code_edit.text_changed.emit()


func _on_replace_check_button_toggled(button_pressed: bool) -> void:
	replace_panel.visible = button_pressed
	if button_pressed:
		replace_input.grab_focus()


func _on_input_focus_entered() -> void:
	if results.size() == 0:
		search()
	else:
		self.result_index = result_index


func _on_match_case_check_box_toggled(button_pressed: bool) -> void:
	search()


#endregion
```

## File: addons/dialogue_manager/components/search_and_replace.gd.uid
```
uid://cijsmjkq21cdq
```

## File: addons/dialogue_manager/components/search_and_replace.tscn
```
[gd_scene load_steps=2 format=3 uid="uid://gr8nakpbrhby"]

[ext_resource type="Script" uid="uid://cijsmjkq21cdq" path="res://addons/dialogue_manager/components/search_and_replace.gd" id="1_8oj1f"]

[node name="SearchAndReplace" type="VBoxContainer"]
visible = false
anchors_preset = 10
anchor_right = 1.0
offset_bottom = 31.0
grow_horizontal = 2
size_flags_horizontal = 3
script = ExtResource("1_8oj1f")

[node name="Search" type="HBoxContainer" parent="."]
layout_mode = 2

[node name="Input" type="LineEdit" parent="Search"]
layout_mode = 2
size_flags_horizontal = 3
placeholder_text = "Text to search for"
metadata/_edit_use_custom_anchors = true

[node name="MatchCaseCheckBox" type="CheckBox" parent="Search"]
layout_mode = 2
text = "Match case"

[node name="VSeparator" type="VSeparator" parent="Search"]
layout_mode = 2

[node name="PreviousButton" type="Button" parent="Search"]
layout_mode = 2
tooltip_text = "Previous"
flat = true

[node name="ResultLabel" type="Label" parent="Search"]
layout_mode = 2
text = "0 of 0"

[node name="NextButton" type="Button" parent="Search"]
layout_mode = 2
tooltip_text = "Next"
flat = true

[node name="VSeparator2" type="VSeparator" parent="Search"]
layout_mode = 2

[node name="ReplaceCheckButton" type="CheckButton" parent="Search"]
layout_mode = 2
text = "Replace"

[node name="Replace" type="HBoxContainer" parent="."]
visible = false
layout_mode = 2

[node name="ReplaceLabel" type="Label" parent="Replace"]
layout_mode = 2
text = "Replace with:"

[node name="Input" type="LineEdit" parent="Replace"]
layout_mode = 2
size_flags_horizontal = 3

[node name="ReplaceButton" type="Button" parent="Replace"]
layout_mode = 2
disabled = true
text = "Replace"
flat = true

[node name="ReplaceAllButton" type="Button" parent="Replace"]
layout_mode = 2
disabled = true
text = "Replace all"
flat = true

[connection signal="theme_changed" from="." to="." method="_on_search_and_replace_theme_changed"]
[connection signal="visibility_changed" from="." to="." method="_on_search_and_replace_visibility_changed"]
[connection signal="focus_entered" from="Search/Input" to="." method="_on_input_focus_entered"]
[connection signal="gui_input" from="Search/Input" to="." method="_on_input_gui_input"]
[connection signal="text_changed" from="Search/Input" to="." method="_on_input_text_changed"]
[connection signal="toggled" from="Search/MatchCaseCheckBox" to="." method="_on_match_case_check_box_toggled"]
[connection signal="pressed" from="Search/PreviousButton" to="." method="_on_previous_button_pressed"]
[connection signal="pressed" from="Search/NextButton" to="." method="_on_next_button_pressed"]
[connection signal="toggled" from="Search/ReplaceCheckButton" to="." method="_on_replace_check_button_toggled"]
[connection signal="focus_entered" from="Replace/Input" to="." method="_on_input_focus_entered"]
[connection signal="gui_input" from="Replace/Input" to="." method="_on_input_gui_input"]
[connection signal="pressed" from="Replace/ReplaceButton" to="." method="_on_replace_button_pressed"]
[connection signal="pressed" from="Replace/ReplaceAllButton" to="." method="_on_replace_all_button_pressed"]
```

## File: addons/dialogue_manager/components/title_list.gd
```
@tool
extends VBoxContainer

signal title_selected(title: String)


const DialogueConstants = preload("../constants.gd")


@onready var filter_edit: LineEdit = $FilterEdit
@onready var list: ItemList = $List

var titles: PackedStringArray:
	set(next_titles):
		titles = next_titles
		apply_filter()
	get:
		return titles

var filter: String:
	set(next_filter):
		filter = next_filter
		apply_filter()
	get:
		return filter


func _ready() -> void:
	apply_theme()

	filter_edit.placeholder_text = DialogueConstants.translate(&"titles_list.filter")


func select_title(title: String) -> void:
	list.deselect_all()
	for i in range(0, list.get_item_count()):
		if list.get_item_text(i) == title.strip_edges():
			list.select(i)


func apply_filter() -> void:
	list.clear()
	for title in titles:
		if filter == "" or filter.to_lower() in title.to_lower():
			list.add_item(title.strip_edges())


func apply_theme() -> void:
	if is_instance_valid(filter_edit):
		filter_edit.right_icon = get_theme_icon("Search", "EditorIcons")
	if is_instance_valid(list):
		list.add_theme_stylebox_override("panel", get_theme_stylebox("panel", "Panel"))


### Signals


func _on_theme_changed() -> void:
	apply_theme()


func _on_filter_edit_text_changed(new_text: String) -> void:
	self.filter = new_text


func _on_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if mouse_button_index == MOUSE_BUTTON_LEFT:
		var title = list.get_item_text(index)
		title_selected.emit(title)
```

## File: addons/dialogue_manager/components/title_list.gd.uid
```
uid://d0k2wndjj0ifm
```

## File: addons/dialogue_manager/components/title_list.tscn
```
[gd_scene load_steps=2 format=3 uid="uid://ctns6ouwwd68i"]

[ext_resource type="Script" uid="uid://d0k2wndjj0ifm" path="res://addons/dialogue_manager/components/title_list.gd" id="1_5qqmd"]

[node name="TitleList" type="VBoxContainer"]
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2
size_flags_horizontal = 3
size_flags_vertical = 3
script = ExtResource("1_5qqmd")

[node name="FilterEdit" type="LineEdit" parent="."]
layout_mode = 2
placeholder_text = "Filter titles"
clear_button_enabled = true

[node name="List" type="ItemList" parent="."]
layout_mode = 2
size_flags_vertical = 3
allow_reselect = true

[connection signal="theme_changed" from="." to="." method="_on_theme_changed"]
[connection signal="text_changed" from="FilterEdit" to="." method="_on_filter_edit_text_changed"]
[connection signal="item_clicked" from="List" to="." method="_on_list_item_clicked"]
```

## File: addons/dialogue_manager/components/update_button.gd
```
@tool
extends Button

const DialogueConstants = preload("../constants.gd")
const DialogueSettings = preload("../settings.gd")

const REMOTE_RELEASES_URL = "https://api.github.com/repos/nathanhoad/godot_dialogue_manager/releases"


@onready var http_request: HTTPRequest = $HTTPRequest
@onready var download_dialog: AcceptDialog = $DownloadDialog
@onready var download_update_panel = $DownloadDialog/DownloadUpdatePanel
@onready var needs_reload_dialog: AcceptDialog = $NeedsReloadDialog
@onready var update_failed_dialog: AcceptDialog = $UpdateFailedDialog
@onready var timer: Timer = $Timer

var needs_reload: bool = false

# A lambda that gets called just before refreshing the plugin. Return false to stop the reload.
var on_before_refresh: Callable = func(): return true


func _ready() -> void:
	hide()
	apply_theme()

	# Check for updates on GitHub
	check_for_update()

	# Check again every few hours
	timer.start(60 * 60 * 12)


# Convert a version number to an actually comparable number
func version_to_number(version: String) -> int:
	var bits = version.split(".")
	return bits[0].to_int() * 1000000 + bits[1].to_int() * 1000 + bits[2].to_int()


func apply_theme() -> void:
	var color: Color = get_theme_color("success_color", "Editor")

	if needs_reload:
		color = get_theme_color("error_color", "Editor")
		icon = get_theme_icon("Reload", "EditorIcons")
		add_theme_color_override("icon_normal_color", color)
		add_theme_color_override("icon_focus_color", color)
		add_theme_color_override("icon_hover_color", color)

	add_theme_color_override("font_color", color)
	add_theme_color_override("font_focus_color", color)
	add_theme_color_override("font_hover_color", color)


func check_for_update() -> void:
	if DialogueSettings.get_user_value("check_for_updates", true):
		http_request.request(REMOTE_RELEASES_URL)


### Signals


func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if result != HTTPRequest.RESULT_SUCCESS: return

	var current_version: String = DMPlugin.get_version()

	# Work out the next version from the releases information on GitHub
	var response = JSON.parse_string(body.get_string_from_utf8())
	if typeof(response) != TYPE_ARRAY: return

	# GitHub releases are in order of creation, not order of version
	var versions = (response as Array).filter(func(release):
		var version: String = release.tag_name.substr(1)
		var major_version: int = version.split(".")[0].to_int()
		var current_major_version: int = current_version.split(".")[0].to_int()
		return major_version == current_major_version and version_to_number(version) > version_to_number(current_version)
	)
	if versions.size() > 0:
		download_update_panel.next_version_release = versions[0]
		text = DialogueConstants.translate(&"update.available").format({ version = versions[0].tag_name.substr(1) })
		show()


func _on_update_button_pressed() -> void:
	if needs_reload:
		var will_refresh = on_before_refresh.call()
		if will_refresh:
			EditorInterface.restart_editor(true)
	else:
		var scale: float = EditorInterface.get_editor_scale()
		download_dialog.min_size = Vector2(300, 250) * scale
		download_dialog.popup_centered()


func _on_download_dialog_close_requested() -> void:
	download_dialog.hide()


func _on_download_update_panel_updated(updated_to_version: String) -> void:
	download_dialog.hide()

	needs_reload_dialog.dialog_text = DialogueConstants.translate(&"update.needs_reload")
	needs_reload_dialog.ok_button_text = DialogueConstants.translate(&"update.reload_ok_button")
	needs_reload_dialog.cancel_button_text = DialogueConstants.translate(&"update.reload_cancel_button")
	needs_reload_dialog.popup_centered()

	needs_reload = true
	text = DialogueConstants.translate(&"update.reload_project")
	apply_theme()


func _on_download_update_panel_failed() -> void:
	download_dialog.hide()
	update_failed_dialog.dialog_text = DialogueConstants.translate(&"update.failed")
	update_failed_dialog.popup_centered()


func _on_needs_reload_dialog_confirmed() -> void:
	EditorInterface.restart_editor(true)


func _on_timer_timeout() -> void:
	if not needs_reload:
		check_for_update()
```

## File: addons/dialogue_manager/components/update_button.gd.uid
```
uid://cr1tt12dh5ecr
```

## File: addons/dialogue_manager/components/update_button.tscn
```
[gd_scene load_steps=3 format=3 uid="uid://co8yl23idiwbi"]

[ext_resource type="Script" uid="uid://cr1tt12dh5ecr" path="res://addons/dialogue_manager/components/update_button.gd" id="1_d2tpb"]
[ext_resource type="PackedScene" uid="uid://qdxrxv3c3hxk" path="res://addons/dialogue_manager/components/download_update_panel.tscn" id="2_iwm7r"]

[node name="UpdateButton" type="Button"]
visible = false
offset_right = 8.0
offset_bottom = 8.0
theme_override_colors/font_color = Color(0, 0, 0, 1)
theme_override_colors/font_hover_color = Color(0, 0, 0, 1)
theme_override_colors/font_focus_color = Color(0, 0, 0, 1)
text = "v2.9.0 available"
flat = true
script = ExtResource("1_d2tpb")

[node name="HTTPRequest" type="HTTPRequest" parent="."]

[node name="DownloadDialog" type="AcceptDialog" parent="."]
title = "Download update"
size = Vector2i(400, 300)
unresizable = true
min_size = Vector2i(300, 250)
ok_button_text = "Close"

[node name="DownloadUpdatePanel" parent="DownloadDialog" instance=ExtResource("2_iwm7r")]

[node name="UpdateFailedDialog" type="AcceptDialog" parent="."]
dialog_text = "You have been updated to version 2.4.3"

[node name="NeedsReloadDialog" type="ConfirmationDialog" parent="."]

[node name="Timer" type="Timer" parent="."]
wait_time = 14400.0

[connection signal="pressed" from="." to="." method="_on_update_button_pressed"]
[connection signal="request_completed" from="HTTPRequest" to="." method="_on_http_request_request_completed"]
[connection signal="close_requested" from="DownloadDialog" to="." method="_on_download_dialog_close_requested"]
[connection signal="failed" from="DownloadDialog/DownloadUpdatePanel" to="." method="_on_download_update_panel_failed"]
[connection signal="updated" from="DownloadDialog/DownloadUpdatePanel" to="." method="_on_download_update_panel_updated"]
[connection signal="confirmed" from="NeedsReloadDialog" to="." method="_on_needs_reload_dialog_confirmed"]
[connection signal="timeout" from="Timer" to="." method="_on_timer_timeout"]
```

## File: addons/dialogue_manager/example_balloon/example_balloon.gd
```
class_name DialogueManagerExampleBalloon extends CanvasLayer
## A basic dialogue balloon for use with Dialogue Manager.


## The dialogue resource
@export var dialogue_resource: DialogueResource

## Start from a given title when using balloon as a [Node] in a scene.
@export var start_from_title: String = ""

## If running as a [Node] in a scene then auto start the dialogue.
@export var auto_start: bool = false

## The action to use for advancing the dialogue
@export var next_action: StringName = &"ui_accept"

## The action to use to skip typing the dialogue
@export var skip_action: StringName = &"ui_cancel"

## A sound player for voice lines (if they exist).
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer

## Temporary game states
var temporary_game_states: Array = []

## See if we are waiting for the player
var is_waiting_for_input: bool = false

## See if we are running a long mutation and should hide the balloon
var will_hide_balloon: bool = false

## A dictionary to store any ephemeral variables
var locals: Dictionary = {}

var _locale: String = TranslationServer.get_locale()

## The current line
var dialogue_line: DialogueLine:
	set(value):
		if value:
			dialogue_line = value
			apply_dialogue_line()
		else:
			# The dialogue has finished so close the balloon
			if owner == null:
				queue_free()
			else:
				hide()
	get:
		return dialogue_line

## A cooldown timer for delaying the balloon hide when encountering a mutation.
var mutation_cooldown: Timer = Timer.new()

## The base balloon anchor
@onready var balloon: Control = %Balloon

## The label showing the name of the currently speaking character
@onready var character_label: RichTextLabel = %CharacterLabel

## The label showing the currently spoken dialogue
@onready var dialogue_label: DialogueLabel = %DialogueLabel

## The menu of responses
@onready var responses_menu: DialogueResponsesMenu = %ResponsesMenu

## Indicator to show that player can progress dialogue.
@onready var progress: Polygon2D = %Progress


func _ready() -> void:
	balloon.hide()
	Engine.get_singleton("DialogueManager").mutated.connect(_on_mutated)

	# If the responses menu doesn't have a next action set, use this one
	if responses_menu.next_action.is_empty():
		responses_menu.next_action = next_action

	mutation_cooldown.timeout.connect(_on_mutation_cooldown_timeout)
	add_child(mutation_cooldown)

	if auto_start:
		if not is_instance_valid(dialogue_resource):
			assert(false, DMConstants.get_error_message(DMConstants.ERR_MISSING_RESOURCE_FOR_AUTOSTART))
		start()


func _process(delta: float) -> void:
	if is_instance_valid(dialogue_line):
		progress.visible = not dialogue_label.is_typing and dialogue_line.responses.size() == 0 and not dialogue_line.has_tag("voice")


func _unhandled_input(_event: InputEvent) -> void:
	# Only the balloon is allowed to handle input while it's showing
	get_viewport().set_input_as_handled()


func _notification(what: int) -> void:
	## Detect a change of locale and update the current dialogue line to show the new language
	if what == NOTIFICATION_TRANSLATION_CHANGED and _locale != TranslationServer.get_locale() and is_instance_valid(dialogue_label):
		_locale = TranslationServer.get_locale()
		var visible_ratio: float = dialogue_label.visible_ratio
		dialogue_line = await dialogue_resource.get_next_dialogue_line(dialogue_line.id)
		if visible_ratio < 1:
			dialogue_label.skip_typing()


## Start some dialogue
func start(with_dialogue_resource: DialogueResource = null, title: String = "", extra_game_states: Array = []) -> void:
	temporary_game_states = [self] + extra_game_states
	is_waiting_for_input = false
	if is_instance_valid(with_dialogue_resource):
		dialogue_resource = with_dialogue_resource
	if not title.is_empty():
		start_from_title = title
	dialogue_line = await dialogue_resource.get_next_dialogue_line(start_from_title, temporary_game_states)
	show()


## Apply any changes to the balloon given a new [DialogueLine].
func apply_dialogue_line() -> void:
	mutation_cooldown.stop()

	progress.hide()
	is_waiting_for_input = false
	balloon.focus_mode = Control.FOCUS_ALL
	balloon.grab_focus()

	character_label.visible = not dialogue_line.character.is_empty()
	character_label.text = tr(dialogue_line.character, "dialogue")

	dialogue_label.hide()
	dialogue_label.dialogue_line = dialogue_line

	responses_menu.hide()
	responses_menu.responses = dialogue_line.responses

	# Show our balloon
	balloon.show()
	will_hide_balloon = false

	dialogue_label.show()
	if not dialogue_line.text.is_empty():
		dialogue_label.type_out()
		await dialogue_label.finished_typing

	# Wait for next line
	if dialogue_line.has_tag("voice"):
		audio_stream_player.stream = load(dialogue_line.get_tag_value("voice"))
		audio_stream_player.play()
		await audio_stream_player.finished
		next(dialogue_line.next_id)
	elif dialogue_line.responses.size() > 0:
		balloon.focus_mode = Control.FOCUS_NONE
		responses_menu.show()
	elif dialogue_line.time != "":
		var time: float = dialogue_line.text.length() * 0.02 if dialogue_line.time == "auto" else dialogue_line.time.to_float()
		await get_tree().create_timer(time).timeout
		next(dialogue_line.next_id)
	else:
		is_waiting_for_input = true
		balloon.focus_mode = Control.FOCUS_ALL
		balloon.grab_focus()


## Go to the next line
func next(next_id: String) -> void:
	dialogue_line = await dialogue_resource.get_next_dialogue_line(next_id, temporary_game_states)


#region Signals


func _on_mutation_cooldown_timeout() -> void:
	if will_hide_balloon:
		will_hide_balloon = false
		balloon.hide()


func _on_mutated(_mutation: Dictionary) -> void:
	if not _mutation.is_inline:
		is_waiting_for_input = false
		will_hide_balloon = true
		mutation_cooldown.start(0.1)


func _on_balloon_gui_input(event: InputEvent) -> void:
	# See if we need to skip typing of the dialogue
	if dialogue_label.is_typing:
		var mouse_was_clicked: bool = event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed()
		var skip_button_was_pressed: bool = event.is_action_pressed(skip_action)
		if mouse_was_clicked or skip_button_was_pressed:
			get_viewport().set_input_as_handled()
			dialogue_label.skip_typing()
			return

	if not is_waiting_for_input: return
	if dialogue_line.responses.size() > 0: return

	# When there are no response options the balloon itself is the clickable thing
	get_viewport().set_input_as_handled()

	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		next(dialogue_line.next_id)
	elif event.is_action_pressed(next_action) and get_viewport().gui_get_focus_owner() == balloon:
		next(dialogue_line.next_id)


func _on_responses_menu_response_selected(response: DialogueResponse) -> void:
	next(response.next_id)


#endregion
```

## File: addons/dialogue_manager/example_balloon/example_balloon.gd.uid
```
uid://d1wt4ma6055l8
```

## File: addons/dialogue_manager/example_balloon/example_balloon.tscn
```
[gd_scene load_steps=12 format=3 uid="uid://73jm5qjy52vq"]

[ext_resource type="Script" uid="uid://d1wt4ma6055l8" path="res://addons/dialogue_manager/example_balloon/example_balloon.gd" id="1_36de5"]
[ext_resource type="PackedScene" uid="uid://ckvgyvclnwggo" path="res://addons/dialogue_manager/dialogue_label.tscn" id="2_a8ve6"]
[ext_resource type="Script" uid="uid://bb52rsfwhkxbn" path="res://addons/dialogue_manager/dialogue_responses_menu.gd" id="3_72ixx"]

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_spyqn"]
bg_color = Color(0, 0, 0, 1)
border_width_left = 3
border_width_top = 3
border_width_right = 3
border_width_bottom = 3
border_color = Color(0.329412, 0.329412, 0.329412, 1)
corner_radius_top_left = 5
corner_radius_top_right = 5
corner_radius_bottom_right = 5
corner_radius_bottom_left = 5

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ri4m3"]
bg_color = Color(0.121569, 0.121569, 0.121569, 1)
border_width_left = 3
border_width_top = 3
border_width_right = 3
border_width_bottom = 3
border_color = Color(1, 1, 1, 1)
corner_radius_top_left = 5
corner_radius_top_right = 5
corner_radius_bottom_right = 5
corner_radius_bottom_left = 5

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_e0njw"]
bg_color = Color(0, 0, 0, 1)
border_width_left = 3
border_width_top = 3
border_width_right = 3
border_width_bottom = 3
border_color = Color(0.6, 0.6, 0.6, 1)
corner_radius_top_left = 5
corner_radius_top_right = 5
corner_radius_bottom_right = 5
corner_radius_bottom_left = 5

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_qkmqt"]
bg_color = Color(0, 0, 0, 1)
border_width_left = 3
border_width_top = 3
border_width_right = 3
border_width_bottom = 3
corner_radius_top_left = 5
corner_radius_top_right = 5
corner_radius_bottom_right = 5
corner_radius_bottom_left = 5

[sub_resource type="Theme" id="Theme_qq3yp"]
default_font_size = 20
Button/styles/disabled = SubResource("StyleBoxFlat_spyqn")
Button/styles/focus = SubResource("StyleBoxFlat_ri4m3")
Button/styles/hover = SubResource("StyleBoxFlat_e0njw")
Button/styles/normal = SubResource("StyleBoxFlat_e0njw")
MarginContainer/constants/margin_bottom = 15
MarginContainer/constants/margin_left = 30
MarginContainer/constants/margin_right = 30
MarginContainer/constants/margin_top = 15
PanelContainer/styles/panel = SubResource("StyleBoxFlat_qkmqt")

[sub_resource type="Animation" id="Animation_nlsx6"]
length = 0.001
tracks/0/type = "bezier"
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/path = NodePath("Progress:position:y")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/keys = {
"handle_modes": PackedInt32Array(0),
"points": PackedFloat32Array(0, -0.25, 0, 0.25, 0),
"times": PackedFloat32Array(0)
}

[sub_resource type="Animation" id="Animation_qkmqt"]
resource_name = "progress"
loop_mode = 1
step = 0.1
tracks/0/type = "bezier"
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/path = NodePath("Progress:position:y")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/keys = {
"handle_modes": PackedInt32Array(0, 0, 0, 0, 0),
"points": PackedFloat32Array(0, -0.25, 0, 0.25, 0, 0, -0.25, 0, 0.2, -0.0157438, -4, -0.2, 0.0112069, 0.25, 0, -4, -0.25, 0, 0.25, 0, 0, -0.2, 0.00299701, 0.25, 0),
"times": PackedFloat32Array(0, 0.1, 0.5, 0.6, 1)
}

[sub_resource type="AnimationLibrary" id="AnimationLibrary_1337t"]
_data = {
&"RESET": SubResource("Animation_nlsx6"),
&"progress": SubResource("Animation_qkmqt")
}

[node name="ExampleBalloon" type="CanvasLayer"]
layer = 100
script = ExtResource("1_36de5")

[node name="Balloon" type="Control" parent="."]
unique_name_in_owner = true
layout_mode = 3
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2
theme = SubResource("Theme_qq3yp")

[node name="MarginContainer" type="MarginContainer" parent="Balloon"]
layout_mode = 1
anchors_preset = 12
anchor_top = 1.0
anchor_right = 1.0
anchor_bottom = 1.0
offset_top = -219.0
grow_horizontal = 2
grow_vertical = 0

[node name="PanelContainer" type="PanelContainer" parent="Balloon/MarginContainer"]
clip_children = 2
layout_mode = 2
mouse_filter = 1

[node name="MarginContainer" type="MarginContainer" parent="Balloon/MarginContainer/PanelContainer"]
layout_mode = 2

[node name="HBoxContainer" type="HBoxContainer" parent="Balloon/MarginContainer/PanelContainer/MarginContainer"]
layout_mode = 2

[node name="VBoxContainer" type="VBoxContainer" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer"]
layout_mode = 2
size_flags_horizontal = 3

[node name="CharacterLabel" type="RichTextLabel" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer"]
unique_name_in_owner = true
modulate = Color(1, 1, 1, 0.501961)
layout_mode = 2
mouse_filter = 1
bbcode_enabled = true
text = "Character"
fit_content = true
scroll_active = false

[node name="DialogueLabel" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer" instance=ExtResource("2_a8ve6")]
unique_name_in_owner = true
layout_mode = 2
size_flags_vertical = 3
text = "Dialogue..."

[node name="Control" type="Control" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer"]
custom_minimum_size = Vector2(20, 10)
layout_mode = 2
size_flags_vertical = 8

[node name="Progress" type="Polygon2D" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/Control"]
unique_name_in_owner = true
polygon = PackedVector2Array(0, 0, 10, 10, 20, 0)

[node name="AnimationPlayer" type="AnimationPlayer" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/Control"]
libraries = {
&"": SubResource("AnimationLibrary_1337t")
}
autoplay = "progress"

[node name="ResponsesMenu" type="VBoxContainer" parent="Balloon" node_paths=PackedStringArray("response_template")]
unique_name_in_owner = true
layout_mode = 1
anchors_preset = 8
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
offset_left = -290.5
offset_top = -35.0
offset_right = 290.5
offset_bottom = 35.0
grow_horizontal = 2
grow_vertical = 2
size_flags_vertical = 8
theme_override_constants/separation = 2
alignment = 1
script = ExtResource("3_72ixx")
response_template = NodePath("ResponseExample")

[node name="ResponseExample" type="Button" parent="Balloon/ResponsesMenu"]
layout_mode = 2
text = "Response example"

[node name="AudioStreamPlayer" type="AudioStreamPlayer" parent="."]
unique_name_in_owner = true

[connection signal="gui_input" from="Balloon" to="." method="_on_balloon_gui_input"]
[connection signal="response_selected" from="Balloon/ResponsesMenu" to="." method="_on_responses_menu_response_selected"]
```

## File: addons/dialogue_manager/example_balloon/ExampleBalloon.cs
```csharp
using Godot;
using Godot.Collections;

namespace DialogueManagerRuntime
{
  public partial class ExampleBalloon : CanvasLayer
  {
    [Export] public Resource DialogueResource;
    [Export] public string StartFromTitle = "";
    [Export] public bool AutoStart = false;
    [Export] public string NextAction = "ui_accept";
    [Export] public string SkipAction = "ui_cancel";


    Control balloon;
    RichTextLabel characterLabel;
    RichTextLabel dialogueLabel;
    VBoxContainer responsesMenu;
    Polygon2D progress;

    Array<Variant> temporaryGameStates = new Array<Variant>();
    bool isWaitingForInput = false;
    bool willHideBalloon = false;

    DialogueLine dialogueLine;
    DialogueLine DialogueLine
    {
      get => dialogueLine;
      set
      {
        // Dialogue has finished so close the balloon
        if (value == null)
        {
          if (Owner == null)
          {
            QueueFree();
          }
          else
          {
            Hide();
          }
          return;
        }

        dialogueLine = value;
        ApplyDialogueLine();
      }
    }

    Timer MutationCooldown = new Timer();


    public override void _Ready()
    {
      balloon = GetNode<Control>("%Balloon");
      characterLabel = GetNode<RichTextLabel>("%CharacterLabel");
      dialogueLabel = GetNode<RichTextLabel>("%DialogueLabel");
      responsesMenu = GetNode<VBoxContainer>("%ResponsesMenu");
      progress = GetNode<Polygon2D>("%Progress");

      balloon.Hide();

      balloon.GuiInput += (@event) =>
      {
        if ((bool)dialogueLabel.Get("is_typing"))
        {
          bool mouseWasClicked = @event is InputEventMouseButton && (@event as InputEventMouseButton).ButtonIndex == MouseButton.Left && @event.IsPressed();
          bool skipButtonWasPressed = @event.IsActionPressed(SkipAction);
          if (mouseWasClicked || skipButtonWasPressed)
          {
            GetViewport().SetInputAsHandled();
            dialogueLabel.Call("skip_typing");
            return;
          }
        }

        if (!isWaitingForInput) return;
        if (dialogueLine.Responses.Count > 0) return;

        GetViewport().SetInputAsHandled();

        if (@event is InputEventMouseButton && @event.IsPressed() && (@event as InputEventMouseButton).ButtonIndex == MouseButton.Left)
        {
          Next(dialogueLine.NextId);
        }
        else if (@event.IsActionPressed(NextAction) && GetViewport().GuiGetFocusOwner() == balloon)
        {
          Next(dialogueLine.NextId);
        }
      };

      if (string.IsNullOrEmpty((string)responsesMenu.Get("next_action")))
      {
        responsesMenu.Set("next_action", NextAction);
      }
      responsesMenu.Connect("response_selected", Callable.From((DialogueResponse response) =>
      {
        Next(response.NextId);
      }));


      // Hide the balloon when a mutation is running
      MutationCooldown.Timeout += () =>
      {
        if (willHideBalloon)
        {
          willHideBalloon = false;
          balloon.Hide();
        }
      };
      AddChild(MutationCooldown);

      DialogueManager.Mutated += OnMutated;

      if (AutoStart)
      {
        if (!IsInstanceValid(DialogueResource))
        {
          throw new System.Exception(DialogueManager.GetErrorMessage(143));
        }
        Start();
      }
    }


    public override void _ExitTree()
    {
      DialogueManager.Mutated -= OnMutated;
    }


    public override void _UnhandledInput(InputEvent @event)
    {
      // Only the balloon is allowed to handle input while it's showing
      GetViewport().SetInputAsHandled();
    }


    public override async void _Notification(int what)
    {
      // Detect a change of locale and update the current dialogue line to show the new language
      if (what == NotificationTranslationChanged && IsInstanceValid(dialogueLabel))
      {
        float visibleRatio = dialogueLabel.VisibleRatio;
        DialogueLine = await DialogueManager.GetNextDialogueLine(DialogueResource, DialogueLine.Id, temporaryGameStates);
        if (visibleRatio < 1.0f)
        {
          dialogueLabel.Call("skip_typing");
        }
      }
    }


    public override void _Process(double delta)
    {
      base._Process(delta);

      if (IsInstanceValid(dialogueLine))
      {
        progress.Visible = !(bool)dialogueLabel.Get("is_typing") && dialogueLine.Responses.Count == 0 && !dialogueLine.HasTag("voice");
      }
    }


    public async void Start(Resource dialogueResource = null, string title = "", Array<Variant> extraGameStates = null)
    {
      temporaryGameStates = new Array<Variant> { this } + (extraGameStates ?? new Array<Variant>());
      isWaitingForInput = false;

      if (IsInstanceValid(dialogueResource))
      {
        DialogueResource = dialogueResource;
      }
      if (title != "")
      {
        StartFromTitle = title;
      }

      DialogueLine = await DialogueManager.GetNextDialogueLine(DialogueResource, StartFromTitle, temporaryGameStates);
      Show();
    }


    public async void Next(string nextId)
    {
      DialogueLine = await DialogueManager.GetNextDialogueLine(DialogueResource, nextId, temporaryGameStates);
    }


    #region Helpers


    private async void ApplyDialogueLine()
    {
      MutationCooldown.Stop();

      isWaitingForInput = false;
      balloon.FocusMode = Control.FocusModeEnum.All;
      balloon.GrabFocus();

      // Set up the character name
      characterLabel.Visible = !string.IsNullOrEmpty(dialogueLine.Character);
      characterLabel.Text = Tr(dialogueLine.Character, "dialogue");

      // Set up the dialogue
      dialogueLabel.Hide();
      dialogueLabel.Set("dialogue_line", dialogueLine);

      // Set up the responses
      responsesMenu.Hide();
      responsesMenu.Set("responses", dialogueLine.Responses);

      // Type out the text
      balloon.Show();
      willHideBalloon = false;
      dialogueLabel.Show();
      if (!string.IsNullOrEmpty(dialogueLine.Text))
      {
        dialogueLabel.Call("type_out");
        await ToSignal(dialogueLabel, "finished_typing");
      }

      // Wait for input
      if (dialogueLine.Responses.Count > 0)
      {
        balloon.FocusMode = Control.FocusModeEnum.None;
        responsesMenu.Show();
      }
      else if (!string.IsNullOrEmpty(dialogueLine.Time))
      {
        float time = 0f;
        if (!float.TryParse(dialogueLine.Time, out time))
        {
          time = dialogueLine.Text.Length * 0.02f;
        }
        await ToSignal(GetTree().CreateTimer(time), "timeout");
        Next(dialogueLine.NextId);
      }
      else
      {
        isWaitingForInput = true;
        balloon.FocusMode = Control.FocusModeEnum.All;
        balloon.GrabFocus();
      }
    }


    #endregion


    #region signals


    private void OnMutated(Dictionary _mutation)
    {
      isWaitingForInput = false;
      willHideBalloon = true;
      MutationCooldown.Start(0.1f);
    }


    #endregion
  }
}
```

## File: addons/dialogue_manager/example_balloon/ExampleBalloon.cs.uid
```
uid://5b3w40kwakl3
```

## File: addons/dialogue_manager/example_balloon/small_example_balloon.tscn
```
[gd_scene load_steps=12 format=3 uid="uid://13s5spsk34qu"]

[ext_resource type="Script" uid="uid://d1wt4ma6055l8" path="res://addons/dialogue_manager/example_balloon/example_balloon.gd" id="1_s2gbs"]
[ext_resource type="PackedScene" uid="uid://ckvgyvclnwggo" path="res://addons/dialogue_manager/dialogue_label.tscn" id="2_hfvdi"]
[ext_resource type="Script" uid="uid://bb52rsfwhkxbn" path="res://addons/dialogue_manager/dialogue_responses_menu.gd" id="3_1j1j0"]

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_235ry"]
content_margin_left = 6.0
content_margin_top = 3.0
content_margin_right = 6.0
content_margin_bottom = 3.0
bg_color = Color(0.0666667, 0.0666667, 0.0666667, 1)
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color(0.345098, 0.345098, 0.345098, 1)
corner_radius_top_left = 3
corner_radius_top_right = 3
corner_radius_bottom_right = 3
corner_radius_bottom_left = 3

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_ufjut"]
content_margin_left = 6.0
content_margin_top = 3.0
content_margin_right = 6.0
content_margin_bottom = 3.0
bg_color = Color(0.227451, 0.227451, 0.227451, 1)
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
border_color = Color(1, 1, 1, 1)
corner_radius_top_left = 3
corner_radius_top_right = 3
corner_radius_bottom_right = 3
corner_radius_bottom_left = 3

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_fcbqo"]
content_margin_left = 6.0
content_margin_top = 3.0
content_margin_right = 6.0
content_margin_bottom = 3.0
bg_color = Color(0.0666667, 0.0666667, 0.0666667, 1)
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
corner_radius_top_left = 3
corner_radius_top_right = 3
corner_radius_bottom_right = 3
corner_radius_bottom_left = 3

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_t6i7a"]
content_margin_left = 6.0
content_margin_top = 3.0
content_margin_right = 6.0
content_margin_bottom = 3.0
bg_color = Color(0.0666667, 0.0666667, 0.0666667, 1)
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
corner_radius_top_left = 3
corner_radius_top_right = 3
corner_radius_bottom_right = 3
corner_radius_bottom_left = 3

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_i6nbm"]
bg_color = Color(0, 0, 0, 1)
border_width_left = 1
border_width_top = 1
border_width_right = 1
border_width_bottom = 1
corner_radius_top_left = 3
corner_radius_top_right = 3
corner_radius_bottom_right = 3
corner_radius_bottom_left = 3

[sub_resource type="Theme" id="Theme_qq3yp"]
default_font_size = 8
Button/styles/disabled = SubResource("StyleBoxFlat_235ry")
Button/styles/focus = SubResource("StyleBoxFlat_ufjut")
Button/styles/hover = SubResource("StyleBoxFlat_fcbqo")
Button/styles/normal = SubResource("StyleBoxFlat_t6i7a")
MarginContainer/constants/margin_bottom = 4
MarginContainer/constants/margin_left = 8
MarginContainer/constants/margin_right = 8
MarginContainer/constants/margin_top = 4
PanelContainer/styles/panel = SubResource("StyleBoxFlat_i6nbm")

[sub_resource type="Animation" id="Animation_i6nbm"]
resource_name = "progress"
loop_mode = 1
step = 0.1
tracks/0/type = "bezier"
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/path = NodePath("Progress:position:y")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/keys = {
"handle_modes": PackedInt32Array(0, 0, 0, 0, 0),
"points": PackedFloat32Array(0, -0.25, 0, 0.25, 0, 0, -0.25, 0, 0.2, -0.0157438, -1, -0.2, 0.0112069, 0.25, 0, -1, -0.25, 0, 0.25, 0, 0, -0.2, 0.00299701, 0.25, 0),
"times": PackedFloat32Array(0, 0.1, 0.5, 0.6, 1)
}

[sub_resource type="AnimationLibrary" id="AnimationLibrary_6b6c8"]
_data = {
&"progress": SubResource("Animation_i6nbm")
}

[node name="ExampleBalloon" type="CanvasLayer"]
layer = 100
script = ExtResource("1_s2gbs")

[node name="Balloon" type="Control" parent="."]
unique_name_in_owner = true
layout_mode = 3
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2
theme = SubResource("Theme_qq3yp")

[node name="MarginContainer" type="MarginContainer" parent="Balloon"]
layout_mode = 1
anchors_preset = 12
anchor_top = 1.0
anchor_right = 1.0
anchor_bottom = 1.0
offset_top = -71.0
grow_horizontal = 2
grow_vertical = 0

[node name="PanelContainer" type="PanelContainer" parent="Balloon/MarginContainer"]
clip_children = 2
layout_mode = 2
mouse_filter = 1

[node name="MarginContainer" type="MarginContainer" parent="Balloon/MarginContainer/PanelContainer"]
layout_mode = 2

[node name="HBoxContainer" type="HBoxContainer" parent="Balloon/MarginContainer/PanelContainer/MarginContainer"]
layout_mode = 2

[node name="VBoxContainer" type="VBoxContainer" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer"]
layout_mode = 2
size_flags_horizontal = 3

[node name="CharacterLabel" type="RichTextLabel" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer"]
unique_name_in_owner = true
modulate = Color(1, 1, 1, 0.501961)
layout_mode = 2
mouse_filter = 1
bbcode_enabled = true
text = "Character"
fit_content = true
scroll_active = false

[node name="DialogueLabel" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/VBoxContainer" instance=ExtResource("2_hfvdi")]
unique_name_in_owner = true
layout_mode = 2
size_flags_vertical = 3
text = "Dialogue..."

[node name="Control" type="Control" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer"]
custom_minimum_size = Vector2(5, 3)
layout_mode = 2
size_flags_vertical = 8

[node name="Progress" type="Polygon2D" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/Control"]
unique_name_in_owner = true
position = Vector2(0, -0.455998)
polygon = PackedVector2Array(0, 0, 2.5, 3, 5, 0)

[node name="AnimationPlayer" type="AnimationPlayer" parent="Balloon/MarginContainer/PanelContainer/MarginContainer/HBoxContainer/Control"]
libraries = {
&"": SubResource("AnimationLibrary_6b6c8")
}
autoplay = "progress"

[node name="ResponsesMenu" type="VBoxContainer" parent="Balloon"]
unique_name_in_owner = true
layout_mode = 1
anchors_preset = 8
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
offset_left = -116.5
offset_top = -9.0
offset_right = 116.5
offset_bottom = 9.0
grow_horizontal = 2
grow_vertical = 2
size_flags_vertical = 8
theme_override_constants/separation = 2
script = ExtResource("3_1j1j0")

[node name="ResponseExample" type="Button" parent="Balloon/ResponsesMenu"]
layout_mode = 2
text = "Response Example"

[node name="AudioStreamPlayer" type="AudioStreamPlayer" parent="."]
unique_name_in_owner = true

[connection signal="gui_input" from="Balloon" to="." method="_on_balloon_gui_input"]
[connection signal="response_selected" from="Balloon/ResponsesMenu" to="." method="_on_responses_menu_response_selected"]
```

## File: addons/dialogue_manager/l10n/en.po
```
msgid ""
msgstr ""
"Project-Id-Version: Dialogue Manager\n"
"POT-Creation-Date: \n"
"PO-Revision-Date: \n"
"Last-Translator: \n"
"Language-Team: \n"
"Language: en\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=UTF-8\n"
"Content-Transfer-Encoding: 8bit\n"
"Plural-Forms: nplurals=2; plural=(n != 1);\n"
"X-Generator: Poedit 3.2.2\n"

msgid "start_a_new_file"
msgstr "Start a new file"

msgid "open_a_file"
msgstr "Open a file"

msgid "open.open"
msgstr "Open..."

msgid "open.quick_open"
msgstr "Quick open..."

msgid "open.no_recent_files"
msgstr "No recent files"

msgid "open.clear_recent_files"
msgstr "Clear recent files"

msgid "save_all_files"
msgstr "Save all files"

msgid "all"
msgstr "All"

msgid "find_in_files"
msgstr "Find in Dialogue..."

msgid "test_dialogue"
msgstr "Test dialogue from start of file"

msgid "test_dialogue_from_line"
msgstr "Test dialogue from current line"

msgid "search_for_text"
msgstr "Search for text"

msgid "insert"
msgstr "Insert"

msgid "translations"
msgstr "Translations"

msgid "sponsor"
msgstr "Sponsor"

msgid "show_support"
msgstr "Support Dialogue Manager"

msgid "docs"
msgstr "Docs"

msgid "insert.wave_bbcode"
msgstr "Wave BBCode"

msgid "insert.shake_bbcode"
msgstr "Shake BBCode"

msgid "insert.typing_pause"
msgstr "Typing pause"

msgid "insert.typing_speed_change"
msgstr "Typing speed change"

msgid "insert.auto_advance"
msgstr "Auto advance"

msgid "insert.templates"
msgstr "Templates"

msgid "insert.title"
msgstr "Title"

msgid "insert.dialogue"
msgstr "Dialogue"

msgid "insert.response"
msgstr "Response"

msgid "insert.random_lines"
msgstr "Random lines"

msgid "insert.random_text"
msgstr "Random text"

msgid "insert.actions"
msgstr "Actions"

msgid "insert.jump"
msgstr "Jump to title"

msgid "insert.end_dialogue"
msgstr "End dialogue"

msgid "generate_line_ids"
msgstr "Generate line IDs"

msgid "generate_ids.warning_title"
msgstr "Generate line IDs?"

msgid "generate_ids.warning_text"
msgstr "Generate line IDs for all lines in all dialogue files?\n\n**Make sure to commit any changes to source control BEFORE running this because it cannot be undone.**"

msgid "generate_ids.ok_button"
msgstr "Generate IDs"

msgid "use_uuid_only_for_ids"
msgstr "Use UUID only for IDs"

msgid "set_id_prefix_length"
msgstr "Set ID prefix length"

msgid "id_prefix_length"
msgstr "ID prefix length:"

msgid "save_characters_to_csv"
msgstr "Save character names to CSV..."

msgid "save_to_csv"
msgstr "Save lines to CSV..."

msgid "import_from_csv"
msgstr "Import line changes from CSV..."

msgid "confirm_close"
msgstr "Save changes to '{path}'?"

msgid "confirm_close.save"
msgstr "Save changes"

msgid "confirm_close.discard"
msgstr "Discard"

msgid "confirm_n_unsaved_files"
msgstr "You have {count} unsaved dialogue files."

msgid "buffer.save"
msgstr "Save"

msgid "buffer.save_as"
msgstr "Save as..."

msgid "buffer.close"
msgstr "Close"

msgid "buffer.close_all"
msgstr "Close all"

msgid "buffer.close_other_files"
msgstr "Close other files"

msgid "buffer.copy_file_path"
msgstr "Copy file path"

msgid "buffer.show_in_filesystem"
msgstr "Show in FileSystem"

msgid "n_of_n"
msgstr "{index} of {total}"

msgid "search.find_in_dialogue"
msgstr "Find in Dialogue"

msgid "search.find"
msgstr "Find:"

msgid "search.find_all"
msgstr "Find all..."

msgid "search.placeholder"
msgstr "Text to search for"

msgid "search.replace_placeholder"
msgstr "Text to replace it with"

msgid "search.replace_selected"
msgstr "Replace selected"

msgid "search.previous"
msgstr "Previous"

msgid "search.next"
msgstr "Next"

msgid "search.match_case"
msgstr "Match case"

msgid "search.toggle_replace"
msgstr "Replace"

msgid "search.replace_with"
msgstr "Replace with:"

msgid "search.replace"
msgstr "Replace"

msgid "search.replace_all"
msgstr "Replace all"

msgid "files_list.filter"
msgstr "Filter files"

msgid "titles_list.filter"
msgstr "Filter titles"

msgid "errors.key_not_found"
msgstr "Key \"{key}\" not found."

msgid "errors.line_and_message"
msgstr "Error at {line}, {column}: {message}"

msgid "errors_in_script"
msgstr "You have errors in your script. Fix them and then try again."

msgid "errors_with_build"
msgstr "You need to fix dialogue errors before you can run your game."

msgid "errors.import_errors"
msgstr "There are errors in this imported file."

msgid "errors.already_imported"
msgstr "File already imported."

msgid "errors.duplicate_import"
msgstr "Duplicate import name."

msgid "errors.unknown_using"
msgstr "Unknown autoload in using statement."

msgid "errors.empty_title"
msgstr "Titles cannot be empty."

msgid "errors.duplicate_title"
msgstr "There is already a title with that name."

msgid "errors.invalid_title_string"
msgstr "Titles can only contain alphanumeric characters and numbers."

msgid "errors.invalid_title_number"
msgstr "Titles cannot begin with a number."

msgid "errors.unknown_title"
msgstr "Unknown title."

msgid "errors.jump_to_invalid_title"
msgstr "This jump is pointing to an invalid title."

msgid "errors.title_has_no_content"
msgstr "That title has no content. Maybe change this to a \"=> END\"."

msgid "errors.invalid_expression"
msgstr "Expression is invalid."

msgid "errors.unexpected_condition"
msgstr "Unexpected condition."

msgid "errors.duplicate_id"
msgstr "This ID is already in use."

msgid "errors.missing_id"
msgstr "This line is missing an ID."

msgid "errors.invalid_indentation"
msgstr "Invalid indentation."

msgid "errors.condition_has_no_content"
msgstr "A condition line needs an indented line below it."

msgid "errors.incomplete_expression"
msgstr "Incomplete expression."

msgid "errors.invalid_expression_for_value"
msgstr "Invalid expression for value."

msgid "errors.file_not_found"
msgstr "File not found."

msgid "errors.unexpected_end_of_expression"
msgstr "Unexpected end of expression."

msgid "errors.unexpected_function"
msgstr "Unexpected function."

msgid "errors.unexpected_bracket"
msgstr "Unexpected bracket."

msgid "errors.unexpected_closing_bracket"
msgstr "Unexpected closing bracket."

msgid "errors.missing_closing_bracket"
msgstr "Missing closing bracket."

msgid "errors.unexpected_operator"
msgstr "Unexpected operator."

msgid "errors.unexpected_comma"
msgstr "Unexpected comma."

msgid "errors.unexpected_colon"
msgstr "Unexpected colon."

msgid "errors.unexpected_dot"
msgstr "Unexpected dot."

msgid "errors.unexpected_boolean"
msgstr "Unexpected boolean."

msgid "errors.unexpected_string"
msgstr "Unexpected string."

msgid "errors.unexpected_number"
msgstr "Unexpected number."

msgid "errors.unexpected_variable"
msgstr "Unexpected variable."

msgid "errors.invalid_index"
msgstr "Invalid index."

msgid "errors.unexpected_assignment"
msgstr "Unexpected assignment."

msgid "errors.expected_when_or_else"
msgstr "Expecting a when or an else case."

msgid "errors.only_one_else_allowed"
msgstr "Only one else case is allowed per match."

msgid "errors.when_must_belong_to_match"
msgstr "When statements can only appear as children of match statements."

msgid "errors.concurrent_line_without_origin"
msgstr "Concurrent lines need an origin line that doesn't start with \"| \"."

msgid "errors.goto_not_allowed_on_concurrect_lines"
msgstr "Goto references are not allowed on concurrent dialogue lines."

msgid "errors.unexpected_syntax_on_nested_dialogue_line"
msgstr "Nested dialogue lines may only contain dialogue."

msgid "errors.err_nested_dialogue_invalid_jump"
msgstr "Only the last line of nested dialogue is allowed to include a jump."

msgid "errors.missing_resource_for_autostart"
msgstr "You need to specify a dialogue resource when using auto-start."

msgid "errors.unknown"
msgstr "Unknown syntax."

msgid "update.available"
msgstr "v{version} available"

msgid "update.is_available_for_download"
msgstr "Version %s is available for download!"

msgid "update.downloading"
msgstr "Downloading..."

msgid "update.download_update"
msgstr "Download update"

msgid "update.needs_reload"
msgstr "The project needs to be reloaded to install the update."

msgid "update.reload_ok_button"
msgstr "Reload project"

msgid "update.reload_cancel_button"
msgstr "Do it later"

msgid "update.reload_project"
msgstr "Reload project"

msgid "update.release_notes"
msgstr "Read release notes"

msgid "update.success"
msgstr "Dialogue Manager is now v{version}."

msgid "update.failed"
msgstr "There was a problem downloading the update."

msgid "runtime.no_resource"
msgstr "No dialogue resource provided."

msgid "runtime.no_content"
msgstr "\"{file_path}\" has no content."

msgid "runtime.errors"
msgstr "You have {count} errors in your dialogue text."

msgid "runtime.error_detail"
msgstr "Line {line}: {message}"

msgid "runtime.errors_see_details"
msgstr "You have {count} errors in your dialogue text. See Output for details."

msgid "runtime.invalid_expression"
msgstr "\"{expression}\" is not a valid expression: {error}"

msgid "runtime.array_index_out_of_bounds"
msgstr "Index {index} out of bounds of array \"{array}\"."

msgid "runtime.left_hand_size_cannot_be_assigned_to"
msgstr "Left hand side of expression cannot be assigned to."

msgid "runtime.key_not_found"
msgstr "Key \"{key}\" not found in dictionary \"{dictionary}\""

msgid "runtime.property_not_found"
msgstr "\"{property}\" not found. States with directly referenceable properties/methods/signals include {states}. Autoloads need to be referenced by their name to use their properties."

msgid "runtime.property_not_found_missing_export"
msgstr "\"{property}\" not found. You might need to add an [Export] decorator. States with directly referenceable properties/methods/signals include {states}. Autoloads need to be referenced by their name to use their properties."

msgid "runtime.method_not_found"
msgstr "Method \"{method}\" not found. States with directly referenceable properties/methods/signals include {states}. Autoloads need to be referenced by their name to use their properties."

msgid "runtime.signal_not_found"
msgstr "Signal \"{signal_name}\" not found. States with directly referenceable properties/methods/signals include {states}. Autoloads need to be referenced by their name to use their properties."

msgid "runtime.method_not_callable"
msgstr "\"{method}\" is not a callable method on \"{object}\""

msgid "runtime.unknown_operator"
msgstr "Unknown operator."

msgid "runtime.unknown_autoload"
msgstr "\"{autoload}\" doesn't appear to be a valid autoload."

msgid "runtime.something_went_wrong"
msgstr "Something went wrong."

msgid "runtime.expected_n_got_n_args"
msgstr "\"{method}\" was called with {received} arguments but it only has {expected}."

msgid "runtime.unsupported_array_type"
msgstr "Array[{type}] isn't supported in mutations. Use Array as a type instead."

msgid "runtime.dialogue_balloon_missing_start_method"
msgstr "Your dialogue balloon is missing a \"start\" or \"Start\" method."

msgid "runtime.top_level_states_share_name"
msgstr "Multiple top-level states ({states}) share method/property/signal name \"{key}\". Only the first occurance is accessible to dialogue."

msgid "translation_plugin.character_name"
msgstr "Character name"
```

## File: addons/dialogue_manager/l10n/es.po
```
#
msgid ""
msgstr ""
"Project-Id-Version: Dialogue Manager\n"
"POT-Creation-Date: 2024-02-25 20:58\n"
"PO-Revision-Date: 2024-02-25 20:58\n"
"Last-Translator: you <you@example.com>\n"
"Language-Team: Spanish <yourteam@example.com>\n"
"Language: es\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=utf-8\n"
"Content-Transfer-Encoding: 8bit\n"

msgid "start_a_new_file"
msgstr "Crear un nuevo archivo"

msgid "open_a_file"
msgstr "Abrir un archivo"

msgid "open.open"
msgstr "Abrir..."

msgid "open.no_recent_files"
msgstr "No hay archivos recientes"

msgid "open.clear_recent_files"
msgstr "Limpiar archivos recientes"

msgid "save_all_files"
msgstr "Guardar todos los archivos"

msgid "test_dialogue"
msgstr "Diálogo de prueba"

msgid "search_for_text"
msgstr "Buscar texto"

msgid "insert"
msgstr "Insertar"

msgid "translations"
msgstr "Traducciones"

msgid "show_support"
msgstr "Contribuye con Dialogue Manager"

msgid "docs"
msgstr "Docs"

msgid "insert.wave_bbcode"
msgstr "BBCode ondulado"

msgid "insert.shake_bbcode"
msgstr "BBCode agitado"

msgid "insert.typing_pause"
msgstr "Pausa de escritura"

msgid "insert.typing_speed_change"
msgstr "Cambiar la velocidad de escritura"

msgid "insert.auto_advance"
msgstr "Avance automático"

msgid "insert.templates"
msgstr "Plantillas"

msgid "insert.title"
msgstr "Título"

msgid "insert.dialogue"
msgstr "Diálogo"

msgid "insert.response"
msgstr "Respuesta"

msgid "insert.random_lines"
msgstr "Líneas aleatorias"

msgid "insert.random_text"
msgstr "Texto aleatorio"

msgid "insert.actions"
msgstr "Acciones"

msgid "insert.jump"
msgstr "Ir al título"

msgid "insert.end_dialogue"
msgstr "Finalizar diálogo"

msgid "generate_line_ids"
msgstr "Generar IDs de línea"

msgid "use_uuid_only_for_ids"
msgstr "Usar solo UUID como ID"

msgid "set_id_prefix_length"
msgstr "Establecer la longitud del prefijo de ID"

msgid "id_prefix_length"
msgstr "Longitud del prefijo de ID:"

msgid "save_characters_to_csv"
msgstr "Guardar los nombres de los personajes en un archivo CSV..."

msgid "save_to_csv"
msgstr "Guardar líneas en CSV..."

msgid "import_from_csv"
msgstr "Importar cambios de línea desde CSV..."

msgid "confirm_close"
msgstr "¿Guardar los cambios en '{path}'?"

msgid "confirm_close.save"
msgstr "Guardar cambios"

msgid "confirm_close.discard"
msgstr "Descartar"

msgid "buffer.save"
msgstr "Guardar"

msgid "buffer.save_as"
msgstr "Guardar como..."

msgid "buffer.close"
msgstr "Cerrar"

msgid "buffer.close_all"
msgstr "Cerrar todo"

msgid "buffer.close_other_files"
msgstr "Cerrar otros archivos"

msgid "buffer.copy_file_path"
msgstr "Copiar la ruta del archivo"

msgid "buffer.show_in_filesystem"
msgstr "Mostrar en el sistema de archivos"

msgid "n_of_n"
msgstr "{index} de {total}"

msgid "search.previous"
msgstr "Anterior"

msgid "search.next"
msgstr "Siguiente"

msgid "search.match_case"
msgstr "Coincidir mayúsculas/minúsculas"

msgid "search.toggle_replace"
msgstr "Reemplazar"

msgid "search.replace_with"
msgstr "Reemplazar con:"

msgid "search.replace"
msgstr "Reemplazar"

msgid "search.replace_all"
msgstr "Reemplazar todo"

msgid "files_list.filter"
msgstr "Filtrar archivos"

msgid "titles_list.filter"
msgstr "Filtrar títulos"

msgid "errors.key_not_found"
msgstr "La tecla \"{key}\" no se encuentra."

msgid "errors.line_and_message"
msgstr "Error en {line}, {column}: {message}"

msgid "errors_in_script"
msgstr "Tienes errores en tu guion. Corrígelos y luego inténtalo de nuevo."

msgid "errors_with_build"
msgstr "Debes corregir los errores de diálogo antes de poder ejecutar tu juego."

msgid "errors.import_errors"
msgstr "Hay errores en este archivo importado."

msgid "errors.already_imported"
msgstr "Archivo ya importado."

msgid "errors.duplicate_import"
msgstr "Nombre de importación duplicado."

msgid "errors.unknown_using"
msgstr "Autoload desconocida en la declaración de uso."

msgid "errors.empty_title"
msgstr "Los títulos no pueden estar vacíos."

msgid "errors.duplicate_title"
msgstr "Ya hay un título con ese nombre."

msgid "errors.nested_title"
msgstr "Los títulos no pueden tener sangría."

msgid "errors.invalid_title_string"
msgstr "Los títulos solo pueden contener caracteres alfanuméricos y números."

msgid "errors.invalid_title_number"
msgstr "Los títulos no pueden empezar con un número."

msgid "errors.unknown_title"
msgstr "Título desconocido."

msgid "errors.jump_to_invalid_title"
msgstr "Este salto está apuntando a un título inválido."

msgid "errors.title_has_no_content"
msgstr "Ese título no tiene contenido. Quizá cambiarlo a \"=> FIN\"."

msgid "errors.invalid_expression"
msgstr "La expresión es inválida."

msgid "errors.unexpected_condition"
msgstr "Condición inesperada."

msgid "errors.duplicate_id"
msgstr "Este ID ya está en otra línea."

msgid "errors.missing_id"
msgstr "Esta línea está sin ID."

msgid "errors.invalid_indentation"
msgstr "Sangría no válida."

msgid "errors.condition_has_no_content"
msgstr "Una línea de condición necesita una línea sangrada debajo de ella."

msgid "errors.incomplete_expression"
msgstr "Expresión incompleta."

msgid "errors.invalid_expression_for_value"
msgstr "Expresión no válida para valor."

msgid "errors.file_not_found"
msgstr "Archivo no encontrado."

msgid "errors.unexpected_end_of_expression"
msgstr "Fin de expresión inesperado."

msgid "errors.unexpected_function"
msgstr "Función inesperada."

msgid "errors.unexpected_bracket"
msgstr "Corchete inesperado."

msgid "errors.unexpected_closing_bracket"
msgstr "Bracket de cierre inesperado."

msgid "errors.missing_closing_bracket"
msgstr "Falta cerrar corchete."

msgid "errors.unexpected_operator"
msgstr "Operador inesperado."

msgid "errors.unexpected_comma"
msgstr "Coma inesperada."

msgid "errors.unexpected_colon"
msgstr "Dos puntos inesperados"

msgid "errors.unexpected_dot"
msgstr "Punto inesperado."

msgid "errors.unexpected_boolean"
msgstr "Booleano inesperado."

msgid "errors.unexpected_string"
msgstr "String inesperado."

msgid "errors.unexpected_number"
msgstr "Número inesperado."

msgid "errors.unexpected_variable"
msgstr "Variable inesperada."

msgid "errors.invalid_index"
msgstr "Índice no válido."

msgid "errors.unexpected_assignment"
msgstr "Asignación inesperada."

msgid "errors.unknown"
msgstr "Sintaxis desconocida."

msgid "update.available"
msgstr "v{version} disponible"

msgid "update.is_available_for_download"
msgstr "¡La versión %s ya está disponible para su descarga!"

msgid "update.downloading"
msgstr "Descargando..."

msgid "update.download_update"
msgstr "Descargar actualización"

msgid "update.needs_reload"
msgstr "El proyecto debe ser recargado para instalar la actualización."

msgid "update.reload_ok_button"
msgstr "Recargar proyecto"

msgid "update.reload_cancel_button"
msgstr "Hazlo más tarde"

msgid "update.reload_project"
msgstr "Recargar proyecto"

msgid "update.release_notes"
msgstr "Leer las notas de la versión"

msgid "update.success"
msgstr "El Gestor de Diálogo ahora es v{versión}."

msgid "update.failed"
msgstr "Hubo un problema al descargar la actualización."

msgid "runtime.no_resource"
msgstr "Recurso de diálogo no proporcionado."

msgid "runtime.no_content"
msgstr "\"{file_path}\" no tiene contenido."

msgid "runtime.errors"
msgstr "Tienes {count} errores en tu diálogo de texto."

msgid "runtime.error_detail"
msgstr "Línea {line}: {message}"

msgid "runtime.errors_see_details"
msgstr "Tienes {count} errores en tu texto de diálogo. Consulta la salida para más detalles."

msgid "runtime.invalid_expression"
msgstr "\"{expression}\" no es una expresión válida: {error}"

msgid "runtime.array_index_out_of_bounds"
msgstr "Índice {index} fuera de los límites del array \"{array}\"."

msgid "runtime.left_hand_size_cannot_be_assigned_to"
msgstr "El lado izquierdo de la expresión no se puede asignar."

msgid "runtime.key_not_found"
msgstr "Clave \"{key}\" no encontrada en el diccionario \"{dictionary}\""

msgid "runtime.property_not_found"
msgstr "\"{property}\" no es una propiedad en ningún estado del juego ({states})."

msgid "runtime.property_not_found_missing_export"
msgstr "\"{property}\" no es una propiedad en ningún estado del juego ({states}). Es posible que necesites añadir un decorador [Export]."

msgid "runtime.method_not_found"
msgstr "\"{method}\" no es un método en ningún estado del juego ({states})"

msgid "runtime.signal_not_found"
msgstr "\"{signal_name}\" no es una señal en ningún estado del juego ({states})"

msgid "runtime.method_not_callable"
msgstr "\"{method}\" no es un método llamable en \"{object}\""

msgid "runtime.unknown_operator"
msgstr "Operador desconocido."

msgid "runtime.unknown_autoload"
msgstr "\"{autoload}\" parece no ser un autoload válido."

msgid "runtime.something_went_wrong"
msgstr "Algo salió mal."

msgid "runtime.expected_n_got_n_args"
msgstr "El método \"{method}\" se llamó con {received} argumentos, pero solo tiene {expected}."

msgid "runtime.unsupported_array_type"
msgstr "Array[{type}] no está soportado en mutaciones. Utiliza Array como tipo en su lugar."

msgid "runtime.dialogue_balloon_missing_start_method"
msgstr "Tu globo de diálogo no tiene un método  \"start\" o \"Start\"."
```

## File: addons/dialogue_manager/l10n/uk.po
```
msgid ""
msgstr ""
"Project-Id-Version: Dialogue Manager\n"
"POT-Creation-Date: \n"
"PO-Revision-Date: \n"
"Last-Translator: \n"
"Language-Team: \n"
"Language: uk\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=UTF-8\n"
"Content-Transfer-Encoding: 8bit\n"
"X-Generator: Poedit 3.2.2\n"

msgid "start_a_new_file"
msgstr "Створити новий файл"

msgid "open_a_file"
msgstr "Відкрити файл"

msgid "open.open"
msgstr "Відкрити..."

msgid "open.quick_open"
msgstr "Швидко відкрити..."

msgid "open.no_recent_files"
msgstr "Жодних недавніх файлів"

msgid "open.clear_recent_files"
msgstr "Очистити недавні файли"

msgid "save_all_files"
msgstr "Зберегти всі файли"

msgid "find_in_files"
msgstr "Знайти у файлах..."

msgid "test_dialogue"
msgstr "Протестувати діалог з початку файлу"

msgid "test_dialogue_from_line"
msgstr "Протестувати діалог з поточного рядка"

msgid "search_for_text"
msgstr "Пошук тексту"

msgid "insert"
msgstr "Вставити"

msgid "translations"
msgstr "Переклади"

msgid "sponsor"
msgstr "Спонсор"

msgid "show_support"
msgstr "Підтримка Dialogue Manager"

msgid "docs"
msgstr "Документація"

msgid "insert.wave_bbcode"
msgstr "Хвиля BBCode"

msgid "insert.shake_bbcode"
msgstr "Тряска BBCode"

msgid "insert.typing_pause"
msgstr "Пауза друку"

msgid "insert.typing_speed_change"
msgstr "Зміна швидкості друку"

msgid "insert.auto_advance"
msgstr "Автоматичне просування"

msgid "insert.templates"
msgstr "Шаблони"

msgid "insert.title"
msgstr "Заголовок"

msgid "insert.dialogue"
msgstr "Діалог"

msgid "insert.response"
msgstr "Відповідь"

msgid "insert.random_lines"
msgstr "Випадкові рядки"

msgid "insert.random_text"
msgstr "Випадковий текст"

msgid "insert.actions"
msgstr "Дії"

msgid "insert.jump"
msgstr "Перейти до заголовку"

msgid "insert.end_dialogue"
msgstr "Кінець діалогу"

msgid "generate_line_ids"
msgstr "Згенерувати ідентифікатори рядків"

msgid "use_uuid_only_for_ids"
msgstr "Використовувати лише UUID як ID"

msgid "set_id_prefix_length"
msgstr "Встановити довжину префікса ID"

msgid "id_prefix_length"
msgstr "Довжина префікса ID:"

msgid "save_characters_to_csv"
msgstr "Зберегти імена персонажів в CSV..."

msgid "save_to_csv"
msgstr "Зберегти рядки в CSV..."

msgid "import_from_csv"
msgstr "Імпортувати зміни рядків з CSV..."

msgid "confirm_close"
msgstr "Зберегти зміни до «{path}»?"

msgid "confirm_close.save"
msgstr "Зберегти зміни"

msgid "confirm_close.discard"
msgstr "Скасувати"

msgid "buffer.save"
msgstr "Зберегти"

msgid "buffer.save_as"
msgstr "Зберегти як..."

msgid "buffer.close"
msgstr "Закрити"

msgid "buffer.close_all"
msgstr "Закрити все"

msgid "buffer.close_other_files"
msgstr "Закрити інші файли"

msgid "buffer.copy_file_path"
msgstr "Копіювати шлях файлу"

msgid "buffer.show_in_filesystem"
msgstr "Показати у файловій системі"

msgid "n_of_n"
msgstr "{index} з {total}"

msgid "search.find"
msgstr "Знайти:"

msgid "search.find_all"
msgstr "Знайти всі..."

msgid "search.placeholder"
msgstr "Текст для пошуку"

msgid "search.replace_placeholder"
msgstr "Текст для заміни"

msgid "search.replace_selected"
msgstr "Замінити вибране"

msgid "search.previous"
msgstr "Назад"

msgid "search.next"
msgstr "Далі"

msgid "search.match_case"
msgstr "Збіг регістру"

msgid "search.toggle_replace"
msgstr "Замінити"

msgid "search.replace_with"
msgstr "Замінити на:"

msgid "search.replace"
msgstr "Замінити"

msgid "search.replace_all"
msgstr "Замінити все"

msgid "files_list.filter"
msgstr "Фільтр файлів"

msgid "titles_list.filter"
msgstr "Фільтр заголовків"

msgid "errors.key_not_found"
msgstr "Ключ «{key}» не знайдено."

msgid "errors.line_and_message"
msgstr "Помилка в {line}, {column}: {message}"

msgid "errors_in_script"
msgstr "У вашому скрипті є помилки. Виправте їх і спробуйте ще раз."

msgid "errors_with_build"
msgstr "Вам потрібно виправити помилки в діалогах, перш ніж ви зможете запустити гру."

msgid "errors.import_errors"
msgstr "В імпортованому файлі є помилки."

msgid "errors.already_imported"
msgstr "Файл уже імпортовано."

msgid "errors.duplicate_import"
msgstr "Дублювання назви імпорту."

msgid "errors.unknown_using"
msgstr "Невідоме автозавантаження в операторі «using»."

msgid "errors.empty_title"
msgstr "Заголовки не можуть бути порожніми."

msgid "errors.duplicate_title"
msgstr "Заголовок з такою назвою уже є."

msgid "errors.invalid_title_string"
msgstr "Заголовки можуть містити лише алфавітно-цифрові символи та цифри."

msgid "errors.invalid_title_number"
msgstr "Заголовки не можуть починатися з цифри."

msgid "errors.unknown_title"
msgstr "Невідомий заголовок."

msgid "errors.jump_to_invalid_title"
msgstr "Цей перехід вказує на недійсний заголовок."

msgid "errors.title_has_no_content"
msgstr "Цей заголовок не має змісту. Можливо, варто змінити його на «=> END»."

msgid "errors.invalid_expression"
msgstr "Вираз є недійсним."

msgid "errors.unexpected_condition"
msgstr "Несподівана умова."

msgid "errors.duplicate_id"
msgstr "Цей ідентифікатор уже є на іншому рядку."

msgid "errors.missing_id"
msgstr "У цьому рядку відсутній ідентифікатор."

msgid "errors.invalid_indentation"
msgstr "Неправильний відступ."

msgid "errors.condition_has_no_content"
msgstr "Рядок умови потребує відступу під ним."

msgid "errors.incomplete_expression"
msgstr "Незавершений вираз."

msgid "errors.invalid_expression_for_value"
msgstr "Недійсний вираз для значення."

msgid "errors.file_not_found"
msgstr "Файл не знайдено."

msgid "errors.unexpected_end_of_expression"
msgstr "Несподіваний кінець виразу."

msgid "errors.unexpected_function"
msgstr "Несподівана функція."

msgid "errors.unexpected_bracket"
msgstr "Несподівана дужка."

msgid "errors.unexpected_closing_bracket"
msgstr "Несподівана закриваюча дужка."

msgid "errors.missing_closing_bracket"
msgstr "Відсутня закриваюча дужка."

msgid "errors.unexpected_operator"
msgstr "Несподіваний оператор."

msgid "errors.unexpected_comma"
msgstr "Несподівана кома."

msgid "errors.unexpected_colon"
msgstr "Несподівана двокрапка."

msgid "errors.unexpected_dot"
msgstr "Несподівана крапка."

msgid "errors.unexpected_boolean"
msgstr "Несподіваний логічний вираз."

msgid "errors.unexpected_string"
msgstr "Несподіваний рядок."

msgid "errors.unexpected_number"
msgstr "Несподіване число."

msgid "errors.unexpected_variable"
msgstr "Несподівана змінна."

msgid "errors.invalid_index"
msgstr "Недійсний індекс."

msgid "errors.unexpected_assignment"
msgstr "Несподіване призначення."

msgid "errors.expected_when_or_else"
msgstr "Очікувався випадок «when» або «else»."

msgid "errors.only_one_else_allowed"
msgstr "Для кожного «match» допускається лише один випадок «else»."

msgid "errors.when_must_belong_to_match"
msgstr "Оператори «when» можуть з’являтися лише як дочірні операторів «match»."

msgid "errors.concurrent_line_without_origin"
msgstr "Паралельні рядки потребують початкового рядка, який не починається з «|»."

msgid "errors.goto_not_allowed_on_concurrect_lines"
msgstr "У паралельних діалогових рядках не допускаються Goto посилання."

msgid "errors.unexpected_syntax_on_nested_dialogue_line"
msgstr "Вкладені рядки діалогу можуть містити лише діалог."

msgid "errors.err_nested_dialogue_invalid_jump"
msgstr "Лише останній рядок вкладеного діалогу може містити перехід."

msgid "errors.unknown"
msgstr "Невідомий синтаксис."

msgid "update.available"
msgstr "Доступна версія {version}"

msgid "update.is_available_for_download"
msgstr "Версія %s доступна для завантаження!"

msgid "update.downloading"
msgstr "Завантаження..."

msgid "update.download_update"
msgstr "Завантажити оновлення"

msgid "update.needs_reload"
msgstr "Щоб установити оновлення, проєкт потрібно перезавантажити."

msgid "update.reload_ok_button"
msgstr "Перезавантажити проєкт"

msgid "update.reload_cancel_button"
msgstr "Пізніше"

msgid "update.reload_project"
msgstr "Перезавантажити проєкт"

msgid "update.release_notes"
msgstr "Читати зміни оновлення"

msgid "update.success"
msgstr "Dialogue Manager тепер з версією {version}."

msgid "update.failed"
msgstr "Виникла проблема із завантаженням оновлення."

msgid "runtime.no_resource"
msgstr "Ресурс для діалогу не надано."

msgid "runtime.no_content"
msgstr "«{file_path}» не має вмісту."

msgid "runtime.errors"
msgstr "У тексті діалогу було виявлено помилки ({count})."

msgid "runtime.error_detail"
msgstr "Рядок {line}: {message}"

msgid "runtime.errors_see_details"
msgstr "У тексті діалогу було виявлено помилки ({count}). Див. детальніше у розділі «Вивід»."

msgid "runtime.invalid_expression"
msgstr "«{expression}» не є допустимим виразом: {error}"

msgid "runtime.array_index_out_of_bounds"
msgstr "Індекс {index} виходить за межі масиву «{array}»."

msgid "runtime.left_hand_size_cannot_be_assigned_to"
msgstr "Ліва частина виразу не може бути призначена."

msgid "runtime.key_not_found"
msgstr "Ключ «{key}» не знайдено у словнику «{dictionary}»"

msgid "runtime.property_not_found"
msgstr "«{property}» не знайдено. Стани з безпосередньо доступними властивостями/методами/сигналами включають {states}. На автозавантаження потрібно посилатися за їхніми назвами для використання їхніх властивостей."

msgid "runtime.property_not_found_missing_export"
msgstr "«{property}» не знайдено. Можливо, вам слід додати декоратор «[Export]». Стани з безпосередньо доступними властивостями/методами/сигналами включають {states}. На автозавантаження потрібно посилатися за їхніми назвами для використання їхніх властивостей."

msgid "runtime.method_not_found"
msgstr "Метод «{method}» не знайдено. Стани з безпосередньо доступними властивостями/методами/сигналами включають {states}. На автозавантаження потрібно посилатися за їхніми назвами для використання їхніх властивостей."

msgid "runtime.signal_not_found"
msgstr "Сигнал «{signal_name}» не знайдено. Стани з безпосередньо доступними властивостями/методами/сигналами включають {states}. На автозавантаження потрібно посилатися за їхніми назвами для використання їхніх властивостей."

msgid "runtime.method_not_callable"
msgstr "«{method}» не є методом, який можна викликати в «{object}»"

msgid "runtime.unknown_operator"
msgstr "Невідомий оператор."

msgid "runtime.unknown_autoload"
msgstr "Схоже, «{autoload}» не є дійсним автозавантаженням."

msgid "runtime.something_went_wrong"
msgstr "Щось пішло не так."

msgid "runtime.expected_n_got_n_args"
msgstr "«{method}» було викликано з аргументами «{received}», але воно має лише «{expected}»."

msgid "runtime.unsupported_array_type"
msgstr "Array[{type}] не підтримується у модифікаціях. Натомість використовуйте Array як тип."

msgid "runtime.dialogue_balloon_missing_start_method"
msgstr "У вашій кулі діалогу відсутній метод «start» або «Start»."

msgid "runtime.top_level_states_share_name"
msgstr "Кілька станів верхнього рівня ({states}) мають спільну назву методу/властивості/сигналу «{key}». Для діалогу доступний лише перший випадок."

msgid "translation_plugin.character_name"
msgstr "Ім’я персонажа"
```

## File: addons/dialogue_manager/l10n/zh_TW.po
```
msgid ""
msgstr ""
"Project-Id-Version: Dialogue Manager\n"
"POT-Creation-Date: \n"
"PO-Revision-Date: \n"
"Last-Translator: \n"
"Language-Team: 憨憨羊の宇航鴿鴿、ABShinri\n"
"Language: zh_TW\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=UTF-8\n"
"Content-Transfer-Encoding: 8bit\n"
"X-Generator: Poedit 3.4\n"

msgid "start_a_new_file"
msgstr "創建新檔案"

msgid "open_a_file"
msgstr "開啟已有檔案"

msgid "open.open"
msgstr "開啟……"

msgid "open.no_recent_files"
msgstr "無歷史記錄"

msgid "open.clear_recent_files"
msgstr "清空歷史記錄"

msgid "save_all_files"
msgstr "儲存所有檔案"

msgid "find_in_files"
msgstr "在檔案中查找"

msgid "test_dialogue"
msgstr "測試對話"

msgid "search_for_text"
msgstr "搜尋……"

msgid "insert"
msgstr "插入"

msgid "translations"
msgstr "翻譯"

msgid "show_support"
msgstr "支援 Dialogue Manager"

msgid "docs"
msgstr "文檔"

msgid "insert.wave_bbcode"
msgstr "波浪特效"

msgid "insert.shake_bbcode"
msgstr "震動特效"

msgid "insert.typing_pause"
msgstr "輸入間隔"

msgid "insert.typing_speed_change"
msgstr "輸入速度變更"

msgid "insert.auto_advance"
msgstr "自動切行"

msgid "insert.templates"
msgstr "模板"

msgid "insert.title"
msgstr "標題"

msgid "insert.dialogue"
msgstr "對話"

msgid "insert.response"
msgstr "回覆選項"

msgid "insert.random_lines"
msgstr "隨機行"

msgid "insert.random_text"
msgstr "隨機文本"

msgid "insert.actions"
msgstr "操作"

msgid "insert.jump"
msgstr "標題間跳轉"

msgid "insert.end_dialogue"
msgstr "結束對話"

msgid "generate_line_ids"
msgstr "生成行 ID"

msgid "use_uuid_only_for_ids"
msgstr "僅使用 UUID 作為 ID"

msgid "set_id_prefix_length"
msgstr "設定 ID 前綴長度"

msgid "id_prefix_length"
msgstr "ID 前綴長度："

msgid "save_characters_to_csv"
msgstr "保存角色到 CSV"

msgid "save_to_csv"
msgstr "生成 CSV"

msgid "import_from_csv"
msgstr "從 CSV 匯入"

msgid "confirm_close"
msgstr "是否要儲存到“{path}”？"

msgid "confirm_close.save"
msgstr "儲存"

msgid "confirm_close.discard"
msgstr "不儲存"

msgid "buffer.save"
msgstr "儲存"

msgid "buffer.save_as"
msgstr "儲存爲……"

msgid "buffer.close"
msgstr "關閉"

msgid "buffer.close_all"
msgstr "全部關閉"

msgid "buffer.close_other_files"
msgstr "關閉其他檔案"

msgid "buffer.copy_file_path"
msgstr "複製檔案位置"

msgid "buffer.show_in_filesystem"
msgstr "在 Godot 側邊欄中顯示"

msgid "n_of_n"
msgstr "第{index}個，共{total}個"

msgid "search.find"
msgstr "搜尋:"

msgid "search.find_all"
msgstr "搜尋全部..."

msgid "search.placeholder"
msgstr "請輸入搜尋的內容"

msgid "search.replace_placeholder"
msgstr "請輸入替換的內容"

msgid "search.replace_selected"
msgstr "替換勾選"

msgid "search.previous"
msgstr "搜尋上一個"

msgid "search.next"
msgstr "搜尋下一個"

msgid "search.match_case"
msgstr "大小寫敏感"

msgid "search.toggle_replace"
msgstr "替換"

msgid "search.replace_with"
msgstr "替換爲"

msgid "search.replace"
msgstr "替換"

msgid "search.replace_all"
msgstr "全部替換"

msgid "files_list.filter"
msgstr "搜尋檔案"

msgid "titles_list.filter"
msgstr "搜尋標題"

msgid "errors.key_not_found"
msgstr "鍵“{key}”未找到"

msgid "errors.line_and_message"
msgstr "第{line}行第{colume}列發生錯誤：{message}"

msgid "errors_in_script"
msgstr "你的腳本中存在錯誤。請修復錯誤，然後重試。"

msgid "errors_with_build"
msgstr "請先解決 Dialogue 中的錯誤。"

msgid "errors.import_errors"
msgstr "被匯入的檔案存在問題。"

msgid "errors.already_imported"
msgstr "檔案已被匯入。"

msgid "errors.duplicate_import"
msgstr "匯入名不能重複。"

msgid "errors.empty_title"
msgstr "標題名不能爲空。"

msgid "errors.duplicate_title"
msgstr "標題名不能重複。"

msgid "errors.invalid_title_string"
msgstr "標題名無效。"

msgid "errors.invalid_title_number"
msgstr "標題不能以數字開始。"

msgid "errors.unknown_title"
msgstr "標題未定義。"

msgid "errors.jump_to_invalid_title"
msgstr "標題名無效。"

msgid "errors.title_has_no_content"
msgstr "目標標題爲空。請替換爲“=> END”。"

msgid "errors.invalid_expression"
msgstr "表達式無效。"

msgid "errors.unexpected_condition"
msgstr "未知條件。"

msgid "errors.duplicate_id"
msgstr "ID 重複。"

msgid "errors.missing_id"
msgstr "ID 不存在。"

msgid "errors.invalid_indentation"
msgstr "縮進無效。"

msgid "errors.condition_has_no_content"
msgstr "條件下方不能爲空。"

msgid "errors.incomplete_expression"
msgstr "不完整的表達式。"

msgid "errors.invalid_expression_for_value"
msgstr "無效的賦值表達式。"

msgid "errors.file_not_found"
msgstr "檔案不存在。"

msgid "errors.unexpected_end_of_expression"
msgstr "表達式 end 不應存在。"

msgid "errors.unexpected_function"
msgstr "函數不應存在。"

msgid "errors.unexpected_bracket"
msgstr "方括號不應存在。"

msgid "errors.unexpected_closing_bracket"
msgstr "方括號不應存在。"

msgid "errors.missing_closing_bracket"
msgstr "閉方括號不存在。"

msgid "errors.unexpected_operator"
msgstr "操作符不應存在。"

msgid "errors.unexpected_comma"
msgstr "逗號不應存在。"

msgid "errors.unexpected_colon"
msgstr "冒號不應存在。"

msgid "errors.unexpected_dot"
msgstr "句號不應存在。"

msgid "errors.unexpected_boolean"
msgstr "布爾值不應存在。"

msgid "errors.unexpected_string"
msgstr "字符串不應存在。"

msgid "errors.unexpected_number"
msgstr "數字不應存在。"

msgid "errors.unexpected_variable"
msgstr "標識符不應存在。"

msgid "errors.invalid_index"
msgstr "索引無效。"

msgid "errors.unexpected_assignment"
msgstr "不應在條件判斷中使用 = ，應使用 == 。"

msgid "errors.unknown"
msgstr "語法錯誤。"

msgid "update.available"
msgstr "v{version} 更新可用。"

msgid "update.is_available_for_download"
msgstr "v%s 已經可以下載。"

msgid "update.downloading"
msgstr "正在下載更新……"

msgid "update.download_update"
msgstr "下載"

msgid "update.needs_reload"
msgstr "需要重新加載項目以套用更新。"

msgid "update.reload_ok_button"
msgstr "重新加載"

msgid "update.reload_cancel_button"
msgstr "暫不重新加載"

msgid "update.reload_project"
msgstr "重新加載"

msgid "update.release_notes"
msgstr "查看發行註記"

msgid "update.success"
msgstr "v{version} 已成功安裝並套用。"

msgid "update.failed"
msgstr "更新失敗。"

msgid "runtime.no_resource"
msgstr "找不到資源。"

msgid "runtime.no_content"
msgstr "資源“{file_path}”爲空。"

msgid "runtime.errors"
msgstr "檔案中存在{errrors}個錯誤。"

msgid "runtime.error_detail"
msgstr "第{index}行：{message}"

msgid "runtime.errors_see_details"
msgstr "檔案中存在{errrors}個錯誤。請查看調試輸出。"

msgid "runtime.invalid_expression"
msgstr "表達式“{expression}”無效：{error}"

msgid "runtime.array_index_out_of_bounds"
msgstr "數組索引“{index}”越界。（數組名：“{array}”）"

msgid "runtime.left_hand_size_cannot_be_assigned_to"
msgstr "表達式左側的變量無法被賦值。"

msgid "runtime.key_not_found"
msgstr "鍵“{key}”在字典“{dictionary}”中不存在。"

msgid "runtime.property_not_found"
msgstr "“{property}”不存在。（全局變量：{states}）"

msgid "runtime.method_not_found"
msgstr "“{method}”不存在。（全局變量：{states}）"

msgid "runtime.signal_not_found"
msgstr "“{sighal_name}”不存在。（全局變量：{states}）"

msgid "runtime.property_not_found_missing_export"
msgstr "“{property}”不存在。（全局變量：{states}）你可能需要添加一個修飾詞 [Export]。"

msgid "runtime.method_not_callable"
msgstr "{method}不是對象“{object}”上的函數。"

msgid "runtime.unknown_operator"
msgstr "未知操作符。"

msgid "runtime.something_went_wrong"
msgstr "有什麼出錯了。"
```

## File: addons/dialogue_manager/l10n/zh.po
```
msgid ""
msgstr ""
"Project-Id-Version: Dialogue Manager\n"
"POT-Creation-Date: \n"
"PO-Revision-Date: \n"
"Last-Translator: \n"
"Language-Team: penghao123456、憨憨羊の宇航鸽鸽、ABShinri\n"
"Language: zh\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=UTF-8\n"
"Content-Transfer-Encoding: 8bit\n"
"X-Generator: Poedit 3.4\n"

msgid "start_a_new_file"
msgstr "创建新文件"

msgid "open_a_file"
msgstr "打开已有文件"

msgid "open.open"
msgstr "打开……"

msgid "open.no_recent_files"
msgstr "无历史记录"

msgid "open.clear_recent_files"
msgstr "清空历史记录"

msgid "save_all_files"
msgstr "保存所有文件"

msgid "find_in_files"
msgstr "在文件中查找"

msgid "test_dialogue"
msgstr "测试对话"

msgid "search_for_text"
msgstr "查找……"

msgid "insert"
msgstr "插入"

msgid "translations"
msgstr "翻译"

msgid "show_support"
msgstr "支持 Dialogue Manager"

msgid "docs"
msgstr "文档"

msgid "insert.wave_bbcode"
msgstr "波浪效果"

msgid "insert.shake_bbcode"
msgstr "抖动效果"

msgid "insert.typing_pause"
msgstr "输入间隔"

msgid "insert.typing_speed_change"
msgstr "输入速度变更"

msgid "insert.auto_advance"
msgstr "自动切行"

msgid "insert.templates"
msgstr "模板"

msgid "insert.title"
msgstr "标题"

msgid "insert.dialogue"
msgstr "对话"

msgid "insert.response"
msgstr "回复选项"

msgid "insert.random_lines"
msgstr "随机行"

msgid "insert.random_text"
msgstr "随机文本"

msgid "insert.actions"
msgstr "操作"

msgid "insert.jump"
msgstr "标题间跳转"

msgid "insert.end_dialogue"
msgstr "结束对话"

msgid "generate_line_ids"
msgstr "生成行 ID"

msgid "use_uuid_only_for_ids"
msgstr "仅使用UUID作为ID"

msgid "set_id_prefix_length"
msgstr "设置ID前缀长度"

msgid "id_prefix_length"
msgstr "ID前缀长度："

msgid "save_characters_to_csv"
msgstr "保存角色到 CSV"

msgid "save_to_csv"
msgstr "生成 CSV"

msgid "import_from_csv"
msgstr "从 CSV 导入"

msgid "confirm_close"
msgstr "是否要保存到“{path}”？"

msgid "confirm_close.save"
msgstr "保存"

msgid "confirm_close.discard"
msgstr "不保存"

msgid "buffer.save"
msgstr "保存"

msgid "buffer.save_as"
msgstr "另存为……"

msgid "buffer.close"
msgstr "关闭"

msgid "buffer.close_all"
msgstr "全部关闭"

msgid "buffer.close_other_files"
msgstr "关闭其他文件"

msgid "buffer.copy_file_path"
msgstr "复制文件路径"

msgid "buffer.show_in_filesystem"
msgstr "在 Godot 侧边栏中显示"

msgid "n_of_n"
msgstr "第{index}个，共{total}个"

msgid "search.find"
msgstr "查找:"

msgid "search.find_all"
msgstr "查找全部..."

msgid "search.placeholder"
msgstr "请输入查找的内容"

msgid "search.replace_placeholder"
msgstr "请输入替换的内容"

msgid "search.replace_selected"
msgstr "替换勾选"

msgid "search.previous"
msgstr "查找上一个"

msgid "search.next"
msgstr "查找下一个"

msgid "search.match_case"
msgstr "大小写敏感"

msgid "search.toggle_replace"
msgstr "替换"

msgid "search.replace_with"
msgstr "替换为"

msgid "search.replace"
msgstr "替换"

msgid "search.replace_all"
msgstr "全部替换"

msgid "files_list.filter"
msgstr "查找文件"

msgid "titles_list.filter"
msgstr "查找标题"

msgid "errors.key_not_found"
msgstr "键“{key}”未找到"

msgid "errors.line_and_message"
msgstr "第{line}行第{colume}列发生错误：{message}"

msgid "errors_in_script"
msgstr "你的脚本中存在错误。请修复错误，然后重试。"

msgid "errors_with_build"
msgstr "请先解决 Dialogue 中的错误。"

msgid "errors.import_errors"
msgstr "被导入的文件存在问题。"

msgid "errors.already_imported"
msgstr "文件已被导入。"

msgid "errors.duplicate_import"
msgstr "导入名不能重复。"

msgid "errors.empty_title"
msgstr "标题名不能为空。"

msgid "errors.duplicate_title"
msgstr "标题名不能重复。"

msgid "errors.invalid_title_string"
msgstr "标题名无效。"

msgid "errors.invalid_title_number"
msgstr "标题不能以数字开始。"

msgid "errors.unknown_title"
msgstr "标题未定义。"

msgid "errors.jump_to_invalid_title"
msgstr "标题名无效。"

msgid "errors.title_has_no_content"
msgstr "目标标题为空。请替换为“=> END”。"

msgid "errors.invalid_expression"
msgstr "表达式无效。"

msgid "errors.unexpected_condition"
msgstr "未知条件。"

msgid "errors.duplicate_id"
msgstr "ID 重复。"

msgid "errors.missing_id"
msgstr "ID 不存在。"

msgid "errors.invalid_indentation"
msgstr "缩进无效。"

msgid "errors.condition_has_no_content"
msgstr "条件下方不能为空。"

msgid "errors.incomplete_expression"
msgstr "不完整的表达式。"

msgid "errors.invalid_expression_for_value"
msgstr "无效的赋值表达式。"

msgid "errors.file_not_found"
msgstr "文件不存在。"

msgid "errors.unexpected_end_of_expression"
msgstr "表达式 end 不应存在。"

msgid "errors.unexpected_function"
msgstr "函数不应存在。"

msgid "errors.unexpected_bracket"
msgstr "方括号不应存在。"

msgid "errors.unexpected_closing_bracket"
msgstr "方括号不应存在。"

msgid "errors.missing_closing_bracket"
msgstr "闭方括号不存在。"

msgid "errors.unexpected_operator"
msgstr "操作符不应存在。"

msgid "errors.unexpected_comma"
msgstr "逗号不应存在。"

msgid "errors.unexpected_colon"
msgstr "冒号不应存在。"

msgid "errors.unexpected_dot"
msgstr "句号不应存在。"

msgid "errors.unexpected_boolean"
msgstr "布尔值不应存在。"

msgid "errors.unexpected_string"
msgstr "字符串不应存在。"

msgid "errors.unexpected_number"
msgstr "数字不应存在。"

msgid "errors.unexpected_variable"
msgstr "标识符不应存在。"

msgid "errors.invalid_index"
msgstr "索引无效。"

msgid "errors.unexpected_assignment"
msgstr "不应在条件判断中使用 = ，应使用 == 。"

msgid "errors.unknown"
msgstr "语法错误。"

msgid "update.available"
msgstr "v{version} 更新可用。"

msgid "update.is_available_for_download"
msgstr "v%s 已经可以下载。"

msgid "update.downloading"
msgstr "正在下载更新……"

msgid "update.download_update"
msgstr "下载"

msgid "update.needs_reload"
msgstr "需要重新加载项目以应用更新。"

msgid "update.reload_ok_button"
msgstr "重新加载"

msgid "update.reload_cancel_button"
msgstr "暂不重新加载"

msgid "update.reload_project"
msgstr "重新加载"

msgid "update.release_notes"
msgstr "查看发行注记"

msgid "update.success"
msgstr "v{version} 已成功安装并应用。"

msgid "update.failed"
msgstr "更新失败。"

msgid "runtime.no_resource"
msgstr "找不到资源。"

msgid "runtime.no_content"
msgstr "资源“{file_path}”为空。"

msgid "runtime.errors"
msgstr "文件中存在{errrors}个错误。"

msgid "runtime.error_detail"
msgstr "第{index}行：{message}"

msgid "runtime.errors_see_details"
msgstr "文件中存在{errrors}个错误。请查看调试输出。"

msgid "runtime.invalid_expression"
msgstr "表达式“{expression}”无效：{error}"

msgid "runtime.array_index_out_of_bounds"
msgstr "数组索引“{index}”越界。（数组名：“{array}”）"

msgid "runtime.left_hand_size_cannot_be_assigned_to"
msgstr "表达式左侧的变量无法被赋值。"

msgid "runtime.key_not_found"
msgstr "键“{key}”在字典“{dictionary}”中不存在。"

msgid "runtime.property_not_found"
msgstr "“{property}”不存在。（全局变量：{states}）"

msgid "runtime.property_not_found_missing_export"
msgstr "“{property}”不存在。（全局变量：{states}）你可能需要添加一个修饰词 [Export]。"

msgid "runtime.method_not_found"
msgstr "“{method}”不存在。（全局变量：{states}）"

msgid "runtime.signal_not_found"
msgstr "“{sighal_name}”不存在。（全局变量：{states}）"

msgid "runtime.method_not_callable"
msgstr "{method}不是对象“{object}”上的函数。"

msgid "runtime.unknown_operator"
msgstr "未知操作符。"

msgid "runtime.something_went_wrong"
msgstr "有什么出错了。"
```

## File: addons/dialogue_manager/utilities/builtins.gd
```
extends Object


const DialogueConstants = preload("../constants.gd")

const SUPPORTED_BUILTIN_TYPES = [
	TYPE_STRING,
	TYPE_STRING_NAME,
	TYPE_ARRAY,
	TYPE_PACKED_STRING_ARRAY,
	TYPE_VECTOR2,
	TYPE_VECTOR3,
	TYPE_VECTOR4,
	TYPE_DICTIONARY,
	TYPE_QUATERNION,
	TYPE_COLOR,
	TYPE_SIGNAL,
	TYPE_CALLABLE
]


static var resolve_method_error: Error = OK


static func is_supported(thing, with_method: String = "") -> bool:
	if not typeof(thing) in SUPPORTED_BUILTIN_TYPES: return false

	# If given a Dictionary and a method then make sure it's a known Dictionary method.
	if typeof(thing) == TYPE_DICTIONARY and with_method != "":
		return with_method in [
			&"clear",
			&"duplicate",
			&"erase",
			&"find_key",
			&"get",
			&"get_or_add",
			&"has",
			&"has_all",
			&"hash",
			&"is_empty",
			&"is_read_only",
			&"keys",
			&"make_read_only",
			&"merge",
			&"merged",
			&"recursive_equal",
			&"size",
			&"values"]

	return true


static func resolve_property(builtin, property: String):
	match typeof(builtin):
		TYPE_DICTIONARY:
			return builtin.get(property)
		TYPE_ARRAY, TYPE_PACKED_STRING_ARRAY, TYPE_QUATERNION, TYPE_STRING, TYPE_STRING_NAME:
			return builtin[property]

		# Some types have constants that we need to manually resolve

		TYPE_VECTOR2:
			return resolve_vector2_property(builtin, property)
		TYPE_VECTOR3:
			return resolve_vector3_property(builtin, property)
		TYPE_VECTOR4:
			return resolve_vector4_property(builtin, property)
		TYPE_COLOR:
			return resolve_color_property(builtin, property)


static func resolve_method(thing, method_name: String, args: Array):
	resolve_method_error = OK

	# Resolve static methods manually
	match typeof(thing):
		TYPE_VECTOR2:
			match method_name:
				"from_angle":
					return Vector2.from_angle(args[0])

		TYPE_COLOR:
			match method_name:
				"from_hsv":
					return Color.from_hsv(args[0], args[1], args[2]) if args.size() == 3 else Color.from_hsv(args[0], args[1], args[2], args[3])
				"from_ok_hsl":
					return Color.from_ok_hsl(args[0], args[1], args[2]) if args.size() == 3 else Color.from_ok_hsl(args[0], args[1], args[2], args[3])
				"from_rgbe9995":
					return Color.from_rgbe9995(args[0])
				"from_string":
					return Color.from_string(args[0], args[1])

		TYPE_QUATERNION:
			match method_name:
				"from_euler":
					return Quaternion.from_euler(args[0])

	# Anything else can be evaulatated automatically
	var references: Array = ["thing"]
	for i in range(0, args.size()):
		references.append("arg%d" % i)
	var expression = Expression.new()
	if expression.parse("thing.%s(%s)" % [method_name, ",".join(references.slice(1))], references) != OK:
		assert(false, expression.get_error_text())
	var result = expression.execute([thing] + args, null, false)
	if expression.has_execute_failed():
		resolve_method_error = ERR_CANT_RESOLVE
		return null

	return result


static func has_resolve_method_failed() -> bool:
	return resolve_method_error != OK


static func resolve_color_property(color: Color, property: String):
	match property:
		"ALICE_BLUE":
			return Color.ALICE_BLUE
		"ANTIQUE_WHITE":
			return Color.ANTIQUE_WHITE
		"AQUA":
			return Color.AQUA
		"AQUAMARINE":
			return Color.AQUAMARINE
		"AZURE":
			return Color.AZURE
		"BEIGE":
			return Color.BEIGE
		"BISQUE":
			return Color.BISQUE
		"BLACK":
			return Color.BLACK
		"BLANCHED_ALMOND":
			return Color.BLANCHED_ALMOND
		"BLUE":
			return Color.BLUE
		"BLUE_VIOLET":
			return Color.BLUE_VIOLET
		"BROWN":
			return Color.BROWN
		"BURLYWOOD":
			return Color.BURLYWOOD
		"CADET_BLUE":
			return Color.CADET_BLUE
		"CHARTREUSE":
			return Color.CHARTREUSE
		"CHOCOLATE":
			return Color.CHOCOLATE
		"CORAL":
			return Color.CORAL
		"CORNFLOWER_BLUE":
			return Color.CORNFLOWER_BLUE
		"CORNSILK":
			return Color.CORNSILK
		"CRIMSON":
			return Color.CRIMSON
		"CYAN":
			return Color.CYAN
		"DARK_BLUE":
			return Color.DARK_BLUE
		"DARK_CYAN":
			return Color.DARK_CYAN
		"DARK_GOLDENROD":
			return Color.DARK_GOLDENROD
		"DARK_GRAY":
			return Color.DARK_GRAY
		"DARK_GREEN":
			return Color.DARK_GREEN
		"DARK_KHAKI":
			return Color.DARK_KHAKI
		"DARK_MAGENTA":
			return Color.DARK_MAGENTA
		"DARK_OLIVE_GREEN":
			return Color.DARK_OLIVE_GREEN
		"DARK_ORANGE":
			return Color.DARK_ORANGE
		"DARK_ORCHID":
			return Color.DARK_ORCHID
		"DARK_RED":
			return Color.DARK_RED
		"DARK_SALMON":
			return Color.DARK_SALMON
		"DARK_SEA_GREEN":
			return Color.DARK_SEA_GREEN
		"DARK_SLATE_BLUE":
			return Color.DARK_SLATE_BLUE
		"DARK_SLATE_GRAY":
			return Color.DARK_SLATE_GRAY
		"DARK_TURQUOISE":
			return Color.DARK_TURQUOISE
		"DARK_VIOLET":
			return Color.DARK_VIOLET
		"DEEP_PINK":
			return Color.DEEP_PINK
		"DEEP_SKY_BLUE":
			return Color.DEEP_SKY_BLUE
		"DIM_GRAY":
			return Color.DIM_GRAY
		"DODGER_BLUE":
			return Color.DODGER_BLUE
		"FIREBRICK":
			return Color.FIREBRICK
		"FLORAL_WHITE":
			return Color.FLORAL_WHITE
		"FOREST_GREEN":
			return Color.FOREST_GREEN
		"FUCHSIA":
			return Color.FUCHSIA
		"GAINSBORO":
			return Color.GAINSBORO
		"GHOST_WHITE":
			return Color.GHOST_WHITE
		"GOLD":
			return Color.GOLD
		"GOLDENROD":
			return Color.GOLDENROD
		"GRAY":
			return Color.GRAY
		"GREEN":
			return Color.GREEN
		"GREEN_YELLOW":
			return Color.GREEN_YELLOW
		"HONEYDEW":
			return Color.HONEYDEW
		"HOT_PINK":
			return Color.HOT_PINK
		"INDIAN_RED":
			return Color.INDIAN_RED
		"INDIGO":
			return Color.INDIGO
		"IVORY":
			return Color.IVORY
		"KHAKI":
			return Color.KHAKI
		"LAVENDER":
			return Color.LAVENDER
		"LAVENDER_BLUSH":
			return Color.LAVENDER_BLUSH
		"LAWN_GREEN":
			return Color.LAWN_GREEN
		"LEMON_CHIFFON":
			return Color.LEMON_CHIFFON
		"LIGHT_BLUE":
			return Color.LIGHT_BLUE
		"LIGHT_CORAL":
			return Color.LIGHT_CORAL
		"LIGHT_CYAN":
			return Color.LIGHT_CYAN
		"LIGHT_GOLDENROD":
			return Color.LIGHT_GOLDENROD
		"LIGHT_GRAY":
			return Color.LIGHT_GRAY
		"LIGHT_GREEN":
			return Color.LIGHT_GREEN
		"LIGHT_PINK":
			return Color.LIGHT_PINK
		"LIGHT_SALMON":
			return Color.LIGHT_SALMON
		"LIGHT_SEA_GREEN":
			return Color.LIGHT_SEA_GREEN
		"LIGHT_SKY_BLUE":
			return Color.LIGHT_SKY_BLUE
		"LIGHT_SLATE_GRAY":
			return Color.LIGHT_SLATE_GRAY
		"LIGHT_STEEL_BLUE":
			return Color.LIGHT_STEEL_BLUE
		"LIGHT_YELLOW":
			return Color.LIGHT_YELLOW
		"LIME":
			return Color.LIME
		"LIME_GREEN":
			return Color.LIME_GREEN
		"LINEN":
			return Color.LINEN
		"MAGENTA":
			return Color.MAGENTA
		"MAROON":
			return Color.MAROON
		"MEDIUM_AQUAMARINE":
			return Color.MEDIUM_AQUAMARINE
		"MEDIUM_BLUE":
			return Color.MEDIUM_BLUE
		"MEDIUM_ORCHID":
			return Color.MEDIUM_ORCHID
		"MEDIUM_PURPLE":
			return Color.MEDIUM_PURPLE
		"MEDIUM_SEA_GREEN":
			return Color.MEDIUM_SEA_GREEN
		"MEDIUM_SLATE_BLUE":
			return Color.MEDIUM_SLATE_BLUE
		"MEDIUM_SPRING_GREEN":
			return Color.MEDIUM_SPRING_GREEN
		"MEDIUM_TURQUOISE":
			return Color.MEDIUM_TURQUOISE
		"MEDIUM_VIOLET_RED":
			return Color.MEDIUM_VIOLET_RED
		"MIDNIGHT_BLUE":
			return Color.MIDNIGHT_BLUE
		"MINT_CREAM":
			return Color.MINT_CREAM
		"MISTY_ROSE":
			return Color.MISTY_ROSE
		"MOCCASIN":
			return Color.MOCCASIN
		"NAVAJO_WHITE":
			return Color.NAVAJO_WHITE
		"NAVY_BLUE":
			return Color.NAVY_BLUE
		"OLD_LACE":
			return Color.OLD_LACE
		"OLIVE":
			return Color.OLIVE
		"OLIVE_DRAB":
			return Color.OLIVE_DRAB
		"ORANGE":
			return Color.ORANGE
		"ORANGE_RED":
			return Color.ORANGE_RED
		"ORCHID":
			return Color.ORCHID
		"PALE_GOLDENROD":
			return Color.PALE_GOLDENROD
		"PALE_GREEN":
			return Color.PALE_GREEN
		"PALE_TURQUOISE":
			return Color.PALE_TURQUOISE
		"PALE_VIOLET_RED":
			return Color.PALE_VIOLET_RED
		"PAPAYA_WHIP":
			return Color.PAPAYA_WHIP
		"PEACH_PUFF":
			return Color.PEACH_PUFF
		"PERU":
			return Color.PERU
		"PINK":
			return Color.PINK
		"PLUM":
			return Color.PLUM
		"POWDER_BLUE":
			return Color.POWDER_BLUE
		"PURPLE":
			return Color.PURPLE
		"REBECCA_PURPLE":
			return Color.REBECCA_PURPLE
		"RED":
			return Color.RED
		"ROSY_BROWN":
			return Color.ROSY_BROWN
		"ROYAL_BLUE":
			return Color.ROYAL_BLUE
		"SADDLE_BROWN":
			return Color.SADDLE_BROWN
		"SALMON":
			return Color.SALMON
		"SANDY_BROWN":
			return Color.SANDY_BROWN
		"SEA_GREEN":
			return Color.SEA_GREEN
		"SEASHELL":
			return Color.SEASHELL
		"SIENNA":
			return Color.SIENNA
		"SILVER":
			return Color.SILVER
		"SKY_BLUE":
			return Color.SKY_BLUE
		"SLATE_BLUE":
			return Color.SLATE_BLUE
		"SLATE_GRAY":
			return Color.SLATE_GRAY
		"SNOW":
			return Color.SNOW
		"SPRING_GREEN":
			return Color.SPRING_GREEN
		"STEEL_BLUE":
			return Color.STEEL_BLUE
		"TAN":
			return Color.TAN
		"TEAL":
			return Color.TEAL
		"THISTLE":
			return Color.THISTLE
		"TOMATO":
			return Color.TOMATO
		"TRANSPARENT":
			return Color.TRANSPARENT
		"TURQUOISE":
			return Color.TURQUOISE
		"VIOLET":
			return Color.VIOLET
		"WEB_GRAY":
			return Color.WEB_GRAY
		"WEB_GREEN":
			return Color.WEB_GREEN
		"WEB_MAROON":
			return Color.WEB_MAROON
		"WEB_PURPLE":
			return Color.WEB_PURPLE
		"WHEAT":
			return Color.WHEAT
		"WHITE":
			return Color.WHITE
		"WHITE_SMOKE":
			return Color.WHITE_SMOKE
		"YELLOW":
			return Color.YELLOW
		"YELLOW_GREEN":
			return Color.YELLOW_GREEN

	return color[property]


static func resolve_vector2_property(vector: Vector2, property: String):
	match property:
		"AXIS_X":
			return Vector2.AXIS_X
		"AXIS_Y":
			return Vector2.AXIS_Y
		"ZERO":
			return Vector2.ZERO
		"ONE":
			return Vector2.ONE
		"INF":
			return Vector2.INF
		"LEFT":
			return Vector2.LEFT
		"RIGHT":
			return Vector2.RIGHT
		"UP":
			return Vector2.UP
		"DOWN":
			return Vector2.DOWN

		"DOWN_LEFT":
			return Vector2(-1, 1)
		"DOWN_RIGHT":
			return Vector2(1, 1)
		"UP_LEFT":
			return Vector2(-1, -1)
		"UP_RIGHT":
			return Vector2(1, -1)

	return vector[property]


static func resolve_vector3_property(vector: Vector3, property: String):
	match property:
		"AXIS_X":
			return Vector3.AXIS_X
		"AXIS_Y":
			return Vector3.AXIS_Y
		"AXIS_Z":
			return Vector3.AXIS_Z
		"ZERO":
			return Vector3.ZERO
		"ONE":
			return Vector3.ONE
		"INF":
			return Vector3.INF
		"LEFT":
			return Vector3.LEFT
		"RIGHT":
			return Vector3.RIGHT
		"UP":
			return Vector3.UP
		"DOWN":
			return Vector3.DOWN
		"FORWARD":
			return Vector3.FORWARD
		"BACK":
			return Vector3.BACK
		"MODEL_LEFT":
			return Vector3(1, 0, 0)
		"MODEL_RIGHT":
			return Vector3(-1, 0, 0)
		"MODEL_TOP":
			return Vector3(0, 1, 0)
		"MODEL_BOTTOM":
			return Vector3(0, -1, 0)
		"MODEL_FRONT":
			return Vector3(0, 0, 1)
		"MODEL_REAR":
			return Vector3(0, 0, -1)

	return vector[property]


static func resolve_vector4_property(vector: Vector4, property: String):
	match property:
		"AXIS_X":
			return Vector4.AXIS_X
		"AXIS_Y":
			return Vector4.AXIS_Y
		"AXIS_Z":
			return Vector4.AXIS_Z
		"AXIS_W":
			return Vector4.AXIS_W
		"ZERO":
			return Vector4.ZERO
		"ONE":
			return Vector4.ONE
		"INF":
			return Vector4.INF

	return vector[property]
```

## File: addons/dialogue_manager/utilities/builtins.gd.uid
```
uid://bnfhuubdv5k20
```

## File: addons/dialogue_manager/utilities/dialogue_cache.gd
```
class_name DMCache extends RefCounted


# Keep track of errors and dependencies
# {
# 	<dialogue file path> = {
# 		path = <dialogue file path>,
# 		dependencies = [<dialogue file path>, <dialogue file path>],
# 		errors = [<error>, <error>]
# 	}
# }
static var _cache: Dictionary = {}

static var _update_dependency_timer: Timer
static var _update_dependency_paths: PackedStringArray = []

static var _files_marked_for_reimport: PackedStringArray = []

# Keep track of used static IDs
# {
# 	<static ID> = <file path>
# }
# Before compiling a file, remove any static IDs with a file path that matches
# the file
static var known_static_ids: Dictionary = {}


# Build the initial cache for dialogue files
static func prepare() -> void:
	_update_dependency_timer = Timer.new()
	_update_dependency_timer.timeout.connect(_on_dependency_timer_timeout)
	DMPlugin.instance.add_child(_update_dependency_timer)

	var current_files: PackedStringArray = _get_dialogue_files_in_filesystem()
	for file: String in current_files:
		add_file(file)

	# Find any static IDs
	var key_regex: RegEx = RegEx.create_from_string("\\[ID:(?<key>.*?)\\]")
	for file_path: String in get_files():
		var text: String = FileAccess.get_file_as_string(file_path)
		var lines: PackedStringArray = text.split("\n")
		for i: int in range(0, lines.size()):
			var line = lines[i]
			var found = key_regex.search(line)
			if found:
				known_static_ids[found.strings[found.names.get("key")]] = file_path


static func mark_files_for_reimport(files: PackedStringArray) -> void:
	for file: String in files:
		if not _files_marked_for_reimport.has(file):
			_files_marked_for_reimport.append(file)


static func reimport_files(and_files: PackedStringArray = []) -> void:
	for file: String in and_files:
		if not _files_marked_for_reimport.has(file):
			_files_marked_for_reimport.append(file)

	if _files_marked_for_reimport.is_empty(): return

	# Guard against recursive reimport calls. Don't mark for reimport unless attempted once.
	var filesystem: EditorFileSystem = EditorInterface.get_resource_filesystem()
	if filesystem.is_scanning():
		# Defer the reimport to the next idle frame.
		_schedule_deferred_reimport.call_deferred()
		return

	# Attempt reimport immediately if not busy.
	EditorInterface.get_resource_filesystem().reimport_files(_files_marked_for_reimport)
	_files_marked_for_reimport.clear()


## Helper to try and resolve recursive import crashes while importer is busy.
static func _schedule_deferred_reimport() -> void:
	# Wait before trying again.
	if _files_marked_for_reimport.is_empty(): return

	var filesystem: EditorFileSystem = EditorInterface.get_resource_filesystem()
	if filesystem.is_scanning():
		# Still working on it. Try again later.
		await Engine.get_main_loop().create_timer(0.1).timeout
		_schedule_deferred_reimport()
		return

	filesystem.reimport_files(_files_marked_for_reimport)
	_files_marked_for_reimport.clear()


## Add a dialogue file to the cache.
static func add_file(path: String, compile_result: DMCompilerResult = null) -> void:
	_cache[path] = {
		path = path,
		dependencies = [],
		errors = []
	}

	if compile_result != null:
		_cache[path].dependencies = Array(compile_result.imported_paths).filter(func(d): return d != path)
		_cache[path].compiled_at = Time.get_ticks_msec()

	queue_updating_dependencies(path)


## Get the file paths in the cache
static func get_files() -> PackedStringArray:
	return _cache.keys()


## Check if a file is known to the cache
static func has_file(path: String) -> bool:
	return _cache.has(path)


## Remember any errors in a dialogue file
static func add_errors_to_file(path: String, errors: Array[Dictionary]) -> void:
	if _cache.has(path):
		_cache[path].errors = errors
	else:
		_cache[path] = {
			path = path,
			resource_path = "",
			dependencies = [],
			errors = errors
		}


## Get a list of files that have errors
static func get_files_with_errors() -> Array[Dictionary]:
	var files_with_errors: Array[Dictionary] = []
	for dialogue_file in _cache.values():
		if dialogue_file and dialogue_file.errors.size() > 0:
			files_with_errors.append(dialogue_file)
	return files_with_errors


## Queue a file to have its dependencies checked
static func queue_updating_dependencies(of_path: String) -> void:
	if _update_dependency_paths.has(of_path): return

	_update_dependency_timer.stop()
	if not _update_dependency_paths.has(of_path):
		_update_dependency_paths.append(of_path)
	_update_dependency_timer.start(0.5)


## Update any references to a file path that has moved
static func move_file_path(from_path: String, to_path: String) -> void:
	if not _cache.has(from_path): return

	if to_path != "":
		_cache[to_path] = _cache[from_path].duplicate()
	_cache.erase(from_path)


## Get every dialogue file that imports on a file of a given path
static func get_files_with_dependency(imported_path: String) -> Array:
	return _cache.values().filter(func(d): return d.dependencies.has(imported_path))


## Get any paths that are dependent on a given path
static func get_dependent_paths_for_reimport(on_path: String) -> PackedStringArray:
	return get_files_with_dependency(on_path) \
		.filter(func(d): return Time.get_ticks_msec() - d.get("compiled_at", 0) > 3000) \
		.map(func(d): return d.path)


# Recursively find any dialogue files in a directory
static func _get_dialogue_files_in_filesystem(path: String = "res://") -> PackedStringArray:
	var files: PackedStringArray = []

	if DirAccess.dir_exists_absolute(path):
		var dir: DirAccess = DirAccess.open(path)
		dir.list_dir_begin()
		var file_name: String = dir.get_next()
		while file_name != "":
			var file_path: String = (path + "/" + file_name).simplify_path()
			if dir.current_is_dir():
				if not file_name in [".godot", ".tmp"]:
					files.append_array(_get_dialogue_files_in_filesystem(file_path))
			elif file_name.get_extension() == "dialogue":
				files.append(file_path)
			file_name = dir.get_next()

	return files


#region Signals


static func _on_dependency_timer_timeout() -> void:
	_update_dependency_timer.stop()
	var import_regex: RegEx = RegEx.create_from_string("import \"(?<path>.*?)\"")
	var file: FileAccess
	var found_imports: Array[RegExMatch]
	for path in _update_dependency_paths:
		# Open the file and check for any "import" lines
		file = FileAccess.open(path, FileAccess.READ)
		found_imports = import_regex.search_all(file.get_as_text())
		var dependencies: PackedStringArray = []
		for found in found_imports:
			dependencies.append(found.strings[found.names.path])
		_cache[path].dependencies = dependencies
	_update_dependency_paths.clear()


#endregion
```

## File: addons/dialogue_manager/utilities/dialogue_cache.gd.uid
```
uid://d3c83yd6bjp43
```

## File: addons/dialogue_manager/utilities/translations.gd
```
## A collection of utility functions for working with dialogue translations.
class_name DMTranslationUtilities extends RefCounted


## Generate translation keys from some text.
static func generate_translation_keys() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()

	for file_path: String in DMCache.get_files():
		var text: String = FileAccess.get_file_as_string(file_path)

		var lines: PackedStringArray = text.split("\n")
		var compiled_lines: Dictionary = DMCompiler.compile_string(text, "").lines

		# Add in any that are missing
		for i in lines.size():
			var line = lines[i]
			var l = line.strip_edges()

			if not [DMConstants.TYPE_DIALOGUE, DMConstants.TYPE_RESPONSE].has(DMCompiler.get_line_type(l)): continue
			if not compiled_lines.has(str(i)): continue

			if "[ID:" in line: continue

			var translatable_text: String = ""
			if l.begins_with("- "):
				translatable_text = DMCompiler.extract_translatable_string(l)
			else:
				translatable_text = l.substr(l.find(":") + 1)

			var key: String = _generate_id(file_path)
			while key in DMCache.known_static_ids:
				key = _generate_id(file_path)
			line = line.replace("\\n", "!NEWLINE!")
			translatable_text = translatable_text.replace("\n", "!NEWLINE!")
			lines[i] = line.replace(translatable_text, translatable_text + " [ID:%s]" % [key]).replace("!NEWLINE!", "\\n")

			DMCache.known_static_ids[key] = file_path

		text = "\n".join(lines)

		var file: FileAccess = FileAccess.open(file_path, FileAccess.WRITE)
		file.store_string(text)
		file.close()


## Get a random-ish ID for a line.
static func _generate_id(file_path: String) -> String:
	return (file_path.sha1_text().substr(0, 6) + "_" + str(randi() % 1000000).sha1_text().substr(0, 6)).to_upper()


## Export dialogue and responses to CSV.
static func export_translations_to_csv(to_path: String, text: String, dialogue_path: String) -> void:
	var default_locale: String = DMSettings.get_setting(DMSettings.DEFAULT_CSV_LOCALE, "en")

	var file: FileAccess

	# If the file exists, open it first and work out which keys are already in it
	var existing_csv: Dictionary = {}
	var delimiter: String = get_delimiter_for_csv(to_path)
	var column_count: int = 2
	var default_locale_column: int = 1
	var character_column: int = -1
	var notes_column: int = -1
	if FileAccess.file_exists(to_path):
		file = FileAccess.open(to_path, FileAccess.READ)
		var is_first_line = true
		var line: Array
		while !file.eof_reached():
			line = file.get_csv_line(delimiter)
			if is_first_line:
				is_first_line = false
				column_count = line.size()
				for i in range(1, line.size()):
					if line[i] == default_locale:
						default_locale_column = i
					elif line[i] == "_character":
						character_column = i
					elif line[i] == "_notes":
						notes_column = i

			# Make sure the line isn't empty before adding it
			if line.size() > 0 and line[0].strip_edges() != "":
				existing_csv[line[0]] = line

		# The character column wasn't found in the existing file but the setting is turned on
		if character_column == -1 and DMSettings.get_setting(DMSettings.INCLUDE_CHARACTER_IN_TRANSLATION_EXPORTS, false):
			character_column = column_count
			column_count += 1
			existing_csv["keys"].append("_character")

		# The notes column wasn't found in the existing file but the setting is turned on
		if notes_column == -1 and DMSettings.get_setting(DMSettings.INCLUDE_NOTES_IN_TRANSLATION_EXPORTS, false):
			notes_column = column_count
			column_count += 1
			existing_csv["keys"].append("_notes")

	# Start a new file
	file = FileAccess.open(to_path, FileAccess.WRITE)

	if not FileAccess.file_exists(to_path):
		var headings: PackedStringArray = ["keys", default_locale] + DMSettings.get_setting(DMSettings.EXTRA_CSV_LOCALES, [])
		if DMSettings.get_setting(DMSettings.INCLUDE_CHARACTER_IN_TRANSLATION_EXPORTS, false):
			character_column = headings.size()
			headings.append("_character")
		if DMSettings.get_setting(DMSettings.INCLUDE_NOTES_IN_TRANSLATION_EXPORTS, false):
			notes_column = headings.size()
			headings.append("_notes")

		file.store_csv_line(headings, delimiter)
		column_count = headings.size()

	# Write our translations to file
	var known_keys: PackedStringArray = []

	var dialogue = DMCompiler.compile_string(text, dialogue_path).lines

	# Make a list of stuff that needs to go into the file
	var lines_to_save = []
	for key in dialogue.keys():
		var line: Dictionary = dialogue.get(key)

		if not line.type in [DMConstants.TYPE_DIALOGUE, DMConstants.TYPE_RESPONSE]: continue

		var translation_key: String = line.get(&"translation_key", line.text)

		if translation_key in known_keys: continue

		known_keys.append(translation_key)

		var line_to_save: PackedStringArray = []
		if existing_csv.has(translation_key):
			line_to_save = existing_csv.get(translation_key)
			line_to_save.resize(column_count)
			existing_csv.erase(translation_key)
		else:
			line_to_save.resize(column_count)
			line_to_save[0] = translation_key

		line_to_save[default_locale_column] = line.text
		if character_column > -1:
			line_to_save[character_column] = "(response)" if line.type == DMConstants.TYPE_RESPONSE else line.character
		if notes_column > -1:
			line_to_save[notes_column] = line.get("notes", "")

		lines_to_save.append(line_to_save)

	# Store lines in the file, starting with anything that already exists that hasn't been touched
	for line in existing_csv.values():
		file.store_csv_line(line, delimiter)
	for line in lines_to_save:
		file.store_csv_line(line, delimiter)

	file.close()


## Get the delimier used for an existing CSV
static func get_delimiter_for_csv(path: String) -> String:
	if FileAccess.file_exists(path):
		var import_path: String = "%s.%s" % [path, "import"]
		var import_file: ConfigFile = ConfigFile.new()
		if import_file.load(import_path) == OK:
			match import_file.get_value("params", "delimier", 0):
				0:
					return ","
				1:
					return ";"
				2:
					return "\t"

	match DMSettings.get_setting(DMSettings.DEFAULT_CSV_DELIMITER, "Comma"):
		"Comma":
			return ","
		"Semicolon":
			return ";"
		"Tab":
			return "\t"

	return ","


## Save any character names in a file to CSV.
static func export_character_names_to_csv(to_path: String, text: String, dialogue_path: String) -> void:
	var file: FileAccess

	# If the file exists, open it first and work out which keys are already in it
	var existing_csv = {}
	var delimiter: String = get_delimiter_for_csv(to_path)
	var commas = []
	if FileAccess.file_exists(to_path):
		file = FileAccess.open(to_path, FileAccess.READ)
		var is_first_line = true
		var line: Array
		while !file.eof_reached():
			line = file.get_csv_line(delimiter)
			if is_first_line:
				is_first_line = false
				for i in range(2, line.size()):
					commas.append("")
			# Make sure the line isn't empty before adding it
			if line.size() > 0 and line[0].strip_edges() != "":
				existing_csv[line[0]] = line

	# Start a new file
	file = FileAccess.open(to_path, FileAccess.WRITE)

	if not file.file_exists(to_path):
		file.store_csv_line(["keys", DMSettings.get_setting(DMSettings.DEFAULT_CSV_LOCALE, "en")], delimiter)

	# Write our translations to file
	var known_keys: PackedStringArray = []

	var character_names: PackedStringArray = DMCompiler.compile_string(text, dialogue_path).character_names

	# Make a list of stuff that needs to go into the file
	var lines_to_save = []
	for character_name in character_names:
		if character_name in known_keys: continue

		known_keys.append(character_name)

		if existing_csv.has(character_name):
			var existing_line = existing_csv.get(character_name)
			existing_line[1] = character_name
			lines_to_save.append(existing_line)
			existing_csv.erase(character_name)
		else:
			lines_to_save.append(PackedStringArray([character_name, character_name] + commas))

	# Store lines in the file, starting with anything that already exists that hasn't been touched
	for line in existing_csv.values():
		file.store_csv_line(line, delimiter)
	for line in lines_to_save:
		file.store_csv_line(line, delimiter)

	file.close()


## Replace translatable lines in some text using an existing CSV.
static func import_translations_from_csv(from_path: String, text: String) -> String:
	if not FileAccess.file_exists(from_path): return text

	# Open the CSV file and build a dictionary of the known keys
	var delimiter: String = get_delimiter_for_csv(from_path)
	var keys: Dictionary = {}
	var file: FileAccess = FileAccess.open(from_path, FileAccess.READ)
	var csv_line: Array
	while !file.eof_reached():
		csv_line = file.get_csv_line(delimiter)
		if csv_line.size() > 1:
			keys[csv_line[0]] = csv_line[1]

	# Now look over each line in the dialogue and replace the content for matched keys
	var lines: PackedStringArray = text.split("\n")
	var start_index: int = 0
	var end_index: int = 0
	for i in range(0, lines.size()):
		var line: String = lines[i]
		var translation_key: String = DMCompiler.get_static_line_id(line)
		if keys.has(translation_key):
			if DMCompiler.get_line_type(line) == DMConstants.TYPE_DIALOGUE:
				start_index = 0
				# See if we need to skip over a character name
				line = line.replace("\\:", "!ESCAPED_COLON!")
				if ": " in line:
					start_index = line.find(": ") + 2
				lines[i] = (line.substr(0, start_index) + keys.get(translation_key) + " [ID:" + translation_key + "]").replace("!ESCAPED_COLON!", ":")

			elif DMCompiler.get_line_type(line) == DMConstants.TYPE_RESPONSE:
				start_index = line.find("- ") + 2
				# See if we need to skip over a character name
				line = line.replace("\\:", "!ESCAPED_COLON!")
				if ": " in line:
					start_index = line.find(": ") + 2
				end_index = line.length()
				if " =>" in line:
					end_index = line.find(" =>")
				if " [if " in line:
					end_index = line.find(" [if ")
				lines[i] = (line.substr(0, start_index) + keys.get(translation_key) + " [ID:" + translation_key + "]" + line.substr(end_index)).replace("!ESCAPED_COLON!", ":")

	return "\n".join(lines)
```

## File: addons/dialogue_manager/utilities/translations.gd.uid
```
uid://c74q663mmfyk1
```

## File: addons/dialogue_manager/utilities/waiter.gd
```
class_name DMWaiter extends Node


signal waited()


var _actions: PackedStringArray
var _null: String = str(null)


func _init(target_actions: PackedStringArray) -> void:
	_actions = target_actions


func _input(event: InputEvent) -> void:
	for action: String in _actions:
		if event.is_pressed():
			if action == _null or (InputMap.has_action(action) and event.is_action(action)):
				get_viewport().set_input_as_handled()
				waited.emit()
```

## File: addons/dialogue_manager/utilities/waiter.gd.uid
```
uid://bx7dtro7ywali
```

## File: addons/dialogue_manager/views/find_in_dialogue_view.gd
```
@tool
extends Control

signal result_selected(path: String, cursor: Vector2, length: int)


const DialogueConstants = preload("../constants.gd")


var main_view: Control

@onready var input: LineEdit = %Input
@onready var search_button: Button = %SearchButton
@onready var match_case_button: CheckBox = %MatchCaseButton
@onready var replace_toggle: CheckButton = %ReplaceToggle
@onready var replace_container: VBoxContainer = %ReplaceContainer
@onready var replace_input: LineEdit = %ReplaceInput
@onready var replace_selected_button: Button = %ReplaceSelectedButton
@onready var replace_all_button: Button = %ReplaceAllButton
@onready var results_container: VBoxContainer = %ResultsContainer
@onready var result_template: HBoxContainer = %ResultTemplate

var current_results: Dictionary = {}:
	set(value):
		current_results = value
		update_results_view()
		if current_results.size() == 0:
			replace_selected_button.disabled = true
			replace_all_button.disabled = true
		else:
			replace_selected_button.disabled = false
			replace_all_button.disabled = false
	get:
		return current_results

var selections: PackedStringArray = []


func _ready() -> void:
	remove_child(result_template)


func _exit_tree() -> void:
	result_template.queue_free()


func prepare() -> void:
	if not is_node_ready():
		await ready

	input.grab_focus()

	var template_label = result_template.get_node("Label")
	template_label.get_theme_stylebox(&"focus").bg_color = main_view.code_edit.theme_overrides.current_line_color
	template_label.add_theme_font_override(&"normal_font", main_view.code_edit.get_theme_font(&"font"))

	replace_toggle.set_pressed_no_signal(false)
	replace_container.hide()

	$VBoxContainer/HBoxContainer/FindContainer/Label.text = DialogueConstants.translate(&"search.find")
	input.placeholder_text = DialogueConstants.translate(&"search.placeholder")
	input.text = ""
	search_button.text = DialogueConstants.translate(&"search.find_all")
	match_case_button.text = DialogueConstants.translate(&"search.match_case")
	replace_toggle.text = DialogueConstants.translate(&"search.toggle_replace")
	$VBoxContainer/HBoxContainer/ReplaceContainer/ReplaceLabel.text = DialogueConstants.translate(&"search.replace_with")
	replace_input.placeholder_text = DialogueConstants.translate(&"search.replace_placeholder")
	replace_input.text = ""
	replace_all_button.text = DialogueConstants.translate(&"search.replace_all")
	replace_selected_button.text = DialogueConstants.translate(&"search.replace_selected")

	selections.clear()
	current_results = {}


#region helpers


func update_results_view() -> void:
	for child in results_container.get_children():
		child.queue_free()

	for path in current_results.keys():
		var path_label: Label = Label.new()
		path_label.text = path
		# Show open files
		if main_view.open_buffers.has(path):
			path_label.text += "(*)"
		results_container.add_child(path_label)
		for path_result in current_results.get(path):
			var result_item: HBoxContainer = result_template.duplicate()

			var checkbox: CheckBox = result_item.get_node("CheckBox") as CheckBox
			var key: String = get_selection_key(path, path_result)
			checkbox.toggled.connect(func(is_pressed):
				if is_pressed:
					if not selections.has(key):
						selections.append(key)
				else:
					if selections.has(key):
						selections.remove_at(selections.find(key))
			)
			checkbox.set_pressed_no_signal(selections.has(key))
			checkbox.visible = replace_toggle.button_pressed

			var result_label: RichTextLabel = result_item.get_node("Label") as RichTextLabel
			var colors: Dictionary = main_view.code_edit.theme_overrides
			var highlight: String = ""
			if replace_toggle.button_pressed:
				var matched_word: String = "[bgcolor=" + colors.critical_color.to_html() + "][color=" + colors.text_color.to_html() + "]" + path_result.matched_text + "[/color][/bgcolor]"
				highlight = "[s]" + matched_word + "[/s][bgcolor=" + colors.notice_color.to_html() + "][color=" + colors.text_color.to_html() + "]" + replace_input.text + "[/color][/bgcolor]"
			else:
				highlight = "[bgcolor=" + colors.notice_color.to_html() + "][color=" + colors.text_color.to_html() + "]" + path_result.matched_text + "[/color][/bgcolor]"
			var text: String = path_result.text.substr(0, path_result.index) + highlight + path_result.text.substr(path_result.index + path_result.query.length())
			result_label.text = "%s: %s" % [str(path_result.line + 1).lpad(4), text]
			result_label.gui_input.connect(func(event):
				if event is InputEventMouseButton and (event as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT and (event as InputEventMouseButton).double_click:
					result_selected.emit(path, Vector2(path_result.index, path_result.line), path_result.query.length())
			)

			results_container.add_child(result_item)


func find_in_files() -> Dictionary:
	var results: Dictionary = {}

	var q: String = input.text
	var file: FileAccess
	for path in DMCache.get_files():
		var path_results: Array = []
		var lines: PackedStringArray = []

		if main_view.open_buffers.has(path):
			lines = main_view.open_buffers.get(path).text.split("\n")
		else:
			file = FileAccess.open(path, FileAccess.READ)
			lines = file.get_as_text().split("\n")

		for i in range(0, lines.size()):
			var index: int = find_in_line(lines[i], q)
			while index > -1:
				path_results.append({
					line = i,
					index = index,
					text = lines[i],
					matched_text = lines[i].substr(index, q.length()),
					query = q
				})
				index = find_in_line(lines[i], q, index + q.length())

		if file != null and file.is_open():
			file.close()

		if path_results.size() > 0:
			results[path] = path_results

	return results


func get_selection_key(path: String, path_result: Dictionary) -> String:
	return "%s-%d-%d" % [path, path_result.line, path_result.index]


func find_in_line(line: String, query: String, from_index: int = 0) -> int:
	if match_case_button.button_pressed:
		return line.find(query, from_index)
	else:
		return line.findn(query, from_index)


func replace_results(only_selected: bool) -> void:
	var file: FileAccess
	var lines: PackedStringArray = []
	for path in current_results:
		if main_view.open_buffers.has(path):
			lines = main_view.open_buffers.get(path).text.split("\n")
		else:
			file = FileAccess.open(path, FileAccess.READ)
			lines = file.get_as_text().split("\n")

		# Read the results in reverse because we're going to be modifying them as we go
		var path_results: Array = current_results.get(path).duplicate()
		path_results.reverse()
		for path_result in path_results:
			var key: String = get_selection_key(path, path_result)
			if not only_selected or (only_selected and selections.has(key)):
				lines[path_result.line] = lines[path_result.line].substr(0, path_result.index) + replace_input.text + lines[path_result.line].substr(path_result.index + path_result.matched_text.length())

		var replaced_text: String = "\n".join(lines)
		if file != null and file.is_open():
			file.close()
			file = FileAccess.open(path, FileAccess.WRITE)
			file.store_string(replaced_text)
			file.close()
		else:
			main_view.open_buffers.get(path).text = replaced_text
			if main_view.current_file_path == path:
				main_view.code_edit.text = replaced_text

	current_results = find_in_files()


#endregion

#region signals


func _on_search_button_pressed() -> void:
	selections.clear()
	self.current_results = find_in_files()


func _on_input_text_submitted(new_text: String) -> void:
	_on_search_button_pressed()


func _on_replace_toggle_toggled(toggled_on: bool) -> void:
	replace_container.visible = toggled_on
	if toggled_on:
		replace_input.grab_focus()
	update_results_view()


func _on_replace_input_text_changed(new_text: String) -> void:
	update_results_view()


func _on_replace_selected_button_pressed() -> void:
	replace_results(true)


func _on_replace_all_button_pressed() -> void:
	replace_results(false)


func _on_match_case_button_toggled(toggled_on: bool) -> void:
	_on_search_button_pressed()


#endregion
```

## File: addons/dialogue_manager/views/find_in_dialogue_view.gd.uid
```
uid://q368fmxxa8sd
```

## File: addons/dialogue_manager/views/find_in_dialogue_view.tscn
```
[gd_scene load_steps=3 format=3 uid="uid://0n7hwviyyly4"]

[ext_resource type="Script" uid="uid://q368fmxxa8sd" path="res://addons/dialogue_manager/views/find_in_dialogue_view.gd" id="1_3xicy"]

[sub_resource type="StyleBoxFlat" id="StyleBoxFlat_owohg"]
bg_color = Color(0.266667, 0.278431, 0.352941, 0.243137)
corner_detail = 1

[node name="FindInFiles" type="Control"]
layout_mode = 3
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2
size_flags_horizontal = 3
size_flags_vertical = 3
script = ExtResource("1_3xicy")

[node name="VBoxContainer" type="VBoxContainer" parent="."]
layout_mode = 1
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2

[node name="HBoxContainer" type="HBoxContainer" parent="VBoxContainer"]
layout_mode = 2

[node name="FindContainer" type="VBoxContainer" parent="VBoxContainer/HBoxContainer"]
layout_mode = 2
size_flags_horizontal = 3

[node name="Label" type="Label" parent="VBoxContainer/HBoxContainer/FindContainer"]
layout_mode = 2
text = "Find:"

[node name="Input" type="LineEdit" parent="VBoxContainer/HBoxContainer/FindContainer"]
unique_name_in_owner = true
layout_mode = 2
clear_button_enabled = true

[node name="FindToolbar" type="HBoxContainer" parent="VBoxContainer/HBoxContainer/FindContainer"]
layout_mode = 2

[node name="SearchButton" type="Button" parent="VBoxContainer/HBoxContainer/FindContainer/FindToolbar"]
unique_name_in_owner = true
layout_mode = 2
text = "Find all..."

[node name="MatchCaseButton" type="CheckBox" parent="VBoxContainer/HBoxContainer/FindContainer/FindToolbar"]
unique_name_in_owner = true
layout_mode = 2
text = "Match case"

[node name="Control" type="Control" parent="VBoxContainer/HBoxContainer/FindContainer/FindToolbar"]
layout_mode = 2
size_flags_horizontal = 3

[node name="ReplaceToggle" type="CheckButton" parent="VBoxContainer/HBoxContainer/FindContainer/FindToolbar"]
unique_name_in_owner = true
layout_mode = 2
text = "Replace"

[node name="ReplaceContainer" type="VBoxContainer" parent="VBoxContainer/HBoxContainer"]
unique_name_in_owner = true
layout_mode = 2
size_flags_horizontal = 3

[node name="ReplaceLabel" type="Label" parent="VBoxContainer/HBoxContainer/ReplaceContainer"]
layout_mode = 2
text = "Replace with:"

[node name="ReplaceInput" type="LineEdit" parent="VBoxContainer/HBoxContainer/ReplaceContainer"]
unique_name_in_owner = true
layout_mode = 2
size_flags_horizontal = 3
clear_button_enabled = true

[node name="ReplaceToolbar" type="HBoxContainer" parent="VBoxContainer/HBoxContainer/ReplaceContainer"]
layout_mode = 2

[node name="ReplaceSelectedButton" type="Button" parent="VBoxContainer/HBoxContainer/ReplaceContainer/ReplaceToolbar"]
unique_name_in_owner = true
layout_mode = 2
text = "Replace selected"

[node name="ReplaceAllButton" type="Button" parent="VBoxContainer/HBoxContainer/ReplaceContainer/ReplaceToolbar"]
unique_name_in_owner = true
layout_mode = 2
text = "Replace all"

[node name="VBoxContainer" type="VBoxContainer" parent="VBoxContainer"]
layout_mode = 2

[node name="ReplaceToolbar" type="HBoxContainer" parent="VBoxContainer/VBoxContainer"]
layout_mode = 2

[node name="ScrollContainer" type="ScrollContainer" parent="VBoxContainer"]
layout_mode = 2
size_flags_vertical = 3
follow_focus = true

[node name="ResultsContainer" type="VBoxContainer" parent="VBoxContainer/ScrollContainer"]
unique_name_in_owner = true
layout_mode = 2
size_flags_horizontal = 3
size_flags_vertical = 3
theme_override_constants/separation = 0

[node name="ResultTemplate" type="HBoxContainer" parent="."]
unique_name_in_owner = true
layout_mode = 0
offset_left = 155.0
offset_top = -74.0
offset_right = 838.0
offset_bottom = -51.0

[node name="CheckBox" type="CheckBox" parent="ResultTemplate"]
layout_mode = 2

[node name="Label" type="RichTextLabel" parent="ResultTemplate"]
layout_mode = 2
size_flags_horizontal = 3
focus_mode = 2
theme_override_styles/focus = SubResource("StyleBoxFlat_owohg")
bbcode_enabled = true
text = "Result"
fit_content = true
scroll_active = false

[connection signal="text_submitted" from="VBoxContainer/HBoxContainer/FindContainer/Input" to="." method="_on_input_text_submitted"]
[connection signal="pressed" from="VBoxContainer/HBoxContainer/FindContainer/FindToolbar/SearchButton" to="." method="_on_search_button_pressed"]
[connection signal="toggled" from="VBoxContainer/HBoxContainer/FindContainer/FindToolbar/MatchCaseButton" to="." method="_on_match_case_button_toggled"]
[connection signal="toggled" from="VBoxContainer/HBoxContainer/FindContainer/FindToolbar/ReplaceToggle" to="." method="_on_replace_toggle_toggled"]
[connection signal="text_changed" from="VBoxContainer/HBoxContainer/ReplaceContainer/ReplaceInput" to="." method="_on_replace_input_text_changed"]
[connection signal="pressed" from="VBoxContainer/HBoxContainer/ReplaceContainer/ReplaceToolbar/ReplaceSelectedButton" to="." method="_on_replace_selected_button_pressed"]
[connection signal="pressed" from="VBoxContainer/HBoxContainer/ReplaceContainer/ReplaceToolbar/ReplaceAllButton" to="." method="_on_replace_all_button_pressed"]
```

## File: addons/dialogue_manager/views/main_view.gd
```
@tool
extends Control


const OPEN_OPEN = 100
const OPEN_QUICK = 101
const OPEN_CLEAR = 102

const TRANSLATIONS_GENERATE_LINE_IDS = 100
const TRANSLATIONS_SAVE_CHARACTERS_TO_CSV = 201
const TRANSLATIONS_SAVE_TO_CSV = 202
const TRANSLATIONS_IMPORT_FROM_CSV = 203

const ITEM_SAVE = 100
const ITEM_SAVE_AS = 101
const ITEM_CLOSE = 102
const ITEM_CLOSE_ALL = 103
const ITEM_CLOSE_OTHERS = 104
const ITEM_COPY_PATH = 200
const ITEM_SHOW_IN_FILESYSTEM = 201

enum TranslationSource {
	CharacterNames,
	Lines
}


signal confirmation_closed()


@onready var parse_timer: Timer = $ParseTimer

# Banner
@onready var banner: CenterContainer = %Banner
@onready var banner_new_button: Button = %BannerNewButton
@onready var banner_quick_open: Button = %BannerQuickOpen
@onready var banner_examples: Button = %BannerExamples

# Dialogs
@onready var new_dialog: FileDialog = $NewDialog
@onready var save_dialog: FileDialog = $SaveDialog
@onready var open_dialog: FileDialog = $OpenDialog
@onready var quick_open_dialog: ConfirmationDialog = $QuickOpenDialog
@onready var quick_open_files_list: VBoxContainer = $QuickOpenDialog/QuickOpenFilesList
@onready var export_dialog: FileDialog = $ExportDialog
@onready var import_dialog: FileDialog = $ImportDialog
@onready var errors_dialog: AcceptDialog = $ErrorsDialog
@onready var build_error_dialog: AcceptDialog = $BuildErrorDialog
@onready var close_confirmation_dialog: ConfirmationDialog = $CloseConfirmationDialog
@onready var updated_dialog: AcceptDialog = $UpdatedDialog
@onready var generate_static_ids_confirmation_dialog: ConfirmationDialog = $GenerateStaticIdsConfirmationDialog


# Toolbar
@onready var new_button: Button = %NewButton
@onready var open_button: MenuButton = %OpenButton
@onready var save_all_button: Button = %SaveAllButton
@onready var find_in_files_button: Button = %FindInFilesButton
@onready var test_button: Button = %TestButton
@onready var test_line_button: Button = %TestLineButton
@onready var search_button: Button = %SearchButton
@onready var insert_button: MenuButton = %InsertButton
@onready var translations_button: MenuButton = %TranslationsButton
@onready var support_button: Button = %SupportButton
@onready var docs_button: Button = %DocsButton
@onready var version_label: Label = %VersionLabel
@onready var update_button: Button = %UpdateButton

@onready var search_and_replace := %SearchAndReplace

# Code editor
@onready var content: HSplitContainer = %Content
@onready var files_list := %FilesList
@onready var files_popup_menu: PopupMenu = %FilesPopupMenu
@onready var title_list := %TitleList
@onready var code_edit: DMCodeEdit = %CodeEdit
@onready var errors_panel := %ErrorsPanel

# The currently open file
var current_file_path: String = "":
	set(next_current_file_path):
		current_file_path = next_current_file_path
		files_list.current_file_path = current_file_path
		if current_file_path == "" or not open_buffers.has(current_file_path):
			save_all_button.disabled = true
			test_button.disabled = true
			test_line_button.disabled = true
			search_button.disabled = true
			insert_button.disabled = true
			translations_button.disabled = true
			content.dragger_visibility = SplitContainer.DRAGGER_HIDDEN
			files_list.hide()
			title_list.hide()
			code_edit.hide()
			errors_panel.hide()
			search_and_replace.hide()
			banner.show()
		else:
			test_button.disabled = false
			test_line_button.disabled = false
			search_button.disabled = false
			insert_button.disabled = false
			translations_button.disabled = false
			content.dragger_visibility = SplitContainer.DRAGGER_VISIBLE
			files_list.show()
			title_list.show()
			code_edit.show()
			banner.hide()

			var cursor: Vector2 = DMSettings.get_caret(current_file_path)
			var scroll_vertical: int = DMSettings.get_scroll(current_file_path)

			code_edit.text = open_buffers[current_file_path].text
			code_edit.errors = []
			code_edit.clear_undo_history()
			code_edit.set_cursor(cursor)
			code_edit.scroll_vertical = scroll_vertical
			code_edit.grab_focus()

			_on_code_edit_text_changed()

			errors_panel.errors = []
			code_edit.errors = []

			if search_and_replace.visible:
				search_and_replace.search()
	get:
		return current_file_path

# A reference to the currently open files and their last saved text
var open_buffers: Dictionary = {}

# Which thing are we exporting translations for?
var translation_source: TranslationSource = TranslationSource.Lines


func _ready() -> void:
	apply_theme()

	# Start with nothing open
	self.current_file_path = ""

	# Set up the update checker
	version_label.text = "v%s" % DMPlugin.get_version()
	update_button.on_before_refresh = func on_before_refresh():
		# Save everything
		DMSettings.set_user_value("just_refreshed", {
			current_file_path = current_file_path,
			open_buffers = open_buffers
		})
		return true

	# Did we just load from an addon version refresh?
	var just_refreshed = DMSettings.get_user_value("just_refreshed", null)
	if just_refreshed != null:
		DMSettings.set_user_value("just_refreshed", null)
		call_deferred("load_from_version_refresh", just_refreshed)

	# Hook up the search toolbar
	search_and_replace.code_edit = code_edit

	# Connect menu buttons
	insert_button.get_popup().id_pressed.connect(_on_insert_button_menu_id_pressed)
	translations_button.get_popup().id_pressed.connect(_on_translations_button_menu_id_pressed)

	code_edit.main_view = self
	var editor_settings: EditorSettings = EditorInterface.get_editor_settings()
	editor_settings.settings_changed.connect(_on_editor_settings_changed)
	_on_editor_settings_changed()

	ProjectSettings.settings_changed.connect(_on_project_settings_changed)
	_on_project_settings_changed()

	# Reopen any files that were open when Godot was closed
	if editor_settings.get_setting("text_editor/behavior/files/restore_scripts_on_load"):
		var reopen_files: Array = DMSettings.get_user_value("reopen_files", [])
		for reopen_file in reopen_files:
			open_file(reopen_file)

		self.current_file_path = DMSettings.get_user_value("most_recent_reopen_file", "")

	save_all_button.disabled = true

	close_confirmation_dialog.ok_button_text = DMConstants.translate(&"confirm_close.save")
	close_confirmation_dialog.add_button(DMConstants.translate(&"confirm_close.discard"), true, "discard")

	errors_dialog.dialog_text = DMConstants.translate(&"errors_in_script")

	# Update the buffer if a file was modified externally (retains undo step)
	DMPlugin.instance.cache_file_content_changed.connect(_on_cache_file_content_changed)

	EditorInterface.get_file_system_dock().files_moved.connect(_on_files_moved)

	code_edit.get_v_scroll_bar().value_changed.connect(_on_code_edit_scroll_changed)


func _exit_tree() -> void:
	DMSettings.set_user_value("reopen_files", open_buffers.keys())
	DMSettings.set_user_value("most_recent_reopen_file", self.current_file_path)


func _unhandled_input(event: InputEvent) -> void:
	if not visible: return

	if event is InputEventKey and event.is_pressed():
		var shortcut: String = DMPlugin.get_editor_shortcut(event)
		match shortcut:
			"close_file":
				get_viewport().set_input_as_handled()
				close_file(current_file_path)
			"save":
				get_viewport().set_input_as_handled()
				save_file(current_file_path)
			"find_in_files":
				get_viewport().set_input_as_handled()
				_on_find_in_files_button_pressed()
			"run_test_scene":
				get_viewport().set_input_as_handled()
				_on_test_button_pressed()


func apply_changes() -> void:
	save_files()


# Check if any open files have unsaved changes.
func count_unsaved_files() -> int:
	var count: int = 0
	for buffer in open_buffers.values():
		if buffer.text != buffer.pristine_text:
			count += 1
	return count


# Load back to the previous buffer regardless of if it was actually saved
func load_from_version_refresh(just_refreshed: Dictionary) -> void:
	if just_refreshed.has("current_file_content"):
		# We just loaded from a version before multiple buffers
		var file: FileAccess = FileAccess.open(just_refreshed.current_file_path, FileAccess.READ)
		var file_text: String = file.get_as_text()
		open_buffers[just_refreshed.current_file_path] = {
			pristine_text = file_text,
			text = just_refreshed.current_file_content
		}
	else:
		open_buffers = just_refreshed.open_buffers

	if just_refreshed.current_file_path != "":
		EditorInterface.edit_resource(load(just_refreshed.current_file_path))
	else:
		EditorInterface.set_main_screen_editor("Dialogue")

	updated_dialog.dialog_text = DMConstants.translate(&"update.success").format({ version = update_button.get_version() })
	updated_dialog.popup_centered()


func new_file(path: String, content: String = "") -> void:
	if open_buffers.has(path):
		remove_file_from_open_buffers(path)

	var file: FileAccess = FileAccess.open(path, FileAccess.WRITE)
	if content == "":
		file.store_string(DMSettings.get_setting(DMSettings.NEW_FILE_TEMPLATE, ""))
	else:
		file.store_string(content)

	EditorInterface.get_resource_filesystem().scan()


# Open a dialogue resource for editing
func open_resource(resource: DialogueResource) -> void:
	open_file(resource.resource_path)


func open_file(path: String) -> void:
	if not FileAccess.file_exists(path): return

	if not open_buffers.has(path):
		var file: FileAccess = FileAccess.open(path, FileAccess.READ)
		var text = file.get_as_text()

		open_buffers[path] = {
			cursor = Vector2.ZERO,
			text = text,
			pristine_text = text
		}

	DMSettings.add_recent_file(path)
	build_open_menu()

	files_list.files = open_buffers.keys()
	files_list.select_file(path)

	self.current_file_path = path


func quick_open() -> void:
	quick_open_files_list.files = DMCache.get_files()
	quick_open_dialog.popup_centered()
	quick_open_files_list.focus_filter()


func show_file_in_filesystem(path: String) -> void:
	EditorInterface.get_file_system_dock().navigate_to_path(path)


# Save any open files
func save_files() -> void:
	save_all_button.disabled = true

	var saved_files: PackedStringArray = []
	for path in open_buffers:
		if open_buffers[path].text != open_buffers[path].pristine_text:
			saved_files.append(path)
		save_file(path, false)

	if saved_files.size() > 0:
		DMCache.mark_files_for_reimport(saved_files)


# Save a file
func save_file(path: String, rescan_file_system: bool = true) -> void:
	var buffer = open_buffers[path]

	files_list.mark_file_as_unsaved(path, false)
	save_all_button.disabled = files_list.unsaved_files.size() == 0

	# Don't bother saving if there is nothing to save
	if buffer.text == buffer.pristine_text:
		return

	buffer.pristine_text = buffer.text

	# Save the current text
	var file: FileAccess = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(buffer.text)
	file.close()

	if rescan_file_system:
		EditorInterface.get_resource_filesystem().scan()


func close_file(path: String) -> void:
	if not path in open_buffers.keys(): return

	var buffer = open_buffers[path]

	if buffer.text == buffer.pristine_text:
		remove_file_from_open_buffers(path)
		await get_tree().process_frame
	else:
		close_confirmation_dialog.dialog_text = DMConstants.translate(&"confirm_close").format({ path = path.get_file() })
		close_confirmation_dialog.popup_centered()
		await confirmation_closed


func remove_file_from_open_buffers(path: String) -> void:
	if not path in open_buffers.keys(): return

	var current_index = open_buffers.keys().find(current_file_path)

	open_buffers.erase(path)
	if open_buffers.size() == 0:
		self.current_file_path = ""
	else:
		current_index = clamp(current_index, 0, open_buffers.size() - 1)
		self.current_file_path = open_buffers.keys()[current_index]

	files_list.files = open_buffers.keys()


# Apply theme colors and icons to the UI
func apply_theme() -> void:
	if is_instance_valid(code_edit):
		var scale: float = EditorInterface.get_editor_scale()
		var editor_settings = EditorInterface.get_editor_settings()
		code_edit.theme_overrides = {
			scale = scale,

			background_color = Color(editor_settings.get_setting("interface/theme/base_color").blend(editor_settings.get_setting("text_editor/theme/highlighting/background_color")), 1),
			current_line_color = editor_settings.get_setting("text_editor/theme/highlighting/current_line_color"),
			error_line_color = editor_settings.get_setting("text_editor/theme/highlighting/mark_color"),

			critical_color = editor_settings.get_setting("text_editor/theme/highlighting/comment_markers/critical_color"),
			notice_color = editor_settings.get_setting("text_editor/theme/highlighting/comment_markers/notice_color"),

			titles_color = editor_settings.get_setting("text_editor/theme/highlighting/control_flow_keyword_color"),
			text_color = editor_settings.get_setting("text_editor/theme/highlighting/text_color"),
			conditions_color = editor_settings.get_setting("text_editor/theme/highlighting/keyword_color"),
			mutations_color = editor_settings.get_setting("text_editor/theme/highlighting/function_color"),
			mutations_line_color = Color(editor_settings.get_setting("text_editor/theme/highlighting/function_color"), 0.6),
			members_color = editor_settings.get_setting("text_editor/theme/highlighting/member_variable_color"),
			strings_color = editor_settings.get_setting("text_editor/theme/highlighting/string_color"),
			numbers_color = editor_settings.get_setting("text_editor/theme/highlighting/number_color"),
			symbols_color = editor_settings.get_setting("text_editor/theme/highlighting/symbol_color"),
			comments_color = editor_settings.get_setting("text_editor/theme/highlighting/comment_color"),
			jumps_color = Color(editor_settings.get_setting("text_editor/theme/highlighting/control_flow_keyword_color"), 0.6),

			font_size = editor_settings.get_setting("interface/editor/code_font_size")
		}

		banner_new_button.icon = get_theme_icon("New", "EditorIcons")
		banner_quick_open.icon = get_theme_icon("Load", "EditorIcons")

		new_button.icon = get_theme_icon("New", "EditorIcons")
		new_button.tooltip_text = DMConstants.translate(&"start_a_new_file")

		open_button.icon = get_theme_icon("Load", "EditorIcons")
		open_button.tooltip_text = DMConstants.translate(&"open_a_file")

		save_all_button.icon = get_theme_icon("Save", "EditorIcons")
		save_all_button.text = DMConstants.translate(&"all")
		save_all_button.tooltip_text = DMConstants.translate(&"start_all_files")

		find_in_files_button.icon = get_theme_icon("ViewportZoom", "EditorIcons")
		find_in_files_button.tooltip_text = DMConstants.translate(&"find_in_files")

		test_button.icon = get_theme_icon("DebugNext", "EditorIcons")
		test_button.tooltip_text = DMConstants.translate(&"test_dialogue")

		test_line_button.icon = get_theme_icon("DebugStep", "EditorIcons")
		test_line_button.tooltip_text = DMConstants.translate(&"test_dialogue_from_line")

		search_button.icon = get_theme_icon("Search", "EditorIcons")
		search_button.tooltip_text = DMConstants.translate(&"search_for_text")

		insert_button.icon = get_theme_icon("RichTextEffect", "EditorIcons")
		insert_button.text = DMConstants.translate(&"insert")

		translations_button.icon = get_theme_icon("Translation", "EditorIcons")
		translations_button.text = DMConstants.translate(&"translations")

		support_button.icon = get_theme_icon("Heart", "EditorIcons")
		support_button.text = DMConstants.translate(&"sponsor")
		support_button.tooltip_text = DMConstants.translate(&"show_support")

		docs_button.icon = get_theme_icon("Help", "EditorIcons")
		docs_button.text = DMConstants.translate(&"docs")

		update_button.apply_theme()

		# Set up the effect menu
		var popup: PopupMenu = insert_button.get_popup()
		popup.clear()
		popup.add_icon_item(get_theme_icon("RichTextEffect", "EditorIcons"), DMConstants.translate(&"insert.wave_bbcode"), 0)
		popup.add_icon_item(get_theme_icon("RichTextEffect", "EditorIcons"), DMConstants.translate(&"insert.shake_bbcode"), 1)
		popup.add_separator()
		popup.add_icon_item(get_theme_icon("Time", "EditorIcons"), DMConstants.translate(&"insert.typing_pause"), 3)
		popup.add_icon_item(get_theme_icon("ViewportSpeed", "EditorIcons"), DMConstants.translate(&"insert.typing_speed_change"), 4)
		popup.add_icon_item(get_theme_icon("DebugNext", "EditorIcons"), DMConstants.translate(&"insert.auto_advance"), 5)
		popup.add_separator(DMConstants.translate(&"insert.templates"))
		popup.add_icon_item(get_theme_icon("RichTextEffect", "EditorIcons"), DMConstants.translate(&"insert.title"), 6)
		popup.add_icon_item(get_theme_icon("RichTextEffect", "EditorIcons"), DMConstants.translate(&"insert.dialogue"), 7)
		popup.add_icon_item(get_theme_icon("RichTextEffect", "EditorIcons"), DMConstants.translate(&"insert.response"), 8)
		popup.add_icon_item(get_theme_icon("RichTextEffect", "EditorIcons"), DMConstants.translate(&"insert.random_lines"), 9)
		popup.add_icon_item(get_theme_icon("RichTextEffect", "EditorIcons"), DMConstants.translate(&"insert.random_text"), 10)
		popup.add_separator(DMConstants.translate(&"insert.actions"))
		popup.add_icon_item(get_theme_icon("RichTextEffect", "EditorIcons"), DMConstants.translate(&"insert.jump"), 11)
		popup.add_icon_item(get_theme_icon("RichTextEffect", "EditorIcons"), DMConstants.translate(&"insert.end_dialogue"), 12)

		# Set up the translations menu
		popup = translations_button.get_popup()
		popup.clear()
		popup.add_icon_item(get_theme_icon("Translation", "EditorIcons"), DMConstants.translate(&"generate_line_ids"), TRANSLATIONS_GENERATE_LINE_IDS)
		popup.add_separator()
		popup.add_icon_item(get_theme_icon("FileList", "EditorIcons"), DMConstants.translate(&"save_characters_to_csv"), TRANSLATIONS_SAVE_CHARACTERS_TO_CSV)
		popup.add_icon_item(get_theme_icon("FileList", "EditorIcons"), DMConstants.translate(&"save_to_csv"), TRANSLATIONS_SAVE_TO_CSV)
		popup.add_icon_item(get_theme_icon("AssetLib", "EditorIcons"), DMConstants.translate(&"import_from_csv"), TRANSLATIONS_IMPORT_FROM_CSV)

		# Dialog sizes
		new_dialog.min_size = Vector2(600, 500) * scale
		save_dialog.min_size = Vector2(600, 500) * scale
		open_dialog.min_size = Vector2(600, 500) * scale
		quick_open_dialog.min_size = Vector2(400, 600) * scale
		export_dialog.min_size = Vector2(600, 500) * scale
		import_dialog.min_size = Vector2(600, 500) * scale


#region Helpers


# Move the cursor to a given title in the dialogue editor
func go_to_title(title: String, create_if_none: bool = false) -> void:
	code_edit.go_to_title(title, create_if_none)
	code_edit.grab_focus()


# Refresh the open menu with the latest files
func build_open_menu() -> void:
	var menu = open_button.get_popup()
	menu.clear()
	menu.add_icon_item(get_theme_icon("Load", "EditorIcons"), DMConstants.translate(&"open.open"), OPEN_OPEN)
	menu.add_icon_item(get_theme_icon("Load", "EditorIcons"), DMConstants.translate(&"open.quick_open"), OPEN_QUICK)
	menu.add_separator()

	var recent_files = DMSettings.get_recent_files()
	if recent_files.size() == 0:
		menu.add_item(DMConstants.translate(&"open.no_recent_files"))
		menu.set_item_disabled(2, true)
	else:
		for path in recent_files:
			if FileAccess.file_exists(path):
				menu.add_icon_item(get_theme_icon("File", "EditorIcons"), path)

	menu.add_separator()
	menu.add_item(DMConstants.translate(&"open.clear_recent_files"), OPEN_CLEAR)
	if menu.id_pressed.is_connected(_on_open_menu_id_pressed):
		menu.id_pressed.disconnect(_on_open_menu_id_pressed)
	menu.id_pressed.connect(_on_open_menu_id_pressed)


# Get the last place a CSV, etc was exported
func get_last_export_path(extension: String) -> String:
	var filename = current_file_path.get_file().replace(".dialogue", "." + extension)
	return DMSettings.get_user_value("last_export_path", current_file_path.get_base_dir()) + "/" + filename


# Check the current text for errors
func compile() -> void:
	# Skip if nothing to parse
	if current_file_path == "": return

	var result: DMCompilerResult = DMCompiler.compile_string(code_edit.text, current_file_path)
	code_edit.errors = result.errors
	errors_panel.errors = result.errors
	title_list.titles = code_edit.get_titles()


func show_build_error_dialog() -> void:
	build_error_dialog.dialog_text = DMConstants.translate(&"errors_with_build")
	build_error_dialog.popup_centered()


# Generate translation line IDs for any line that doesn't already have one
func generate_translations_keys() -> void:
	generate_static_ids_confirmation_dialog.title = DMConstants.translate("generate_ids.warning_title")
	generate_static_ids_confirmation_dialog.dialog_text = DMConstants.translate("generate_ids.warning_text")
	generate_static_ids_confirmation_dialog.ok_button_text = DMConstants.translate("generate_ids.ok_button")
	generate_static_ids_confirmation_dialog.popup_centered()


# Add a translation file to the project settings
func add_path_to_project_translations(path: String) -> void:
	var translations: PackedStringArray = ProjectSettings.get_setting("internationalization/locale/translations")
	if not path in translations:
		translations.append(path)
		ProjectSettings.save()


# Export dialogue and responses to CSV
func export_translations_to_csv(path: String) -> void:
	DMTranslationUtilities.export_translations_to_csv(path, code_edit.text, current_file_path)

	EditorInterface.get_resource_filesystem().scan()
	EditorInterface.get_file_system_dock().call_deferred("navigate_to_path", path)

	# Add it to the project l10n settings if it's not already there
	var default_locale: String = DMSettings.get_setting(DMSettings.DEFAULT_CSV_LOCALE, "en")
	var language_code: RegExMatch = RegEx.create_from_string("^[a-z]{2,3}").search(default_locale)
	var translation_path: String = path.replace(".csv", ".%s.translation" % language_code.get_string())
	call_deferred("add_path_to_project_translations", translation_path)


func export_character_names_to_csv(path: String) -> void:
	DMTranslationUtilities.export_character_names_to_csv(path, code_edit.text, current_file_path)

	EditorInterface.get_resource_filesystem().scan()
	EditorInterface.get_file_system_dock().call_deferred("navigate_to_path", path)

	# Add it to the project l10n settings if it's not already there
	var translation_path: String = path.replace(".csv", ".en.translation")
	call_deferred("add_path_to_project_translations", translation_path)


# Import changes back from an exported CSV by matching translation keys
func import_translations_from_csv(path: String) -> void:
	var cursor: Vector2 = code_edit.get_cursor()
	code_edit.text = DMTranslationUtilities.import_translations_from_csv(path, code_edit.text)
	code_edit.set_cursor(cursor)


func show_search_form(is_enabled: bool) -> void:
	if code_edit.last_selected_text:
		search_and_replace.input.text = code_edit.last_selected_text

	search_and_replace.visible = is_enabled
	search_button.set_pressed_no_signal(is_enabled)
	search_and_replace.focus_line_edit()


func run_test_scene(from_key: String) -> void:
	DMSettings.set_user_value("run_title", from_key)
	DMSettings.set_user_value("is_running_test_scene", true)
	DMSettings.set_user_value("run_resource_path", current_file_path)
	var test_scene_path: String = DMSettings.get_setting(DMSettings.CUSTOM_TEST_SCENE_PATH, "res://addons/dialogue_manager/test_scene.tscn")
	if ResourceUID.has_id(ResourceUID.text_to_id(test_scene_path)):
		test_scene_path = ResourceUID.get_id_path(ResourceUID.text_to_id(test_scene_path))
	EditorInterface.play_custom_scene(test_scene_path)


#endregion

#region Signals


func _on_files_moved(old_file: String, new_file: String) -> void:
	if open_buffers.has(old_file):
		open_buffers[new_file] = open_buffers[old_file]
		open_buffers.erase(old_file)
		open_buffers[new_file]


func _on_cache_file_content_changed(path: String, new_content: String) -> void:
	if open_buffers.has(path):
		var buffer = open_buffers[path]
		if buffer.text == buffer.pristine_text and buffer.text != new_content:
			buffer.text = new_content
			code_edit.text = new_content
			title_list.titles = code_edit.get_titles()
		buffer.pristine_text = new_content


func _on_editor_settings_changed() -> void:
	var editor_settings: EditorSettings = EditorInterface.get_editor_settings()
	code_edit.minimap_draw = editor_settings.get_setting("text_editor/appearance/minimap/show_minimap")
	code_edit.minimap_width = editor_settings.get_setting("text_editor/appearance/minimap/minimap_width")
	code_edit.scroll_smooth = editor_settings.get_setting("text_editor/behavior/navigation/smooth_scrolling")


func _on_project_settings_changed() -> void:
	code_edit.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY if DMSettings.get_setting(DMSettings.WRAP_LONG_LINES, false) else TextEdit.LINE_WRAPPING_NONE


func _on_open_menu_id_pressed(id: int) -> void:
	match id:
		OPEN_OPEN:
			open_dialog.popup_centered()
		OPEN_QUICK:
			quick_open()
		OPEN_CLEAR:
			DMSettings.clear_recent_files()
			build_open_menu()
		_:
			var menu = open_button.get_popup()
			var item = menu.get_item_text(menu.get_item_index(id))
			open_file(item)


func _on_files_list_file_selected(file_path: String) -> void:
	self.current_file_path = file_path


func _on_insert_button_menu_id_pressed(id: int) -> void:
	match id:
		0:
			code_edit.insert_bbcode("[wave amp=25 freq=5]", "[/wave]")
		1:
			code_edit.insert_bbcode("[shake rate=20 level=10]", "[/shake]")
		3:
			code_edit.insert_bbcode("[wait=1]")
		4:
			code_edit.insert_bbcode("[speed=0.2]")
		5:
			code_edit.insert_bbcode("[next=auto]")
		6:
			code_edit.insert_text_at_cursor("~ title")
		7:
			code_edit.insert_text_at_cursor("Nathan: This is Some Dialogue")
		8:
			code_edit.insert_text_at_cursor("Nathan: Choose a Response...\n- Option 1\n\tNathan: You chose option 1\n- Option 2\n\tNathan: You chose option 2")
		9:
			code_edit.insert_text_at_cursor("% Nathan: This is random line 1.\n% Nathan: This is random line 2.\n%1 Nathan: This is weighted random line 3.")
		10:
			code_edit.insert_text_at_cursor("Nathan: [[Hi|Hello|Howdy]]")
		11:
			code_edit.insert_text_at_cursor("=> title")
		12:
			code_edit.insert_text_at_cursor("=> END")


func _on_translations_button_menu_id_pressed(id: int) -> void:
	match id:
		TRANSLATIONS_GENERATE_LINE_IDS:
			generate_translations_keys()

		TRANSLATIONS_SAVE_CHARACTERS_TO_CSV:
			translation_source = TranslationSource.CharacterNames
			export_dialog.filters = PackedStringArray(["*.csv ; Translation CSV"])
			export_dialog.current_path = get_last_export_path("csv")
			export_dialog.popup_centered()

		TRANSLATIONS_SAVE_TO_CSV:
			translation_source = TranslationSource.Lines
			export_dialog.filters = PackedStringArray(["*.csv ; Translation CSV"])
			export_dialog.current_path = get_last_export_path("csv")
			export_dialog.popup_centered()

		TRANSLATIONS_IMPORT_FROM_CSV:
			import_dialog.current_path = get_last_export_path("csv")
			import_dialog.popup_centered()


func _on_export_dialog_file_selected(path: String) -> void:
	DMSettings.set_user_value("last_export_path", path.get_base_dir())
	match path.get_extension():
		"csv":
			match translation_source:
				TranslationSource.CharacterNames:
					export_character_names_to_csv(path)
				TranslationSource.Lines:
					export_translations_to_csv(path)


func _on_import_dialog_file_selected(path: String) -> void:
	DMSettings.set_user_value("last_export_path", path.get_base_dir())
	import_translations_from_csv(path)


func _on_main_view_theme_changed():
	apply_theme()


func _on_main_view_visibility_changed() -> void:
	if visible and is_instance_valid(code_edit):
		code_edit.grab_focus()


func _on_new_button_pressed() -> void:
	new_dialog.current_file = "untitled"
	new_dialog.popup_centered()


func _on_new_dialog_confirmed() -> void:
	var path: String = new_dialog.current_path
	if path.get_file() == ".dialogue":
		path = "%s/untitled.dialogue" % path.get_basename()
	new_file(path)
	open_file(path)


func _on_new_dialog_file_selected(path: String) -> void:
	new_file(path)
	open_file(path)


func _on_save_dialog_file_selected(path: String) -> void:
	if path == "": path = "res://untitled.dialogue"

	new_file(path, code_edit.text)
	open_file(path)


func _on_open_button_about_to_popup() -> void:
	build_open_menu()


func _on_open_dialog_file_selected(path: String) -> void:
	open_file(path)


func _on_quick_open_files_list_file_double_clicked(file_path: String) -> void:
	quick_open_dialog.hide()
	open_file(file_path)


func _on_quick_open_dialog_confirmed() -> void:
	if quick_open_files_list.last_selected_file_path:
		open_file(quick_open_files_list.last_selected_file_path)


func _on_save_all_button_pressed() -> void:
	save_files()


func _on_find_in_files_button_pressed() -> void:
	DMPlugin.show_find_in_dialogue()


func _on_code_edit_text_changed() -> void:
	var buffer = open_buffers[current_file_path]
	buffer.text = code_edit.text

	files_list.mark_file_as_unsaved(current_file_path, buffer.text != buffer.pristine_text)
	save_all_button.disabled = open_buffers.values().filter(func(d): return d.text != d.pristine_text).size() == 0

	parse_timer.start(1)


func _on_code_edit_scroll_changed(value: int) -> void:
	DMSettings.set_scroll(current_file_path, code_edit.scroll_vertical)


func _on_code_edit_active_title_change(title: String) -> void:
	title_list.select_title(title)


func _on_code_edit_caret_changed() -> void:
	DMSettings.set_caret(current_file_path, code_edit.get_cursor())


func _on_code_edit_error_clicked(line_number: int) -> void:
	errors_panel.show_error_for_line_number(line_number)


func _on_title_list_title_selected(title: String) -> void:
	go_to_title(title)


func _on_parse_timer_timeout() -> void:
	parse_timer.stop()
	compile()


func _on_errors_panel_error_pressed(line_number: int, column_number: int) -> void:
	code_edit.set_caret_line(line_number - 1)
	code_edit.set_caret_column(column_number)
	code_edit.grab_focus()


func _on_search_button_toggled(button_pressed: bool) -> void:
	show_search_form(button_pressed)


func _on_search_and_replace_open_requested() -> void:
	show_search_form(true)


func _on_search_and_replace_close_requested() -> void:
	search_button.set_pressed_no_signal(false)
	search_and_replace.visible = false
	code_edit.grab_focus()


func _on_test_button_pressed() -> void:
	save_file(current_file_path, false)
	DMCache.reimport_files([current_file_path])

	if errors_panel.errors.size() > 0:
		errors_dialog.popup_centered()
		return

	run_test_scene("")


func _on_test_line_button_pressed() -> void:
	save_file(current_file_path)

	if errors_panel.errors.size() > 0:
		errors_dialog.popup_centered()
		return

	# Find next non-empty line
	var line_to_run: int = 0
	for i in range(code_edit.get_cursor().y, code_edit.get_line_count()):
		if not code_edit.get_line(i).is_empty():
			line_to_run = i
			break

	run_test_scene(str(line_to_run))


func _on_support_button_pressed() -> void:
	OS.shell_open("https://patreon.com/nathanhoad")


func _on_docs_button_pressed() -> void:
	OS.shell_open("https://github.com/nathanhoad/godot_dialogue_manager")


func _on_files_list_file_popup_menu_requested(at_position: Vector2) -> void:
	files_popup_menu.position = Vector2(get_viewport().position) + files_list.global_position + at_position
	files_popup_menu.popup()


func _on_files_list_file_middle_clicked(path: String):
	close_file(path)


func _on_files_popup_menu_about_to_popup() -> void:
	files_popup_menu.clear()

	var shortcuts: Dictionary = DMPlugin.get_editor_shortcuts()

	files_popup_menu.add_item(DMConstants.translate(&"buffer.save"), ITEM_SAVE, OS.find_keycode_from_string(shortcuts.get("save")[0].as_text_keycode()))
	files_popup_menu.add_item(DMConstants.translate(&"buffer.save_as"), ITEM_SAVE_AS)
	files_popup_menu.add_item(DMConstants.translate(&"buffer.close"), ITEM_CLOSE, OS.find_keycode_from_string(shortcuts.get("close_file")[0].as_text_keycode()))
	files_popup_menu.add_item(DMConstants.translate(&"buffer.close_all"), ITEM_CLOSE_ALL)
	files_popup_menu.add_item(DMConstants.translate(&"buffer.close_other_files"), ITEM_CLOSE_OTHERS)
	files_popup_menu.add_separator()
	files_popup_menu.add_item(DMConstants.translate(&"buffer.copy_file_path"), ITEM_COPY_PATH)
	files_popup_menu.add_item(DMConstants.translate(&"buffer.show_in_filesystem"), ITEM_SHOW_IN_FILESYSTEM)


func _on_files_popup_menu_id_pressed(id: int) -> void:
	match id:
		ITEM_SAVE:
			save_file(current_file_path)
		ITEM_SAVE_AS:
			save_dialog.popup_centered()
		ITEM_CLOSE:
			close_file(current_file_path)
		ITEM_CLOSE_ALL:
			for path in open_buffers.keys():
				close_file(path)
		ITEM_CLOSE_OTHERS:
			var current_current_file_path: String = current_file_path
			for path in open_buffers.keys():
				if path != current_current_file_path:
					await close_file(path)

		ITEM_COPY_PATH:
			DisplayServer.clipboard_set(current_file_path)
		ITEM_SHOW_IN_FILESYSTEM:
			show_file_in_filesystem(current_file_path)


func _on_code_edit_external_file_requested(path: String, title: String) -> void:
	open_file(path)
	if title != "":
		code_edit.go_to_title(title)
	else:
		code_edit.set_caret_line(0)


func _on_close_confirmation_dialog_confirmed() -> void:
	save_file(current_file_path)
	remove_file_from_open_buffers(current_file_path)
	confirmation_closed.emit()


func _on_close_confirmation_dialog_custom_action(action: StringName) -> void:
	if action == "discard":
		remove_file_from_open_buffers(current_file_path)
	close_confirmation_dialog.hide()
	confirmation_closed.emit()


func _on_find_in_files_result_selected(path: String, cursor: Vector2, length: int) -> void:
	open_file(path)
	code_edit.select(cursor.y, cursor.x, cursor.y, cursor.x + length)
	code_edit.set_line_as_center_visible(cursor.y)


func _on_banner_image_gui_input(event:  InputEvent) -> void:
	if event.is_pressed():
		OS.shell_open("https://bravestcoconut.com/wishlist")


func _on_banner_new_button_pressed() -> void:
	new_dialog.current_file = "untitled"
	new_dialog.popup_centered()


func _on_banner_quick_open_pressed() -> void:
	quick_open()


func _on_banner_examples_pressed() -> void:
	OS.shell_open("https://itch.io/c/5226650/godot-dialogue-manager-example-projects")


func _on_generate_static_ids_confirmation_dialog_confirmed() -> void:
	save_files()

	var cursor: Vector2 = code_edit.get_cursor()
	var scroll_vertical = code_edit.scroll_vertical
	DMTranslationUtilities.generate_translation_keys()
	for file_path: String in open_buffers:
		var buffer: Dictionary = open_buffers.get(file_path)
		buffer.text = FileAccess.get_file_as_string(file_path)
		buffer.pristine_text = buffer.text

		if file_path == current_file_path:
			code_edit.text = buffer.text
	code_edit.set_cursor(cursor)
	code_edit.scroll_vertical = scroll_vertical
	_on_code_edit_text_changed()


#endregion
```

## File: addons/dialogue_manager/views/main_view.gd.uid
```
uid://cipjcc7bkh1pc
```

## File: addons/dialogue_manager/views/main_view.tscn
```
[gd_scene format=3 uid="uid://cbuf1q3xsse3q"]

[ext_resource type="Script" uid="uid://cipjcc7bkh1pc" path="res://addons/dialogue_manager/views/main_view.gd" id="1_h6qfq"]
[ext_resource type="PackedScene" uid="uid://civ6shmka5e8u" path="res://addons/dialogue_manager/components/code_edit.tscn" id="2_f73fm"]
[ext_resource type="PackedScene" uid="uid://dnufpcdrreva3" path="res://addons/dialogue_manager/components/files_list.tscn" id="2_npj2k"]
[ext_resource type="PackedScene" uid="uid://ctns6ouwwd68i" path="res://addons/dialogue_manager/components/title_list.tscn" id="2_onb4i"]
[ext_resource type="PackedScene" uid="uid://co8yl23idiwbi" path="res://addons/dialogue_manager/components/update_button.tscn" id="2_ph3vs"]
[ext_resource type="PackedScene" uid="uid://gr8nakpbrhby" path="res://addons/dialogue_manager/components/search_and_replace.tscn" id="6_ylh0t"]
[ext_resource type="PackedScene" uid="uid://cs8pwrxr5vxix" path="res://addons/dialogue_manager/components/errors_panel.tscn" id="7_5cvl4"]
[ext_resource type="Script" uid="uid://klpiq4tk3t7a" path="res://addons/dialogue_manager/components/code_edit_syntax_highlighter.gd" id="7_necsa"]
[ext_resource type="Texture2D" uid="uid://cnm67htuohhlo" path="res://addons/dialogue_manager/assets/banner.png" id="9_y6rqu"]

[sub_resource type="Image" id="Image_faxki"]
data = {
"data": PackedByteArray(255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 94, 94, 127, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 255, 255, 94, 94, 127, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 94, 94, 127, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 94, 94, 127, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 231, 255, 94, 94, 54, 255, 94, 94, 57, 255, 93, 93, 233, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 231, 255, 94, 94, 54, 255, 94, 94, 57, 255, 93, 93, 233, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 97, 97, 42, 255, 255, 255, 0, 255, 255, 255, 0, 255, 97, 97, 42, 255, 93, 93, 233, 255, 93, 93, 232, 255, 93, 93, 41, 255, 255, 255, 0, 255, 255, 255, 0, 255, 97, 97, 42, 255, 93, 93, 233, 255, 93, 93, 232, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 96, 96, 45, 255, 93, 93, 44, 255, 255, 255, 0, 255, 97, 97, 42, 255, 97, 97, 42, 255, 255, 255, 0, 255, 96, 96, 45, 255, 93, 93, 44, 255, 255, 255, 0, 255, 97, 97, 42, 255, 97, 97, 42, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 96, 96, 45, 255, 93, 93, 235, 255, 94, 94, 234, 255, 95, 95, 43, 255, 255, 255, 0, 255, 255, 255, 0, 255, 96, 96, 45, 255, 93, 93, 235, 255, 94, 94, 234, 255, 95, 95, 43, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 235, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 233, 255, 95, 95, 59, 255, 96, 96, 61, 255, 93, 93, 235, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 233, 255, 95, 95, 59, 255, 96, 96, 61, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0),
"format": "RGBA8",
"height": 16,
"mipmaps": false,
"width": 16
}

[sub_resource type="ImageTexture" id="ImageTexture_ka3gk"]
image = SubResource("Image_faxki")

[sub_resource type="Image" id="Image_y6rqu"]
data = {
"data": PackedByteArray(255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 94, 94, 127, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 255, 255, 94, 94, 127, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 94, 94, 127, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 94, 94, 127, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 231, 255, 94, 94, 54, 255, 94, 94, 57, 255, 93, 93, 233, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 231, 255, 94, 94, 54, 255, 94, 94, 57, 255, 93, 93, 233, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 97, 97, 42, 255, 255, 255, 0, 255, 255, 255, 0, 255, 97, 97, 42, 255, 93, 93, 233, 255, 93, 93, 232, 255, 93, 93, 41, 255, 255, 255, 0, 255, 255, 255, 0, 255, 97, 97, 42, 255, 93, 93, 233, 255, 93, 93, 232, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 96, 96, 45, 255, 93, 93, 44, 255, 255, 255, 0, 255, 97, 97, 42, 255, 97, 97, 42, 255, 255, 255, 0, 255, 96, 96, 45, 255, 93, 93, 44, 255, 255, 255, 0, 255, 97, 97, 42, 255, 97, 97, 42, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 96, 96, 45, 255, 93, 93, 235, 255, 94, 94, 234, 255, 95, 95, 43, 255, 255, 255, 0, 255, 255, 255, 0, 255, 96, 96, 45, 255, 93, 93, 235, 255, 94, 94, 234, 255, 95, 95, 43, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 235, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 233, 255, 95, 95, 59, 255, 96, 96, 61, 255, 93, 93, 235, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 233, 255, 95, 95, 59, 255, 96, 96, 61, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 93, 93, 255, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0),
"format": "RGBA8",
"height": 16,
"mipmaps": false,
"width": 16
}

[sub_resource type="ImageTexture" id="ImageTexture_57eek"]
image = SubResource("Image_y6rqu")

[sub_resource type="SyntaxHighlighter" id="SyntaxHighlighter_mpdoc"]
script = ExtResource("7_necsa")

[node name="MainView" type="Control" unique_id=1975859718]
clip_contents = true
layout_mode = 3
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2
size_flags_horizontal = 3
size_flags_vertical = 3
script = ExtResource("1_h6qfq")

[node name="ParseTimer" type="Timer" parent="." unique_id=1210958138]

[node name="Margin" type="MarginContainer" parent="." unique_id=424731994]
layout_mode = 1
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
grow_horizontal = 2
grow_vertical = 2
size_flags_vertical = 3
theme_override_constants/margin_left = 5
theme_override_constants/margin_right = 5
theme_override_constants/margin_bottom = 5
metadata/_edit_layout_mode = 1

[node name="Content" type="HSplitContainer" parent="Margin" unique_id=267962742]
unique_name_in_owner = true
layout_mode = 2
size_flags_vertical = 3
dragger_visibility = 1

[node name="SidePanel" type="VBoxContainer" parent="Margin/Content" unique_id=408822052]
custom_minimum_size = Vector2(150, 0)
layout_mode = 2
size_flags_horizontal = 3

[node name="Toolbar" type="HBoxContainer" parent="Margin/Content/SidePanel" unique_id=1890446441]
layout_mode = 2

[node name="NewButton" type="Button" parent="Margin/Content/SidePanel/Toolbar" unique_id=916776070]
unique_name_in_owner = true
layout_mode = 2
tooltip_text = "Start a new file"
flat = true

[node name="OpenButton" type="MenuButton" parent="Margin/Content/SidePanel/Toolbar" unique_id=880106178]
unique_name_in_owner = true
layout_mode = 2
tooltip_text = "Open a file"
item_count = 9
popup/item_0/text = "Open..."
popup/item_0/icon = SubResource("ImageTexture_ka3gk")
popup/item_0/id = 100
popup/item_1/icon = SubResource("ImageTexture_ka3gk")
popup/item_1/id = 101
popup/item_2/id = -1
popup/item_2/separator = true
popup/item_3/text = "res://examples/dialogue.dialogue"
popup/item_3/icon = SubResource("ImageTexture_ka3gk")
popup/item_3/id = 3
popup/item_4/text = "res://examples/dialogue_with_input.dialogue"
popup/item_4/icon = SubResource("ImageTexture_ka3gk")
popup/item_4/id = 4
popup/item_5/text = "res://examples/dialogue_for_point_n_click.dialogue"
popup/item_5/icon = SubResource("ImageTexture_ka3gk")
popup/item_5/id = 5
popup/item_6/text = "res://examples/dialogue_for_visual_novel.dialogue"
popup/item_6/icon = SubResource("ImageTexture_ka3gk")
popup/item_6/id = 6
popup/item_7/id = -1
popup/item_7/separator = true
popup/item_8/text = "Clear recent files"
popup/item_8/id = 102

[node name="SaveAllButton" type="Button" parent="Margin/Content/SidePanel/Toolbar" unique_id=940841574]
unique_name_in_owner = true
layout_mode = 2
disabled = true
flat = true

[node name="FindInFilesButton" type="Button" parent="Margin/Content/SidePanel/Toolbar" unique_id=213493052]
unique_name_in_owner = true
layout_mode = 2
tooltip_text = "Find in files..."
flat = true

[node name="Bookmarks" type="VSplitContainer" parent="Margin/Content/SidePanel" unique_id=1966503844]
layout_mode = 2
size_flags_vertical = 3

[node name="FilesList" parent="Margin/Content/SidePanel/Bookmarks" unique_id=1460458494 instance=ExtResource("2_npj2k")]
unique_name_in_owner = true
visible = false
layout_mode = 2

[node name="FilesPopupMenu" type="PopupMenu" parent="Margin/Content/SidePanel/Bookmarks/FilesList" unique_id=253084069]
unique_name_in_owner = true

[node name="TitleList" parent="Margin/Content/SidePanel/Bookmarks" unique_id=2063152064 instance=ExtResource("2_onb4i")]
unique_name_in_owner = true
visible = false
layout_mode = 2

[node name="CodePanel" type="VBoxContainer" parent="Margin/Content" unique_id=2013417278]
layout_mode = 2
size_flags_horizontal = 3
size_flags_stretch_ratio = 4.0

[node name="Toolbar" type="HBoxContainer" parent="Margin/Content/CodePanel" unique_id=177899511]
layout_mode = 2

[node name="InsertButton" type="MenuButton" parent="Margin/Content/CodePanel/Toolbar" unique_id=1765432833]
unique_name_in_owner = true
layout_mode = 2
disabled = true
text = "Insert"
item_count = 15
popup/item_0/text = "Wave BBCode"
popup/item_0/icon = SubResource("ImageTexture_57eek")
popup/item_0/id = 0
popup/item_1/text = "Shake BBCode"
popup/item_1/icon = SubResource("ImageTexture_57eek")
popup/item_1/id = 1
popup/item_2/id = -1
popup/item_2/separator = true
popup/item_3/text = "Typing pause"
popup/item_3/icon = SubResource("ImageTexture_57eek")
popup/item_3/id = 3
popup/item_4/text = "Typing speed change"
popup/item_4/icon = SubResource("ImageTexture_57eek")
popup/item_4/id = 4
popup/item_5/text = "Auto advance"
popup/item_5/icon = SubResource("ImageTexture_57eek")
popup/item_5/id = 5
popup/item_6/text = "Templates"
popup/item_6/id = -1
popup/item_6/separator = true
popup/item_7/text = "Title"
popup/item_7/icon = SubResource("ImageTexture_57eek")
popup/item_7/id = 6
popup/item_8/text = "Dialogue"
popup/item_8/icon = SubResource("ImageTexture_57eek")
popup/item_8/id = 7
popup/item_9/text = "Response"
popup/item_9/icon = SubResource("ImageTexture_57eek")
popup/item_9/id = 8
popup/item_10/text = "Random lines"
popup/item_10/icon = SubResource("ImageTexture_57eek")
popup/item_10/id = 9
popup/item_11/text = "Random text"
popup/item_11/icon = SubResource("ImageTexture_57eek")
popup/item_11/id = 10
popup/item_12/text = "Actions"
popup/item_12/id = -1
popup/item_12/separator = true
popup/item_13/text = "Jump to title"
popup/item_13/icon = SubResource("ImageTexture_57eek")
popup/item_13/id = 11
popup/item_14/text = "End dialogue"
popup/item_14/icon = SubResource("ImageTexture_57eek")
popup/item_14/id = 12

[node name="TranslationsButton" type="MenuButton" parent="Margin/Content/CodePanel/Toolbar" unique_id=2010201295]
unique_name_in_owner = true
layout_mode = 2
disabled = true
text = "Translations"
item_count = 5
popup/item_0/text = "Generate line IDs"
popup/item_0/icon = SubResource("ImageTexture_57eek")
popup/item_0/id = 100
popup/item_1/id = -1
popup/item_1/separator = true
popup/item_2/text = "Save character names to CSV..."
popup/item_2/icon = SubResource("ImageTexture_57eek")
popup/item_2/id = 201
popup/item_3/text = "Save lines to CSV..."
popup/item_3/icon = SubResource("ImageTexture_57eek")
popup/item_3/id = 202
popup/item_4/text = "Import line changes from CSV..."
popup/item_4/icon = SubResource("ImageTexture_57eek")
popup/item_4/id = 203

[node name="Separator" type="VSeparator" parent="Margin/Content/CodePanel/Toolbar" unique_id=821562382]
layout_mode = 2

[node name="SearchButton" type="Button" parent="Margin/Content/CodePanel/Toolbar" unique_id=121689358]
unique_name_in_owner = true
layout_mode = 2
tooltip_text = "Search for text"
disabled = true
toggle_mode = true
flat = true

[node name="Separator2" type="VSeparator" parent="Margin/Content/CodePanel/Toolbar" unique_id=175043853]
layout_mode = 2

[node name="TestButton" type="Button" parent="Margin/Content/CodePanel/Toolbar" unique_id=1610822770]
unique_name_in_owner = true
layout_mode = 2
tooltip_text = "Test dialogue"
disabled = true
flat = true

[node name="TestLineButton" type="Button" parent="Margin/Content/CodePanel/Toolbar" unique_id=1575726308]
unique_name_in_owner = true
layout_mode = 2
tooltip_text = "Test dialogue"
disabled = true
flat = true

[node name="Spacer2" type="Control" parent="Margin/Content/CodePanel/Toolbar" unique_id=249482575]
layout_mode = 2
size_flags_horizontal = 3

[node name="SupportButton" type="Button" parent="Margin/Content/CodePanel/Toolbar" unique_id=1042093313]
unique_name_in_owner = true
layout_mode = 2
tooltip_text = "Support Dialogue Manager"
text = "Sponsor"
flat = true

[node name="Separator4" type="VSeparator" parent="Margin/Content/CodePanel/Toolbar" unique_id=321395257]
layout_mode = 2

[node name="DocsButton" type="Button" parent="Margin/Content/CodePanel/Toolbar" unique_id=1404920471]
unique_name_in_owner = true
layout_mode = 2
text = "Docs"
flat = true

[node name="VersionLabel" type="Label" parent="Margin/Content/CodePanel/Toolbar" unique_id=630990714]
unique_name_in_owner = true
modulate = Color(1, 1, 1, 0.490196)
layout_mode = 2
text = "v2.42.2"
vertical_alignment = 1

[node name="UpdateButton" parent="Margin/Content/CodePanel/Toolbar" unique_id=1595256128 instance=ExtResource("2_ph3vs")]
unique_name_in_owner = true
layout_mode = 2
text = "v2.44.1 available"

[node name="SearchAndReplace" parent="Margin/Content/CodePanel" unique_id=2132004091 instance=ExtResource("6_ylh0t")]
unique_name_in_owner = true
layout_mode = 2

[node name="CodeEdit" parent="Margin/Content/CodePanel" unique_id=302141693 instance=ExtResource("2_f73fm")]
unique_name_in_owner = true
visible = false
layout_mode = 2
size_flags_horizontal = 3
size_flags_vertical = 3
theme_override_colors/font_color = Color(0.972549, 0.972549, 0.94902, 1)
theme_override_colors/background_color = Color(0.156863, 0.164706, 0.211765, 1)
theme_override_colors/current_line_color = Color(0.266667, 0.278431, 0.352941, 0.243137)
theme_override_font_sizes/font_size = 14
theme_override_colors/bookmark_color = Color(1, 0.333333, 0.333333, 1)
text = "~ start

Nathan: Hi, I'm Nathan and this is Coco.
Coco: Meow.
Nathan: Here are some response options.
- First one
	Nathan: You picked the first one.
- Second one
	Nathan: You picked the second one.
- Start again => start
- End the conversation => END
Nathan: I hope this example is helpful.
Coco: Meow.

=> END"
scroll_smooth = true
syntax_highlighter = SubResource("SyntaxHighlighter_mpdoc")

[node name="ErrorsPanel" parent="Margin/Content/CodePanel" unique_id=1975824789 instance=ExtResource("7_5cvl4")]
unique_name_in_owner = true
layout_mode = 2

[node name="Banner" type="CenterContainer" parent="." unique_id=1848328987]
unique_name_in_owner = true
layout_mode = 1
anchors_preset = 15
anchor_right = 1.0
anchor_bottom = 1.0
offset_top = 34.0
grow_horizontal = 2
grow_vertical = 2
mouse_filter = 2

[node name="PanelContainer" type="VBoxContainer" parent="Banner" unique_id=1211498578]
layout_mode = 2
theme_override_constants/separation = 5

[node name="BannerImage" type="TextureRect" parent="Banner/PanelContainer" unique_id=899616034]
custom_minimum_size = Vector2(600, 200)
layout_mode = 2
mouse_filter = 0
mouse_default_cursor_shape = 2
texture = ExtResource("9_y6rqu")
expand_mode = 3

[node name="HBoxContainer" type="HBoxContainer" parent="Banner/PanelContainer" unique_id=874356896]
layout_mode = 2
theme_override_constants/separation = 5

[node name="BannerNewButton" type="Button" parent="Banner/PanelContainer/HBoxContainer" unique_id=1034773049]
unique_name_in_owner = true
layout_mode = 2
size_flags_horizontal = 3
text = "New Dialogue..."

[node name="BannerQuickOpen" type="Button" parent="Banner/PanelContainer/HBoxContainer" unique_id=1614953837]
unique_name_in_owner = true
layout_mode = 2
size_flags_horizontal = 3
text = "Quick open..."

[node name="BannerExamples" type="Button" parent="Banner/PanelContainer/HBoxContainer" unique_id=1066745213]
unique_name_in_owner = true
layout_mode = 2
size_flags_horizontal = 3
text = "Example projects..."

[node name="NewDialog" type="FileDialog" parent="." unique_id=458925087]
size = Vector2i(900, 750)
min_size = Vector2i(600, 500)
dialog_hide_on_ok = true
filters = PackedStringArray("*.dialogue ; Dialogue")

[node name="SaveDialog" type="FileDialog" parent="." unique_id=325906832]
size = Vector2i(900, 750)
min_size = Vector2i(600, 500)
dialog_hide_on_ok = true
filters = PackedStringArray("*.dialogue ; Dialogue")

[node name="OpenDialog" type="FileDialog" parent="." unique_id=1252768767]
title = "Open a File"
size = Vector2i(900, 750)
min_size = Vector2i(600, 500)
ok_button_text = "Open"
dialog_hide_on_ok = true
file_mode = 0
filters = PackedStringArray("*.dialogue ; Dialogue")

[node name="QuickOpenDialog" type="ConfirmationDialog" parent="." unique_id=254740052]
title = "Quick open"
size = Vector2i(600, 900)
min_size = Vector2i(400, 600)
ok_button_text = "Open"

[node name="QuickOpenFilesList" parent="QuickOpenDialog" unique_id=1813408245 instance=ExtResource("2_npj2k")]

[node name="ExportDialog" type="FileDialog" parent="." unique_id=2035775999]
size = Vector2i(900, 750)
min_size = Vector2i(600, 500)

[node name="ImportDialog" type="FileDialog" parent="." unique_id=1326083376]
title = "Open a File"
size = Vector2i(900, 750)
min_size = Vector2i(600, 500)
ok_button_text = "Open"
file_mode = 0
filters = PackedStringArray("*.csv ; Translation CSV")

[node name="ErrorsDialog" type="AcceptDialog" parent="." unique_id=2100629189]
title = "Error"
dialog_text = "You have errors in your script. Fix them and then try again."

[node name="BuildErrorDialog" type="AcceptDialog" parent="." unique_id=1879686579]
title = "Errors"
dialog_text = "You need to fix dialogue errors before you can run your game."

[node name="CloseConfirmationDialog" type="ConfirmationDialog" parent="." unique_id=1048140490]
title = "Unsaved changes"
ok_button_text = "Save changes"

[node name="UpdatedDialog" type="AcceptDialog" parent="." unique_id=955879802]
title = "Updated"
size = Vector2i(191, 100)
dialog_text = "You're now up to date!"

[node name="GenerateStaticIdsConfirmationDialog" type="ConfirmationDialog" parent="." unique_id=1311101975]

[connection signal="theme_changed" from="." to="." method="_on_main_view_theme_changed"]
[connection signal="visibility_changed" from="." to="." method="_on_main_view_visibility_changed"]
[connection signal="timeout" from="ParseTimer" to="." method="_on_parse_timer_timeout"]
[connection signal="pressed" from="Margin/Content/SidePanel/Toolbar/NewButton" to="." method="_on_new_button_pressed"]
[connection signal="about_to_popup" from="Margin/Content/SidePanel/Toolbar/OpenButton" to="." method="_on_open_button_about_to_popup"]
[connection signal="pressed" from="Margin/Content/SidePanel/Toolbar/SaveAllButton" to="." method="_on_save_all_button_pressed"]
[connection signal="pressed" from="Margin/Content/SidePanel/Toolbar/FindInFilesButton" to="." method="_on_find_in_files_button_pressed"]
[connection signal="file_middle_clicked" from="Margin/Content/SidePanel/Bookmarks/FilesList" to="." method="_on_files_list_file_middle_clicked"]
[connection signal="file_popup_menu_requested" from="Margin/Content/SidePanel/Bookmarks/FilesList" to="." method="_on_files_list_file_popup_menu_requested"]
[connection signal="file_selected" from="Margin/Content/SidePanel/Bookmarks/FilesList" to="." method="_on_files_list_file_selected"]
[connection signal="about_to_popup" from="Margin/Content/SidePanel/Bookmarks/FilesList/FilesPopupMenu" to="." method="_on_files_popup_menu_about_to_popup"]
[connection signal="id_pressed" from="Margin/Content/SidePanel/Bookmarks/FilesList/FilesPopupMenu" to="." method="_on_files_popup_menu_id_pressed"]
[connection signal="title_selected" from="Margin/Content/SidePanel/Bookmarks/TitleList" to="." method="_on_title_list_title_selected"]
[connection signal="toggled" from="Margin/Content/CodePanel/Toolbar/SearchButton" to="." method="_on_search_button_toggled"]
[connection signal="pressed" from="Margin/Content/CodePanel/Toolbar/TestButton" to="." method="_on_test_button_pressed"]
[connection signal="pressed" from="Margin/Content/CodePanel/Toolbar/TestLineButton" to="." method="_on_test_line_button_pressed"]
[connection signal="pressed" from="Margin/Content/CodePanel/Toolbar/SupportButton" to="." method="_on_support_button_pressed"]
[connection signal="pressed" from="Margin/Content/CodePanel/Toolbar/DocsButton" to="." method="_on_docs_button_pressed"]
[connection signal="close_requested" from="Margin/Content/CodePanel/SearchAndReplace" to="." method="_on_search_and_replace_close_requested"]
[connection signal="open_requested" from="Margin/Content/CodePanel/SearchAndReplace" to="." method="_on_search_and_replace_open_requested"]
[connection signal="active_title_change" from="Margin/Content/CodePanel/CodeEdit" to="." method="_on_code_edit_active_title_change"]
[connection signal="caret_changed" from="Margin/Content/CodePanel/CodeEdit" to="." method="_on_code_edit_caret_changed"]
[connection signal="error_clicked" from="Margin/Content/CodePanel/CodeEdit" to="." method="_on_code_edit_error_clicked"]
[connection signal="external_file_requested" from="Margin/Content/CodePanel/CodeEdit" to="." method="_on_code_edit_external_file_requested"]
[connection signal="text_changed" from="Margin/Content/CodePanel/CodeEdit" to="." method="_on_code_edit_text_changed"]
[connection signal="error_pressed" from="Margin/Content/CodePanel/ErrorsPanel" to="." method="_on_errors_panel_error_pressed"]
[connection signal="gui_input" from="Banner/PanelContainer/BannerImage" to="." method="_on_banner_image_gui_input"]
[connection signal="pressed" from="Banner/PanelContainer/HBoxContainer/BannerNewButton" to="." method="_on_banner_new_button_pressed"]
[connection signal="pressed" from="Banner/PanelContainer/HBoxContainer/BannerQuickOpen" to="." method="_on_banner_quick_open_pressed"]
[connection signal="pressed" from="Banner/PanelContainer/HBoxContainer/BannerExamples" to="." method="_on_banner_examples_pressed"]
[connection signal="confirmed" from="NewDialog" to="." method="_on_new_dialog_confirmed"]
[connection signal="file_selected" from="NewDialog" to="." method="_on_new_dialog_file_selected"]
[connection signal="file_selected" from="SaveDialog" to="." method="_on_save_dialog_file_selected"]
[connection signal="file_selected" from="OpenDialog" to="." method="_on_open_dialog_file_selected"]
[connection signal="confirmed" from="QuickOpenDialog" to="." method="_on_quick_open_dialog_confirmed"]
[connection signal="file_double_clicked" from="QuickOpenDialog/QuickOpenFilesList" to="." method="_on_quick_open_files_list_file_double_clicked"]
[connection signal="file_selected" from="ExportDialog" to="." method="_on_export_dialog_file_selected"]
[connection signal="file_selected" from="ImportDialog" to="." method="_on_import_dialog_file_selected"]
[connection signal="confirmed" from="CloseConfirmationDialog" to="." method="_on_close_confirmation_dialog_confirmed"]
[connection signal="custom_action" from="CloseConfirmationDialog" to="." method="_on_close_confirmation_dialog_custom_action"]
[connection signal="confirmed" from="GenerateStaticIdsConfirmationDialog" to="." method="_on_generate_static_ids_confirmation_dialog_confirmed"]
```

## File: addons/dialogue_manager/constants.gd
```
class_name DMConstants extends RefCounted


const USER_CONFIG_PATH = "user://dialogue_manager_user_config.json"
const CACHE_PATH = "user://dialogue_manager_cache.json"


enum MutationBehaviour {
	Wait,
	DoNotWait,
	Skip
}

enum TranslationSource {
	None,
	Guess,
	CSV,
	PO
}

# Token types

const TOKEN_FUNCTION = &"function"
const TOKEN_DICTIONARY_REFERENCE = &"dictionary_reference"
const TOKEN_DICTIONARY_NESTED_REFERENCE = &"dictionary_nested_reference"
const TOKEN_GROUP = &"group"
const TOKEN_ARRAY = &"array"
const TOKEN_DICTIONARY = &"dictionary"
const TOKEN_PARENS_OPEN = &"parens_open"
const TOKEN_PARENS_CLOSE = &"parens_close"
const TOKEN_BRACKET_OPEN = &"bracket_open"
const TOKEN_BRACKET_CLOSE = &"bracket_close"
const TOKEN_BRACE_OPEN = &"brace_open"
const TOKEN_BRACE_CLOSE = &"brace_close"
const TOKEN_COLON = &"colon"
const TOKEN_COMPARISON = &"comparison"
const TOKEN_ASSIGNMENT = &"assignment"
const TOKEN_OPERATOR = &"operator"
const TOKEN_COMMA = &"comma"
const TOKEN_NULL_COALESCE = &"null_coalesce"
const TOKEN_DOT = &"dot"
const TOKEN_CONDITION = &"condition"
const TOKEN_BOOL = &"bool"
const TOKEN_NOT = &"not"
const TOKEN_AND_OR = &"and_or"
const TOKEN_STRING = &"string"
const TOKEN_NUMBER = &"number"
const TOKEN_VARIABLE = &"variable"
const TOKEN_COMMENT = &"comment"

const TOKEN_VALUE = &"value"
const TOKEN_ERROR = &"error"

# Line types

const TYPE_UNKNOWN = &""
const TYPE_IMPORT = &"import"
const TYPE_USING = &"using"
const TYPE_COMMENT = &"comment"
const TYPE_RESPONSE = &"response"
const TYPE_TITLE = &"title"
const TYPE_CONDITION = &"condition"
const TYPE_WHILE = &"while"
const TYPE_MATCH = &"match"
const TYPE_WHEN = &"when"
const TYPE_MUTATION = &"mutation"
const TYPE_GOTO = &"goto"
const TYPE_DIALOGUE = &"dialogue"
const TYPE_RANDOM = &"random"
const TYPE_ERROR = &"error"

# Line IDs

const ID_NULL = &""
const ID_ERROR = &"error"
const ID_ERROR_INVALID_TITLE = &"invalid title"
const ID_ERROR_TITLE_HAS_NO_BODY = &"title has no body"
const ID_END = &"end"
const ID_END_CONVERSATION = &"end!"

# Errors

const ERR_ERRORS_IN_IMPORTED_FILE = 100
const ERR_FILE_ALREADY_IMPORTED = 101
const ERR_DUPLICATE_IMPORT_NAME = 102
const ERR_EMPTY_TITLE = 103
const ERR_DUPLICATE_TITLE = 104
const ERR_TITLE_INVALID_CHARACTERS = 106
const ERR_UNKNOWN_TITLE = 107
const ERR_INVALID_TITLE_REFERENCE = 108
const ERR_TITLE_REFERENCE_HAS_NO_CONTENT = 109
const ERR_INVALID_EXPRESSION = 110
const ERR_UNEXPECTED_CONDITION = 111
const ERR_DUPLICATE_ID = 112
const ERR_MISSING_ID = 113
const ERR_INVALID_INDENTATION = 114
const ERR_INVALID_CONDITION_INDENTATION = 115
const ERR_INCOMPLETE_EXPRESSION = 116
const ERR_INVALID_EXPRESSION_FOR_VALUE = 117
const ERR_UNKNOWN_LINE_SYNTAX = 118
const ERR_TITLE_BEGINS_WITH_NUMBER = 119
const ERR_UNEXPECTED_END_OF_EXPRESSION = 120
const ERR_UNEXPECTED_FUNCTION = 121
const ERR_UNEXPECTED_BRACKET = 122
const ERR_UNEXPECTED_CLOSING_BRACKET = 123
const ERR_MISSING_CLOSING_BRACKET = 124
const ERR_UNEXPECTED_OPERATOR = 125
const ERR_UNEXPECTED_COMMA = 126
const ERR_UNEXPECTED_COLON = 127
const ERR_UNEXPECTED_DOT = 128
const ERR_UNEXPECTED_BOOLEAN = 129
const ERR_UNEXPECTED_STRING = 130
const ERR_UNEXPECTED_NUMBER = 131
const ERR_UNEXPECTED_VARIABLE = 132
const ERR_INVALID_INDEX = 133
const ERR_UNEXPECTED_ASSIGNMENT = 134
const ERR_UNKNOWN_USING = 135
const ERR_EXPECTED_WHEN_OR_ELSE = 136
const ERR_ONLY_ONE_ELSE_ALLOWED = 137
const ERR_WHEN_MUST_BELONG_TO_MATCH = 138
const ERR_CONCURRENT_LINE_WITHOUT_ORIGIN = 139
const ERR_GOTO_NOT_ALLOWED_ON_CONCURRECT_LINES = 140
const ERR_UNEXPECTED_SYNTAX_ON_NESTED_DIALOGUE_LINE = 141
const ERR_NESTED_DIALOGUE_INVALID_JUMP = 142
const ERR_MISSING_RESOURCE_FOR_AUTOSTART = 143


static var _current_locale: String = ""
static var _current_translation: Translation


## Get the error message
static func get_error_message(error: int) -> String:
	match error:
		ERR_ERRORS_IN_IMPORTED_FILE:
			return translate(&"errors.import_errors")
		ERR_FILE_ALREADY_IMPORTED:
			return translate(&"errors.already_imported")
		ERR_DUPLICATE_IMPORT_NAME:
			return translate(&"errors.duplicate_import")
		ERR_EMPTY_TITLE:
			return translate(&"errors.empty_title")
		ERR_DUPLICATE_TITLE:
			return translate(&"errors.duplicate_title")
		ERR_TITLE_INVALID_CHARACTERS:
			return translate(&"errors.invalid_title_string")
		ERR_TITLE_BEGINS_WITH_NUMBER:
			return translate(&"errors.invalid_title_number")
		ERR_UNKNOWN_TITLE:
			return translate(&"errors.unknown_title")
		ERR_INVALID_TITLE_REFERENCE:
			return translate(&"errors.jump_to_invalid_title")
		ERR_TITLE_REFERENCE_HAS_NO_CONTENT:
			return translate(&"errors.title_has_no_content")
		ERR_INVALID_EXPRESSION:
			return translate(&"errors.invalid_expression")
		ERR_UNEXPECTED_CONDITION:
			return translate(&"errors.unexpected_condition")
		ERR_DUPLICATE_ID:
			return translate(&"errors.duplicate_id")
		ERR_MISSING_ID:
			return translate(&"errors.missing_id")
		ERR_INVALID_INDENTATION:
			return translate(&"errors.invalid_indentation")
		ERR_INVALID_CONDITION_INDENTATION:
			return translate(&"errors.condition_has_no_content")
		ERR_INCOMPLETE_EXPRESSION:
			return translate(&"errors.incomplete_expression")
		ERR_INVALID_EXPRESSION_FOR_VALUE:
			return translate(&"errors.invalid_expression_for_value")
		ERR_FILE_NOT_FOUND:
			return translate(&"errors.file_not_found")
		ERR_UNEXPECTED_END_OF_EXPRESSION:
			return translate(&"errors.unexpected_end_of_expression")
		ERR_UNEXPECTED_FUNCTION:
			return translate(&"errors.unexpected_function")
		ERR_UNEXPECTED_BRACKET:
			return translate(&"errors.unexpected_bracket")
		ERR_UNEXPECTED_CLOSING_BRACKET:
			return translate(&"errors.unexpected_closing_bracket")
		ERR_MISSING_CLOSING_BRACKET:
			return translate(&"errors.missing_closing_bracket")
		ERR_UNEXPECTED_OPERATOR:
			return translate(&"errors.unexpected_operator")
		ERR_UNEXPECTED_COMMA:
			return translate(&"errors.unexpected_comma")
		ERR_UNEXPECTED_COLON:
			return translate(&"errors.unexpected_colon")
		ERR_UNEXPECTED_DOT:
			return translate(&"errors.unexpected_dot")
		ERR_UNEXPECTED_BOOLEAN:
			return translate(&"errors.unexpected_boolean")
		ERR_UNEXPECTED_STRING:
			return translate(&"errors.unexpected_string")
		ERR_UNEXPECTED_NUMBER:
			return translate(&"errors.unexpected_number")
		ERR_UNEXPECTED_VARIABLE:
			return translate(&"errors.unexpected_variable")
		ERR_INVALID_INDEX:
			return translate(&"errors.invalid_index")
		ERR_UNEXPECTED_ASSIGNMENT:
			return translate(&"errors.unexpected_assignment")
		ERR_UNKNOWN_USING:
			return translate(&"errors.unknown_using")
		ERR_EXPECTED_WHEN_OR_ELSE:
			return translate(&"errors.expected_when_or_else")
		ERR_ONLY_ONE_ELSE_ALLOWED:
			return translate(&"errors.only_one_else_allowed")
		ERR_WHEN_MUST_BELONG_TO_MATCH:
			return translate(&"errors.when_must_belong_to_match")
		ERR_CONCURRENT_LINE_WITHOUT_ORIGIN:
			return translate(&"errors.concurrent_line_without_origin")
		ERR_GOTO_NOT_ALLOWED_ON_CONCURRECT_LINES:
			return translate(&"errors.goto_not_allowed_on_concurrect_lines")
		ERR_UNEXPECTED_SYNTAX_ON_NESTED_DIALOGUE_LINE:
			return translate(&"errors.unexpected_syntax_on_nested_dialogue_line")
		ERR_NESTED_DIALOGUE_INVALID_JUMP:
			return translate(&"errors.err_nested_dialogue_invalid_jump")
		ERR_MISSING_RESOURCE_FOR_AUTOSTART:
			return translate(&"errors.missing_resource_for_autostart")

	return translate(&"errors.unknown")


static func translate(string: String) -> String:
	var locale: String = TranslationServer.get_tool_locale()
	if _current_translation == null or _current_locale != locale:
		var base_path: String = new().get_script().resource_path.get_base_dir()
		var translation_path: String = "%s/l10n/%s.po" % [base_path, locale]
		var fallback_translation_path: String = "%s/l10n/%s.po" % [base_path, locale.substr(0, 2)]
		var en_translation_path: String = "%s/l10n/en.po" % base_path
		_current_translation = load(translation_path if FileAccess.file_exists(translation_path) else (fallback_translation_path if FileAccess.file_exists(fallback_translation_path) else en_translation_path))
		_current_locale = locale
	return _current_translation.get_message(string)
```

## File: addons/dialogue_manager/constants.gd.uid
```
uid://b1oarbmjtyesf
```

## File: addons/dialogue_manager/dialogue_label.gd
```
@icon("./assets/icon.svg")

@tool

## A RichTextLabel specifically for use with [b]Dialogue Manager[/b] dialogue.
class_name DialogueLabel extends RichTextLabel


## Emitted for each letter typed out.
signal spoke(letter: String, letter_index: int, speed: float)

## Emitted when the player skips the typing of dialogue.
signal skipped_typing()

## Emitted when typing starts
signal started_typing()

## Emitted when typing finishes.
signal finished_typing()

## [Deprecated] No longer emitted.
signal paused_typing(duration: float)


## The action to press to skip typing.
@export var skip_action: StringName = &"ui_cancel"

## The speed with which the text types out.
@export var seconds_per_step: float = 0.02

## Automatically have a brief pause when these characters are encountered.
@export var pause_at_characters: String = ".?!"

## Don't auto pause if the character after the pause is one of these.
@export var skip_pause_at_character_if_followed_by: String = ")\""

## Don't auto pause after these abbreviations (only if "." is in `pause_at_characters`).[br]
## Abbreviations are limitted to 5 characters in length [br]
## Does not support multi-period abbreviations (ex. "p.m.")
@export var skip_pause_at_abbreviations: PackedStringArray = ["Mr", "Mrs", "Ms", "Dr", "etc", "eg", "ex"]

## The amount of time to pause when exposing a character present in `pause_at_characters`.
@export var seconds_per_pause_step: float = 0.3

var _already_mutated_indices: PackedInt32Array = []


## The current line of dialogue.
var dialogue_line:
	set(value):
		if value != dialogue_line:
			dialogue_line = value
			_update_text()
	get:
		return dialogue_line

## Whether the label is currently typing itself out.
var is_typing: bool = false:
	set(value):
		var is_finished: bool = _is_typing != value and value == false and visible_characters == get_total_character_count()
		_is_typing = value
		if is_finished:
			finished_typing.emit()
	get:
		return _is_typing and not _is_awaiting_mutation
var _is_typing: bool = false

var _last_wait_index: int = -1
var _last_mutation_index: int = -1
var _waiting_seconds: float = 0
var _is_awaiting_mutation: bool = false


func _process(delta: float) -> void:
	if _is_typing:
		# Type out text
		if visible_ratio < 1:
			# See if we are waiting
			if _waiting_seconds > 0:
				_waiting_seconds = _waiting_seconds - delta
			# If we are no longer waiting then keep typing
			if _waiting_seconds <= 0:
				_type_next(delta, _waiting_seconds)
		else:
			# Make sure any mutations at the end of the line get run
			_mutate_inline_mutations(get_total_character_count())
			is_typing = false


## Sets the label's text from the current dialogue line. Override if you want
## to do something more interesting in your subclass.
func _update_text() -> void:
	text = dialogue_line.text


## Start typing out the text
func type_out() -> void:
	_update_text()
	visible_characters = 0
	visible_ratio = 0
	_waiting_seconds = 0
	_last_wait_index = -1
	_last_mutation_index = -1
	_already_mutated_indices.clear()

	is_typing = true
	started_typing.emit()

	# Allow typing listeners a chance to connect
	await get_tree().process_frame

	if get_total_character_count() == 0:
		is_typing = false
	elif seconds_per_step == 0:
		_mutate_remaining_mutations()
		visible_characters = get_total_character_count()
		is_typing = false


## Stop typing out the text and jump right to the end
func skip_typing() -> void:
	_mutate_remaining_mutations()
	visible_characters = get_total_character_count()
	is_typing = false
	skipped_typing.emit()


# Type out the next character(s)
func _type_next(delta: float, seconds_needed: float) -> void:
	if _is_awaiting_mutation: return

	if visible_characters == get_total_character_count():
		return

	if _last_mutation_index != visible_characters:
		_last_mutation_index = visible_characters
		_mutate_inline_mutations(visible_characters)
		if _is_awaiting_mutation: return

	# Pause on characters like "."
	var waiting_seconds: float = seconds_per_pause_step if _should_auto_pause() else 0
	if _last_wait_index != visible_characters and waiting_seconds > 0:
		_last_wait_index = visible_characters
		_waiting_seconds += waiting_seconds
	else:
		visible_characters += 1
		if visible_characters <= get_total_character_count():
			spoke.emit(get_parsed_text()[visible_characters - 1], visible_characters - 1, _get_speed(visible_characters))
		# See if there's time to type out some more in this frame
		seconds_needed += seconds_per_step * (1.0 / _get_speed(visible_characters))
		if seconds_needed > delta:
			_waiting_seconds += seconds_needed
		else:
			_type_next(delta, seconds_needed)


# Get the speed for the current typing position
func _get_speed(at_index: int) -> float:
	var speed: float = 1
	for index in dialogue_line.speeds:
		if index > at_index:
			return speed
		speed = dialogue_line.speeds[index]
	return speed


# Run any inline mutations that haven't been run yet
func _mutate_remaining_mutations() -> void:
	for i in range(visible_characters, get_total_character_count() + 1):
		_mutate_inline_mutations(i)


# Run any mutations at the current typing position
func _mutate_inline_mutations(index: int) -> void:
	for inline_mutation in dialogue_line.inline_mutations:
		# inline mutations are an array of arrays in the form of [character index, resolvable function]
		if inline_mutation[0] > index:
			return
		if inline_mutation[0] == index and not _already_mutated_indices.has(index):
			_is_awaiting_mutation = true
			# The DialogueManager can't be referenced directly here so we need to get it by its path
			await Engine.get_singleton("DialogueManager")._mutate(inline_mutation[1], dialogue_line.extra_game_states, true)
			_is_awaiting_mutation = false

	_already_mutated_indices.append(index)


# Determine if the current autopause character at the cursor should qualify to pause typing.
func _should_auto_pause() -> bool:
	if visible_characters == 0: return false

	var parsed_text: String = get_parsed_text()

	# Avoid outofbounds when the label auto-translates and the text changes to one shorter while typing out
	# Note: visible characters can be larger than parsed_text after a translation event
	if visible_characters >= parsed_text.length(): return false

	# Ignore pause characters if they are next to a non-pause character
	if parsed_text[visible_characters] in skip_pause_at_character_if_followed_by.split():
		return false

	# Ignore "." if it's between two numbers
	if visible_characters > 3 and parsed_text[visible_characters - 1] == ".":
		var possible_number: String = parsed_text.substr(visible_characters - 2, 3)
		if str(float(possible_number)).pad_decimals(1) == possible_number:
			return false

	# Ignore "." if it's used in an abbreviation
	# Note: does NOT support multi-period abbreviations (ex. p.m.)
	if "." in pause_at_characters and parsed_text[visible_characters - 1] == ".":
		for abbreviation in skip_pause_at_abbreviations:
			if visible_characters >= abbreviation.length():
				var previous_characters: String = parsed_text.substr(visible_characters - abbreviation.length() - 1, abbreviation.length())
				if previous_characters == abbreviation:
					return false

	# Ignore two non-"." characters next to each other
	var other_pause_characters: PackedStringArray = pause_at_characters.replace(".", "").split()
	if visible_characters > 1 and parsed_text[visible_characters - 1] in other_pause_characters and parsed_text[visible_characters] in other_pause_characters:
		return false

	return parsed_text[visible_characters - 1] in pause_at_characters.split()
```

## File: addons/dialogue_manager/dialogue_label.gd.uid
```
uid://g32um0mltv5d
```

## File: addons/dialogue_manager/dialogue_label.tscn
```
[gd_scene load_steps=2 format=3 uid="uid://ckvgyvclnwggo"]

[ext_resource type="Script" uid="uid://g32um0mltv5d" path="res://addons/dialogue_manager/dialogue_label.gd" id="1_cital"]

[node name="DialogueLabel" type="RichTextLabel"]
anchors_preset = 10
anchor_right = 1.0
grow_horizontal = 2
mouse_filter = 1
bbcode_enabled = true
fit_content = true
scroll_active = false
shortcut_keys_enabled = false
meta_underlined = false
hint_underlined = false
deselect_on_focus_loss_enabled = false
visible_characters_behavior = 1
script = ExtResource("1_cital")
skip_pause_at_abbreviations = PackedStringArray("Mr", "Mrs", "Ms", "Dr", "etc", "eg", "ex")
```

## File: addons/dialogue_manager/dialogue_line.gd
```
## A line of dialogue returned from [code]DialogueManager[/code].
class_name DialogueLine extends RefCounted


## The ID of this line
var id: String

## The internal type of this dialogue object. One of [code]TYPE_DIALOGUE[/code] or [code]TYPE_MUTATION[/code]
var type: String = DMConstants.TYPE_DIALOGUE

## The next line ID after this line.
var next_id: String = ""

## The character name that is saying this line.
var character: String = ""

## A dictionary of variable replacements fo the character name. Generally for internal use only.
var character_replacements: Array[Dictionary] = []

## The dialogue being spoken.
var text: String = ""

## A dictionary of replacements for the text. Generally for internal use only.
var text_replacements: Array[Dictionary] = []

## The key to use for translating this line.
var translation_key: String = ""

## A map for speed changes when typing out the dialogue text.
var speeds: Dictionary = {}

## A map of any mutations to run while typing out the dialogue text.
var inline_mutations: Array[Array] = []

## A list of responses attached to this line of dialogue.
var responses: Array = []

## A list of lines that are spoken simultaneously with this one.
var concurrent_lines: Array[DialogueLine] = []

## A list of any extra game states to check when resolving variables and mutations.
var extra_game_states: Array = []

## How long to show this line before advancing to the next. Either a float (of seconds), [code]"auto"[/code], or [code]null[/code].
var time: String = ""

## Any #tags that were included in the line
var tags: PackedStringArray = []

## The mutation details if this is a mutation line (where [code]type == TYPE_MUTATION[/code]).
var mutation: Dictionary = {}

## The conditions to check before including this line in the flow of dialogue. If failed the line will be skipped over.
var conditions: Dictionary = {}


func _init(data: Dictionary = {}) -> void:
	if data.size() > 0:
		id = data.id
		next_id = data.next_id
		type = data.type
		extra_game_states = data.get("extra_game_states", [])

		match type:
			DMConstants.TYPE_DIALOGUE:
				character = data.character
				character_replacements = data.get("character_replacements", [] as Array[Dictionary])
				text = data.text
				text_replacements = data.get("text_replacements", [] as Array[Dictionary])
				translation_key = data.get("translation_key", data.text)
				speeds = data.get("speeds", {})
				inline_mutations = data.get("inline_mutations", [] as Array[Array])
				time = data.get("time", "")
				tags = data.get("tags", [])
				concurrent_lines = data.get("concurrent_lines", [] as Array[DialogueLine])

			DMConstants.TYPE_MUTATION:
				mutation = data.mutation


func _to_string() -> String:
	match type:
		DMConstants.TYPE_DIALOGUE:
			return "<DialogueLine character=\"%s\" text=\"%s\">" % [character, text]
		DMConstants.TYPE_MUTATION:
			return "<DialogueLine mutation>"
	return ""


## Check if a dialogue line has a given tag.
func has_tag(tag_name: String) -> bool:
	var wrapped: String = "%s=" % tag_name
	for t in tags:
		if t.begins_with(wrapped):
			return true
	return false


## Get the value of a tag if the tag is in the form of [code]tag=value[/code]
func get_tag_value(tag_name: String) -> String:
	var wrapped: String = "%s=" % tag_name
	for t in tags:
		if t.begins_with(wrapped):
			return t.replace(wrapped, "").strip_edges()
	return ""
```

## File: addons/dialogue_manager/dialogue_line.gd.uid
```
uid://rhuq0eyf8ar2
```

## File: addons/dialogue_manager/dialogue_manager.gd
```
extends Node

const DialogueResource = preload("./dialogue_resource.gd")
const DialogueLine = preload("./dialogue_line.gd")
const DialogueResponse = preload("./dialogue_response.gd")

const DMConstants = preload("./constants.gd")
const Builtins = preload("./utilities/builtins.gd")
const DMSettings = preload("./settings.gd")
const DMCompiler = preload("./compiler/compiler.gd")
const DMCompilerResult = preload("./compiler/compiler_result.gd")
const DMResolvedLineData = preload("./compiler/resolved_line_data.gd")


## Emitted when a dialogue balloon is created and dialogue starts
signal dialogue_started(resource: DialogueResource)

## Emitted when a title is encountered while traversing dialogue, usually when jumping from a
## goto line
signal passed_title(title: String)

## Emitted when a line of dialogue is encountered.
signal got_dialogue(line: DialogueLine)

## Emitted when a mutation is encountered.
signal mutated(mutation: Dictionary)

## Emitted when some dialogue has reached the end.
signal dialogue_ended(resource: DialogueResource)

## Used internally.
signal bridge_get_next_dialogue_line_completed(call_index: int, line: DialogueLine)

## Used internally.
signal bridge_get_line_completed(call_index: int, line: DialogueLine)

## Used internally
signal bridge_mutated(call_index: int)


## The list of globals that dialogue can query
var game_states: Array = []

## Allow dialogue to call singletons
var include_singletons: bool = true

## Allow dialogue to call static methods/properties on classes
var include_classes: bool = true

## Manage translation behaviour
var translation_source: DMConstants.TranslationSource = DMConstants.TranslationSource.Guess

## Used to resolve the current scene. Override if your game manages the current scene itself.
var get_current_scene: Callable = func():
	var current_scene: Node = Engine.get_main_loop().current_scene
	if current_scene == null:
		current_scene = Engine.get_main_loop().root.get_child(Engine.get_main_loop().root.get_child_count() - 1)
	return current_scene

var _has_loaded_autoloads: bool = false
var _autoloads: Dictionary = {}

var _node_properties: Array = []
var _method_info_cache: Dictionary = {}

var _dotnet_dialogue_manager: RefCounted

var _expression_parser: DMExpressionParser = DMExpressionParser.new()


func _ready() -> void:
	# Cache the known Node2D properties
	_node_properties = ["Script Variables"]
	var temp_node: Node2D = Node2D.new()
	for property in temp_node.get_property_list():
		_node_properties.append(property.name)
	temp_node.free()

	# Make the dialogue manager available as a singleton
	if not Engine.has_singleton("DialogueManager"):
		Engine.register_singleton("DialogueManager", self)


## Step through lines and run any mutations until we either hit some dialogue or the end of the conversation
func get_next_dialogue_line(resource: DialogueResource, key: String = "", extra_game_states: Array = [], mutation_behaviour: DMConstants.MutationBehaviour = DMConstants.MutationBehaviour.Wait) -> DialogueLine:
	var line = await _get_next_dialogue_line(resource, key, extra_game_states, mutation_behaviour)
	if line == null:
		# End the conversation
		dialogue_ended.emit(resource)
	return line


# Internal line getter.
func _get_next_dialogue_line(resource: DialogueResource, key: String = "", extra_game_states: Array = [], mutation_behaviour: DMConstants.MutationBehaviour = DMConstants.MutationBehaviour.Wait) -> DialogueLine:
	# You have to provide a valid dialogue resource
	if resource == null:
		assert(false, DMConstants.translate(&"runtime.no_resource"))
	if resource.lines.size() == 0:
		assert(false, DMConstants.translate(&"runtime.no_content").format({ file_path = resource.resource_path }))

	# Inject any "using" states into the game_states
	for state_name in resource.using_states:
		var autoload = Engine.get_main_loop().root.get_node_or_null(state_name)
		if autoload == null:
			printerr(DMConstants.translate(&"runtime.unknown_autoload").format({ autoload = state_name }))
		else:
			extra_game_states = [autoload] + extra_game_states

	# Inject "self" into the extra game states.
	extra_game_states = [{ "self": resource }] + extra_game_states

	# Get the line data
	var dialogue: DialogueLine = await get_line(resource, key, extra_game_states)

	# If our dialogue is nothing then we hit the end
	if not _is_valid(dialogue):
		return null

	# Run the mutation if it is one
	if dialogue.type == DMConstants.TYPE_MUTATION:
		var actual_next_id: String = dialogue.next_id.split("|")[0]
		match mutation_behaviour:
			DMConstants.MutationBehaviour.Wait:
				await _mutate(dialogue.mutation, extra_game_states)
			DMConstants.MutationBehaviour.DoNotWait:
				_mutate(dialogue.mutation, extra_game_states)
			DMConstants.MutationBehaviour.Skip:
				pass
		if actual_next_id in [DMConstants.ID_END_CONVERSATION, DMConstants.ID_NULL, null]:
			return null
		else:
			return await _get_next_dialogue_line(resource, dialogue.next_id, extra_game_states, mutation_behaviour)
	else:
		got_dialogue.emit(dialogue)
		return dialogue


## Get a line by its ID
func get_line(resource: DialogueResource, key: String, extra_game_states: Array) -> DialogueLine:
	key = key.strip_edges()

	# See if we were given a stack instead of just the one key
	var stack: Array = key.split("|")
	key = stack.pop_front()
	var id_trail: String = "" if stack.size() == 0 else "|" + "|".join(stack)

	# Resolve this line reference to use the correct resource
	var previous_resource: DialogueResource = resource
	if "@" in key:
		var bits: PackedStringArray = key.split("@")
		if bits[0] != _get_resource_uid(resource):
			resource = load("uid://" + bits[0])
		key = bits[1]

	# Key is blank so just use the first title (or start of file)
	if key == null or key == "":
		if resource.first_title.is_empty():
			key = resource.lines.keys()[0]
		else:
			key = resource.first_title

	# See if we just ended the conversation
	if key in [DMConstants.ID_END, DMConstants.ID_NULL, null]:
		if stack.size() > 0:
			return await get_line(resource, "|".join(stack), extra_game_states)
		else:
			return null
	elif key == DMConstants.ID_END_CONVERSATION:
		return null

	# See if it is a title
	if key.begins_with("~ "):
		key = key.substr(2)
	if resource.titles.has(key):
		key = resource.titles.get(key)
		# Handle the resource reference if the title had one
		if "@" in key:
			var bits: PackedStringArray = key.split("@")
			if bits[0] != _get_resource_uid(resource):
				resource = load("uid://" + bits[0])
			key = bits[1]

	if key in resource.titles.values():
		passed_title.emit(resource.titles.find_key(key))

	if not resource.lines.has(key):
		assert(false, DMConstants.translate(&"errors.key_not_found").format({ key = key }))

	var data: Dictionary = resource.lines.get(key)

	# If next_id is an expression we need to resolve it.
	if data.has(&"next_id_expression"):
		data.next_id = await _resolve(data.next_id_expression, extra_game_states)

	# This title key points to another title key so we should jump there instead
	if data.type == DMConstants.TYPE_TITLE and data.next_id in resource.titles.values():
		return await get_line(resource, data.next_id + id_trail, extra_game_states)

	# Handle match statements
	if data.type == DMConstants.TYPE_MATCH:
		var value = await _resolve_condition_value(data, extra_game_states)
		var else_cases: Array[Dictionary] = data.cases.filter(func(s): return s.has("is_else"))
		var else_case: Dictionary = {} if else_cases.size() == 0 else else_cases.front()
		var next_id: String = ""
		for case in data.cases:
			if case == else_case:
				continue
			elif await _check_case_value(value, case, extra_game_states):
				next_id = case.next_id
				break
		# Nothing matched so check for else case
		if next_id == "":
			if not else_case.is_empty():
				next_id = else_case.next_id
			else:
				next_id = data.next_id_after
		return await get_line(resource, next_id + id_trail, extra_game_states)

	# Check for weighted random lines.
	if data.has(&"siblings"):
		# Only count siblings that pass their condition (if they have one).
		var successful_siblings: Array = data.siblings.filter(func(sibling): return not sibling.has("condition") or await _check_condition(sibling, extra_game_states))
		# If there are no siblings that pass their conditions then just skip over them all.
		if successful_siblings.size() == 0:
			return await get_line(resource, data.next_id + id_trail, extra_game_states)
		# Otherwise, pick a random one.
		var target_weight: float = randf_range(0, successful_siblings.reduce(func(total, sibling): return total + sibling.weight, 0))
		var cummulative_weight: float = 0
		for sibling in successful_siblings:
			if target_weight < cummulative_weight + sibling.weight:
				data = resource.lines.get(sibling.id)
				break
			else:
				cummulative_weight += sibling.weight

	# If this line is blank and it's the last line then check for returning snippets.
	if data.type in [DMConstants.TYPE_COMMENT, DMConstants.TYPE_UNKNOWN]:
		if data.next_id in [DMConstants.ID_END, DMConstants.ID_NULL, null]:
			if stack.size() > 0:
				return await get_line(resource, "|".join(stack), extra_game_states)
			else:
				return null
		else:
			return await get_line(resource, data.next_id + id_trail, extra_game_states)

	# If the line is a random block then go to the start of the block.
	elif data.type == DMConstants.TYPE_RANDOM:
		return await get_line(resource, data.next_id + id_trail, extra_game_states)

	# Check conditions.
	elif data.type in [DMConstants.TYPE_CONDITION, DMConstants.TYPE_WHILE]:
		# "else" will have no actual condition.
		if await _check_condition(data, extra_game_states):
			return await get_line(resource, data.next_id + id_trail, extra_game_states)
		elif data.has("next_sibling_id") and not data.next_sibling_id.is_empty():
			return await get_line(resource, data.next_sibling_id + id_trail, extra_game_states)
		else:
			return await get_line(resource, data.next_id_after + id_trail, extra_game_states)

	# Evaluate jumps.
	elif data.type == DMConstants.TYPE_GOTO:
		if data.is_snippet:
			# Point the return address at this resource
			var next_id_after: String = _get_id_with_resource(resource, data.next_id_after)
			if not id_trail.begins_with("|" + next_id_after):
				id_trail = "|" + next_id_after + id_trail

		# If next_id has a UID reference then split it to find where to actually go next
		var next_id: String = data.next_id
		if "@" in next_id:
			var bits: PackedStringArray = data.next_id.split("@")
			resource = load("uid://" + bits[0])
			next_id = bits[1]

		# If the title isn't in this resource it might be back in the original one
		if not resource.lines.has(next_id) and not resource.titles.has(next_id):
			resource = previous_resource

		return await get_line(resource, next_id + id_trail, extra_game_states)

	elif data.type == DMConstants.TYPE_DIALOGUE:
		if not data.has(&"id"):
			data.id = key

	# Set up a line object.
	var line: DialogueLine = await create_dialogue_line(data, extra_game_states)

	# If the jump point somehow has no content then just end.
	if not line: return null

	# Find any simultaneously said lines.
	if data.has(&"concurrent_lines"):
		# If the list includes this line then it isn't the origin line so ignore it.
		if not data.concurrent_lines.has(data.id):
			# Resolve IDs to their actual lines.
			for line_id: String in data.concurrent_lines:
				line.concurrent_lines.append(await get_line(resource, line_id, extra_game_states))

	# If we are the first of a list of responses then get the other ones.
	if data.type == DMConstants.TYPE_RESPONSE:
		# Note: For some reason C# has occasional issues with using the responses property directly
		# so instead we use set and get here.
		line.set(&"responses", await _get_responses(data.get(&"responses", []), resource, id_trail, extra_game_states))
		return line

	# Inject the next node's responses if they have any.
	if resource.lines.has(line.next_id):
		var next_line: Dictionary = resource.lines.get(line.next_id)

		# If the next line is an end and we have an ID trail then see if it points to responses
		var peeked_at_stack: bool = false
		if next_line.next_id == DMConstants.ID_END and stack.size() > 0:
			peeked_at_stack = true
			var return_to_resource = resource
			var return_to_id: String = stack.front()
			if "@" in return_to_id:
				var bits: PackedStringArray = return_to_id.split("@")
				if bits[0] != _get_resource_uid(resource):
					return_to_resource = load("uid://" + bits[0])
				return_to_id = bits[1]
			next_line = return_to_resource.lines.get(return_to_id)

		# If the response line is marked as a title then make sure to emit the passed_title signal.
		if line.next_id in resource.titles.values():
			passed_title.emit(resource.titles.find_key(line.next_id))

		# If the responses come from a snippet then we need to come back here afterwards.
		if not peeked_at_stack and next_line.type == DMConstants.TYPE_GOTO and next_line.is_snippet and not id_trail.begins_with("|" + _get_id_with_resource(resource, next_line.next_id_after)):
			id_trail = "|" + _get_id_with_resource(resource, next_line.next_id_after) + id_trail

		# If the next line is a title then check where it points to see if that is a set of responses.
		while [DMConstants.TYPE_TITLE, DMConstants.TYPE_GOTO].has(next_line.type) and resource.lines.has(next_line.next_id):
			next_line = resource.lines.get(next_line.next_id)

		if next_line != null and next_line.type == DMConstants.TYPE_RESPONSE:
			# Note: For some reason C# has occasional issues with using the responses property directly
			# so instead we use set and get here.
			line.set(&"responses", await _get_responses(next_line.get(&"responses", []), resource, id_trail, extra_game_states))

	line.next_id = "|".join(stack) if line.next_id == DMConstants.ID_NULL else _get_id_with_resource(resource, line.next_id) + id_trail
	return line


## Replace any variables, etc in the text.
func get_resolved_line_data(data: Dictionary, extra_game_states: Array = []) -> DMResolvedLineData:
	var text: String = translate(data)

	# Resolve variables
	var text_replacements: Array[Dictionary] = data.get(&"text_replacements", [] as Array[Dictionary])
	if text_replacements.size() == 0 and "{{" in text:
		# This line is translated but has expressions that didn't exist in the base text.
		text_replacements = _expression_parser.extract_replacements(text, 0)

	for replacement in text_replacements:
		if replacement.has("error"):
			assert(false, "%s \"%s\"" % [DMConstants.get_error_message(replacement.get("error")), text])

		var value = await _resolve(replacement.expression.duplicate(true), extra_game_states)
		var index: int = text.find(replacement.value_in_text)
		if index == -1:
			# The replacement wasn't found but maybe the regular quotes have been replaced
			# by special quotes while translating.
			index = text.replace("“", "\"").replace("”", "\"").find(replacement.value_in_text)
		if index > -1:
			text = text.substr(0, index) + str(value) + text.substr(index + replacement.value_in_text.length())

	var compilation: DMCompilation = DMCompilation.new()

	# Resolve random groups
	for found in compilation.regex.INLINE_RANDOM_REGEX.search_all(text):
		var options = found.get_string(&"options").split(&"|")
		text = text.replace(&"[[%s]]" % found.get_string(&"options"), options[randi_range(0, options.size() - 1)])

	# Do a pass on the markers to find any conditionals
	var markers: DMResolvedLineData = DMResolvedLineData.new(text)

	# Resolve any conditionals and update marker positions as needed
	if data.type in [DMConstants.TYPE_DIALOGUE, DMConstants.TYPE_RESPONSE]:
		var resolved_text: String = markers.text
		var conditionals: Array[RegExMatch] = compilation.regex.INLINE_CONDITIONALS_REGEX.search_all(resolved_text)
		var replacements: Array = []
		for conditional in conditionals:
			var condition_raw: String = conditional.strings[conditional.names.condition]
			var body: String = conditional.strings[conditional.names.body]
			var body_else: String = ""
			if &"[else]" in body:
				var bits = body.split(&"[else]")
				body = bits[0]
				body_else = bits[1]
			var condition: Dictionary = compilation.extract_condition("if " + condition_raw, false, 0)
			# If the condition fails then use the else of ""
			if not await _check_condition({ condition = condition }, extra_game_states):
				body = body_else
			replacements.append({
				start = conditional.get_start(),
				end = conditional.get_end(),
				string = conditional.get_string(),
				body = body
			})

		for i in range(replacements.size() - 1, -1, -1):
			var r: Dictionary = replacements[i]
			resolved_text = resolved_text.substr(0, r.start) + r.body + resolved_text.substr(r.end, 9999)
			# Move any other markers now that the text has changed
			_shift_markers(markers, r.start, r.end - r.start - r.body.length())

		var image_tags: Array[RegExMatch] = compilation.regex.IMAGE_TAGS_REGEX.search_all(resolved_text)
		for image_tag: RegExMatch in image_tags:
			# The [img] and [/img] tags have already been accounted for so now we just need to
			# adjust for the path length.
			_shift_markers(markers, image_tag.get_start(), image_tag.get_string(image_tag.names.path).length())

		markers.text = resolved_text

	return markers


func _shift_markers(markers: DMResolvedLineData, if_after: int, by_offset: int) -> void:
	for key in [&"speeds", &"time"]:
		if markers.get(key) == null: continue
		var marker = markers.get(key)
		var next_marker: Dictionary = {}
		for index in marker:
			if index < if_after:
				next_marker[index] = marker[index]
			elif index > if_after:
				next_marker[index - by_offset] = marker[index]
		markers.set(key, next_marker)
	var mutations: Array[Array] = markers.mutations
	var next_mutations: Array[Array] = []
	for mutation in mutations:
		var index = mutation[0]
		if index < if_after:
			next_mutations.append(mutation)
		elif index > if_after:
			next_mutations.append([index - by_offset, mutation[1]])
	markers.mutations = next_mutations


## Replace any variables, etc in the character name
func get_resolved_character(data: Dictionary, extra_game_states: Array = []) -> String:
	var character: String = data.get(&"character", "")

	# Resolve variables
	for replacement in data.get(&"character_replacements", []):
		var value = await _resolve(replacement.expression.duplicate(true), extra_game_states)
		var index: int = character.find(replacement.value_in_text)
		if index > -1:
			character = character.substr(0, index) + str(value) + character.substr(index + replacement.value_in_text.length())

	# Resolve random groups
	var random_regex: RegEx = RegEx.new()
	random_regex.compile("\\[\\[(?<options>.*?)\\]\\]")
	for found in random_regex.search_all(character):
		var options = found.get_string(&"options").split("|")
		character = character.replace("[[%s]]" % found.get_string(&"options"), options[randi_range(0, options.size() - 1)])

	return character


## Generate a dialogue resource on the fly from some text
func create_resource_from_text(text: String) -> Resource:
	var result: DMCompilerResult = DMCompiler.compile_string(text, "")

	if result.errors.size() > 0:
		printerr(DMConstants.translate(&"runtime.errors").format({ count = result.errors.size() }))
		for error in result.errors:
			printerr(DMConstants.translate(&"runtime.error_detail").format({
				line = error.line_number + 1,
				message = DMConstants.get_error_message(error.error)
			}))
		assert(false, DMConstants.translate(&"runtime.errors_see_details").format({ count = result.errors.size() }))

	var resource: DialogueResource = DialogueResource.new()
	resource.using_states = result.using_states
	resource.titles = result.titles
	resource.first_title = result.first_title
	resource.character_names = result.character_names
	resource.lines = result.lines
	resource.raw_text = text

	return resource


#region Balloon helpers


## Show the example balloon
func show_example_dialogue_balloon(resource: DialogueResource, title: String = "", extra_game_states: Array = []) -> CanvasLayer:
	var balloon: Node = load(_get_example_balloon_path()).instantiate()
	_start_balloon.call_deferred(balloon, resource, title, extra_game_states)
	return balloon


## Show the configured dialogue balloon
func show_dialogue_balloon(resource: DialogueResource, title: String = "", extra_game_states: Array = []) -> Node:
	var balloon_path: String = DMSettings.get_setting(DMSettings.BALLOON_PATH, _get_example_balloon_path())
	if not ResourceLoader.exists(balloon_path):
		balloon_path = _get_example_balloon_path()
	return show_dialogue_balloon_scene(balloon_path, resource, title, extra_game_states)


## Show a given balloon scene
func show_dialogue_balloon_scene(balloon_scene, resource: DialogueResource, title: String = "", extra_game_states: Array = []) -> Node:
	if balloon_scene is String:
		balloon_scene = load(balloon_scene)
	if balloon_scene is PackedScene:
		balloon_scene = balloon_scene.instantiate()

	var balloon: Node = balloon_scene
	_start_balloon.call_deferred(balloon, resource, title, extra_game_states)
	return balloon


## Resolve a static line ID to an actual line ID
func static_id_to_line_id(resource: DialogueResource, static_id: String) -> String:
	var ids = static_id_to_line_ids(resource, static_id)
	if ids.size() == 0: return ""
	return ids[0]


## Resolve a static line ID to any actual line IDs that match
func static_id_to_line_ids(resource: DialogueResource, static_id: String) -> PackedStringArray:
	return resource.lines.values().filter(func(l): return l.get(&"translation_key", "") == static_id).map(func(l): return l.id)


# Call "start" on the given balloon.
func _start_balloon(balloon: Node, resource: DialogueResource, title: String, extra_game_states: Array) -> void:
	dialogue_started.emit(resource)

	get_current_scene.call().add_child(balloon)

	if balloon.has_method(&"start"):
		balloon.start(resource, title, extra_game_states)
	elif balloon.has_method(&"Start"):
		balloon.Start(resource, title, extra_game_states)
	else:
		assert(false, DMConstants.translate(&"runtime.dialogue_balloon_missing_start_method"))


# Get the path to the example balloon
func _get_example_balloon_path() -> String:
	var is_small_window: bool = ProjectSettings.get_setting("display/window/size/viewport_width") < 400
	var balloon_path: String = "/example_balloon/small_example_balloon.tscn" if is_small_window else "/example_balloon/example_balloon.tscn"
	return get_script().resource_path.get_base_dir() + balloon_path


#endregion

#region dotnet bridge


func _get_dotnet_dialogue_manager() -> RefCounted:
	if not is_instance_valid(_dotnet_dialogue_manager):
		_dotnet_dialogue_manager = load(get_script().resource_path.get_base_dir() + "/DialogueManager.cs").new()
	return _dotnet_dialogue_manager


func _bridge_get_next_dialogue_line(call_id: int, resource: DialogueResource, key: String, extra_game_states: Array = [], mutation_behaviour: int = DMConstants.MutationBehaviour.Wait) -> void:
	# dotnet needs at least one await tick of the signal gets called too quickly
	await Engine.get_main_loop().process_frame
	var line = await _get_next_dialogue_line(resource, key, extra_game_states, mutation_behaviour)
	bridge_get_next_dialogue_line_completed.emit(call_id, line)
	if line == null:
		# End the conversation
		dialogue_ended.emit(resource)


func _bridge_get_line(call_id: int, resource: DialogueResource, key: String, extra_game_states: Array = []) -> void:
	# dotnet needs at least one await tick of the signal gets called too quickly
	await Engine.get_main_loop().process_frame
	var line = await get_line(resource, key, extra_game_states)
	bridge_get_line_completed.emit(call_id, line)


func _bridge_mutate(call_id: int, mutation: Dictionary, extra_game_states: Array, is_inline_mutation: bool = false) -> void:
	await _mutate(mutation, extra_game_states, is_inline_mutation)
	bridge_mutated.emit(call_id)


func _bridge_get_error_message(error: int) -> String:
	return DMConstants.get_error_message(error)


#endregion

#region Internal helpers


# Show a message or crash with error
func show_error_for_missing_state_value(message: String, will_show: bool = true) -> void:
	if not will_show: return

	if DMSettings.get_setting(DMSettings.IGNORE_MISSING_STATE_VALUES, false):
		push_error(message)
	elif will_show:
		# If you're here then you're missing a method or property in your game state. The error
		# message down in the debugger will give you some more information.
		assert(false, message)


# Translate a string
func translate(data: Dictionary) -> String:
	if TranslationServer.get_loaded_locales().size() == 0 or translation_source == DMConstants.TranslationSource.None:
		return data.text

	var translation_key: String = data.get(&"translation_key", data.text)

	if translation_key == "" or translation_key == data.text:
		return tr(data.text)
	else:
		# Line IDs work slightly differently depending on whether the translation came from a
		# CSV or a PO file. CSVs use the line ID (or the line itself) as the translatable string
		# whereas POs use the ID as context and the line itself as the translatable string.
		match translation_source:
			DMConstants.TranslationSource.PO:
				return tr(data.text, StringName(translation_key))

			DMConstants.TranslationSource.CSV:
				return tr(translation_key)

			DMConstants.TranslationSource.Guess:
				var translation_files: Array = ProjectSettings.get_setting(&"internationalization/locale/translations")
				if translation_files.filter(func(f: String): return f.get_extension() in [&"po", &"mo"]).size() > 0:
					# Assume PO
					return tr(data.text, StringName(translation_key))
				else:
					# Assume CSV
					return tr(translation_key)

	return tr(translation_key)


# Create a line of dialogue
func create_dialogue_line(data: Dictionary, extra_game_states: Array) -> DialogueLine:
	match data.type:
		DMConstants.TYPE_DIALOGUE:
			var resolved_data: DMResolvedLineData = await get_resolved_line_data(data, extra_game_states)
			return DialogueLine.new({
				id = data.get(&"id", ""),
				type = DMConstants.TYPE_DIALOGUE,
				next_id = data.next_id,
				character = await get_resolved_character(data, extra_game_states),
				character_replacements = data.get(&"character_replacements", [] as Array[Dictionary]),
				text = resolved_data.text,
				text_replacements = data.get(&"text_replacements", [] as Array[Dictionary]),
				translation_key = data.get(&"translation_key", data.text),
				speeds = resolved_data.speeds,
				inline_mutations = resolved_data.mutations,
				time = resolved_data.time,
				tags = data.get(&"tags", []),
				extra_game_states = extra_game_states
			})

		DMConstants.TYPE_RESPONSE:
			return DialogueLine.new({
				id = data.get(&"id", ""),
				type = DMConstants.TYPE_RESPONSE,
				next_id = data.next_id,
				tags = data.get(&"tags", []),
				extra_game_states = extra_game_states
			})

		DMConstants.TYPE_MUTATION:
			return DialogueLine.new({
				id = data.get(&"id", ""),
				type = DMConstants.TYPE_MUTATION,
				next_id = data.next_id,
				mutation = data.mutation,
				extra_game_states = extra_game_states
			})

	return null


# Create a response
func create_response(data: Dictionary, extra_game_states: Array) -> DialogueResponse:
	var resolved_data: DMResolvedLineData = await get_resolved_line_data(data, extra_game_states)
	return DialogueResponse.new({
		id = data.get(&"id", ""),
		type = DMConstants.TYPE_RESPONSE,
		next_id = data.next_id,
		is_allowed = data.is_allowed,
		condition_as_text = data.get(&"condition_as_text", ""),
		character = await get_resolved_character(data, extra_game_states),
		character_replacements = data.get(&"character_replacements", [] as Array[Dictionary]),
		text = resolved_data.text,
		text_replacements = data.get(&"text_replacements", [] as Array[Dictionary]),
		tags = data.get(&"tags", []),
		translation_key = data.get(&"translation_key", data.text),
	})


# Get the current game states
func _get_game_states(extra_game_states: Array) -> Array:
	if not _has_loaded_autoloads:
		_has_loaded_autoloads = true
		# Add any autoloads to a generic state so we can refer to them by name
		for child in Engine.get_main_loop().root.get_children():
			# Ignore the dialogue manager
			if child.name == &"DialogueManager": continue
			# Ignore the current main scene
			if Engine.get_main_loop().current_scene and child.name == Engine.get_main_loop().current_scene.name: continue
			# Add the node to our known autoloads
			_autoloads[child.name] = child
		game_states = [_autoloads]
		# Add any other state shortcuts from settings
		for node_name in DMSettings.get_setting(DMSettings.STATE_AUTOLOAD_SHORTCUTS, ""):
			var state: Node = Engine.get_main_loop().root.get_node_or_null(NodePath(node_name))
			if state:
				game_states.append(state)

	var current_scene: Node = get_current_scene.call()
	var unique_states: Array = []
	for state in extra_game_states + [current_scene] + game_states:
		if state != null and not unique_states.has(state):
			unique_states.append(state)
	return unique_states


# Check if a condition is met
func _check_condition(data: Dictionary, extra_game_states: Array) -> bool:
	var result: Variant = await _resolve_condition_value(data, extra_game_states)
	if typeof(result) in [
		TYPE_STRING, TYPE_STRING_NAME, \
		TYPE_DICTIONARY, \
		TYPE_ARRAY, TYPE_PACKED_BYTE_ARRAY, TYPE_PACKED_COLOR_ARRAY, \
		TYPE_PACKED_FLOAT32_ARRAY, TYPE_PACKED_FLOAT64_ARRAY, \
		TYPE_PACKED_INT32_ARRAY, TYPE_PACKED_INT64_ARRAY, \
		TYPE_PACKED_STRING_ARRAY, \
		TYPE_PACKED_VECTOR2_ARRAY, TYPE_PACKED_VECTOR3_ARRAY, TYPE_PACKED_VECTOR4_ARRAY]:
			return (result as String).is_empty()

	if result is Node or result is Resource:
		return is_instance_valid(result)

	return bool(result)


# Resolve a condition's expression value
func _resolve_condition_value(data: Dictionary, extra_game_states: Array) -> Variant:
	if data.get(&"condition", null) == null: return true
	if data.condition.is_empty(): return true

	return await _resolve(data.condition.expression.duplicate(true), extra_game_states)


# Check if a match value matches a case value
func _check_case_value(match_value: Variant, data: Dictionary, extra_game_states: Array) -> bool:
	if data.get(&"condition", null) == null: return true
	if data.condition.is_empty(): return true

	var expression: Array[Dictionary] = data.condition.expression.duplicate(true)

	# Check for multiple values
	var expressions_to_check: Array = []
	var previous_comma_index: int = 0
	for i in range(0, expression.size()):
		if expression[i].type == DMConstants.TOKEN_COMMA:
			expressions_to_check.append(expression.slice(previous_comma_index, i))
			previous_comma_index = i + 1
		elif i == expression.size() - 1:
			expressions_to_check.append(expression.slice(previous_comma_index))

	for expression_to_check in expressions_to_check:
		# If the when is a comparison when insert the match value as the first value to compare to
		var already_compared: bool = false
		if expression_to_check[0].type == DMConstants.TOKEN_COMPARISON:
			expression_to_check.insert(0, {
				type = DMConstants.TOKEN_VALUE,
				value = match_value
			})
			already_compared = true

		var resolved_value = await _resolve(expression_to_check, extra_game_states)
		if already_compared:
			if resolved_value:
				return true
		else:
			if match_value == resolved_value:
				return true

	return false



# Make a change to game state or run a method
func _mutate(mutation: Dictionary, extra_game_states: Array, is_inline_mutation: bool = false) -> void:
	var expression: Array[Dictionary] = mutation.expression

	# Handle built in mutations
	if expression[0].type == DMConstants.TOKEN_FUNCTION and expression[0].function in [&"wait", &"Wait", &"debug", &"Debug"]:
		var args: Array = await _resolve_each(expression[0].value, extra_game_states)
		match expression[0].function:
			&"wait", &"Wait":
				mutated.emit(mutation.merged({ is_inline = is_inline_mutation }))
				if [TYPE_FLOAT, TYPE_INT].has(typeof(args[0])):
					await Engine.get_main_loop().create_timer(float(args[0])).timeout
				else:
					var actions: PackedStringArray = PackedStringArray(args[0] if typeof(args[0]) == TYPE_ARRAY else [args[0]])
					await _wait_for(actions)
				return

			&"debug", &"Debug":
				prints("Debug:", args)
				await Engine.get_main_loop().process_frame

	# Or pass through to the resolver
	else:
		if not _mutation_contains_assignment(mutation.expression) and not is_inline_mutation:
			mutated.emit(mutation.merged({ is_inline = is_inline_mutation }))

		if mutation.get("is_blocking", true):
			await _resolve(mutation.expression.duplicate(true), extra_game_states)
			return
		else:
			_resolve(mutation.expression.duplicate(true), extra_game_states)

	# Wait one frame to give the dialogue handler a chance to yield
	await Engine.get_main_loop().process_frame


# Wait for a given action
func _wait_for(actions: PackedStringArray) -> void:
	var waiter = DMWaiter.new(actions)
	add_child(waiter)
	await waiter.waited
	waiter.queue_free()


# Check if a mutation contains an assignment token.
func _mutation_contains_assignment(mutation: Array) -> bool:
	for token in mutation:
		if token.type == DMConstants.TOKEN_ASSIGNMENT:
			return true
	return false


# Replace an array of line IDs with their response prompts
func _get_responses(ids: Array, resource: DialogueResource, id_trail: String, extra_game_states: Array) -> Array[DialogueResponse]:
	var responses: Array[DialogueResponse] = []
	for id in ids:
		var data: Dictionary = resource.lines.get(id).duplicate(true)
		data.is_allowed = await _check_condition(data, extra_game_states)
		var response: DialogueResponse = await create_response(data, extra_game_states)
		response.next_id = _get_id_with_resource(resource, response.next_id) + id_trail
		responses.append(response)

	return responses


# Get a value on the current scene or game state
func _get_state_value(property: String, extra_game_states: Array):
	# Special case for static primitive calls
	if property == "Color":
		return Color()
	elif property == "Vector2":
		return Vector2.ZERO
	elif property == "Vector3":
		return Vector3.ZERO
	elif property == "Vector4":
		return Vector4.ZERO
	elif property == "Quaternion":
		return Quaternion()

	var expression = Expression.new()
	if expression.parse(property) != OK:
		assert(false, DMConstants.translate(&"runtime.invalid_expression").format({ expression = property, error = expression.get_error_text() }))

	# Warn about possible name collisions
	_warn_about_state_name_collisions(property, extra_game_states)

	for state in _get_game_states(extra_game_states):
		if typeof(state) == TYPE_DICTIONARY:
			if state.has(property):
				return state.get(property)
		else:
			# Try for a C# constant first
			if state.get_script() \
			and state.get_script().resource_path.ends_with(".cs") \
			and _get_dotnet_dialogue_manager().ThingHasConstant(state, property):
				return _get_dotnet_dialogue_manager().ResolveThingConstant(state, property)

			# Otherwise just let Godot try and resolve it.
			var result = expression.execute([], state, false)
			if not expression.has_execute_failed():
				return result

	if include_singletons and Engine.has_singleton(property):
		return Engine.get_singleton(property)

	if include_classes:
		for class_data in ProjectSettings.get_global_class_list():
			if class_data.get(&"class") == property:
				return load(class_data.path)

	show_error_for_missing_state_value(DMConstants.translate(&"runtime.property_not_found").format({ property = property, states = _get_state_shortcut_names(extra_game_states) }))


# Print warnings for top-level state name collisions.
func _warn_about_state_name_collisions(target_key: String, extra_game_states: Array) -> void:
	# Don't run the check if this is a release build
	if not OS.is_debug_build(): return
	# Also don't run if the setting is off
	if not DMSettings.get_setting(DMSettings.WARN_ABOUT_METHOD_PROPERTY_OR_SIGNAL_NAME_CONFLICTS, false): return

	# Get the list of state shortcuts.
	var state_shortcuts: Array = []
	for node_name in DMSettings.get_setting(DMSettings.STATE_AUTOLOAD_SHORTCUTS, ""):
		var state: Node = Engine.get_main_loop().root.get_node_or_null(NodePath(node_name))
		if state:
			state_shortcuts.append(state)

	# Check any top level names for a collision
	var states_with_key: Array = []
	for state in extra_game_states + [get_current_scene.call()] + state_shortcuts:
		if state is Dictionary:
			if state.keys().has(target_key):
				states_with_key.append("Dictionary")
		else:
			var script: Script = (state as Object).get_script()
			if script == null:
				continue

			for method in script.get_script_method_list():
				if method.name == target_key and not states_with_key.has(state.name):
					states_with_key.append(state.name)
					break

			for property in script.get_script_property_list():
				if property.name == target_key and not states_with_key.has(state.name):
					states_with_key.append(state.name)
					break

			for signal_info in script.get_script_signal_list():
				if signal_info.name == target_key and not states_with_key.has(state.name):
					states_with_key.append(state.name)
					break

	if states_with_key.size() > 1:
		push_warning(DMConstants.translate(&"runtime.top_level_states_share_name").format({ states = ", ".join(states_with_key), key = target_key }))


# Set a value on the current scene or game state
func _set_state_value(property: String, value, extra_game_states: Array) -> void:
	for state in _get_game_states(extra_game_states):
		if typeof(state) == TYPE_DICTIONARY:
			if state.has(property):
				state[property] = value
				return
		elif _thing_has_property(state, property):
			state.set(property, value)
			return

	if property.to_snake_case() != property:
		show_error_for_missing_state_value(DMConstants.translate(&"runtime.property_not_found_missing_export").format({ property = property, states = _get_state_shortcut_names(extra_game_states) }))
	else:
		show_error_for_missing_state_value(DMConstants.translate(&"runtime.property_not_found").format({ property = property, states = _get_state_shortcut_names(extra_game_states) }))


# Get the list of state shortcut names
func _get_state_shortcut_names(extra_game_states: Array) -> String:
	var states = _get_game_states(extra_game_states)
	states.erase(_autoloads)
	return ", ".join(states.map(func(s): return "\"%s\"" % (s.name if "name" in s else s)))


# Resolve an array of expressions.
func _resolve_each(array: Array, extra_game_states: Array) -> Array:
	var results: Array = []
	for item in array:
		if not item[0].type in [DMConstants.TOKEN_BRACE_CLOSE, DMConstants.TOKEN_BRACKET_CLOSE, DMConstants.TOKEN_PARENS_CLOSE]:
			results.append(await _resolve(item.duplicate(true), extra_game_states))
	return results


# Collapse any expressions
func _resolve(tokens: Array, extra_game_states: Array):
	var i: int = 0
	var limit: int = 0

	# Handle groups first
	for token in tokens:
		if token.type == DMConstants.TOKEN_GROUP:
			token.type = DMConstants.TOKEN_VALUE
			token.value = await _resolve(token.value, extra_game_states)

	# Then variables/methods
	i = 0
	limit = 0
	while i < tokens.size() and limit < 1000:
		limit += 1
		var token: Dictionary = tokens[i]

		if token.type == DMConstants.TOKEN_NULL_COALESCE:
			var caller: Dictionary = tokens[i - 1]
			if caller.value == null:
				# If the caller is null then the method/property is also null
				caller.type = DMConstants.TOKEN_VALUE
				caller.value = null
				tokens.remove_at(i + 1)
				tokens.remove_at(i)
			else:
				token.type = DMConstants.TOKEN_DOT

		elif token.type == DMConstants.TOKEN_FUNCTION:
			var function_name: String = token.function
			var args = await _resolve_each(token.value, extra_game_states)
			if tokens[i - 1].type == DMConstants.TOKEN_DOT:
				# If we are calling a deeper function then we need to collapse the
				# value into the thing we are calling the function on
				var caller: Dictionary = tokens[i - 2]
				if Builtins.is_supported(caller.value):
					caller.type = DMConstants.TOKEN_VALUE
					caller.value = Builtins.resolve_method(caller.value, function_name, args)
					tokens.remove_at(i)
					tokens.remove_at(i - 1)
					i -= 2
				elif _thing_has_method(caller.value, function_name, args):
					caller.type = DMConstants.TOKEN_VALUE
					caller.value = await _resolve_thing_method(caller.value, function_name, args)
					tokens.remove_at(i)
					tokens.remove_at(i - 1)
					i -= 2
				else:
					show_error_for_missing_state_value(DMConstants.translate(&"runtime.method_not_callable").format({ method = function_name, object = str(caller.value) }))
			else:
				var found: bool = false
				match function_name:
					&"str":
						token.type = DMConstants.TOKEN_VALUE
						token.value = str(args[0])
						found = true
					&"Vector2":
						token.type = DMConstants.TOKEN_VALUE
						token.value = Vector2(args[0], args[1])
						found = true
					&"Vector2i":
						token.type = DMConstants.TOKEN_VALUE
						token.value = Vector2i(args[0], args[1])
						found = true
					&"Vector3":
						token.type = DMConstants.TOKEN_VALUE
						token.value = Vector3(args[0], args[1], args[2])
						found = true
					&"Vector3i":
						token.type = DMConstants.TOKEN_VALUE
						token.value = Vector3i(args[0], args[1], args[2])
						found = true
					&"Vector4":
						token.type = DMConstants.TOKEN_VALUE
						token.value = Vector4(args[0], args[1], args[2], args[3])
						found = true
					&"Vector4i":
						token.type = DMConstants.TOKEN_VALUE
						token.value = Vector4i(args[0], args[1], args[2], args[3])
						found = true
					&"Quaternion":
						token.type = DMConstants.TOKEN_VALUE
						token.value = Quaternion(args[0], args[1], args[2], args[3])
						found = true
					&"Callable":
						token.type = DMConstants.TOKEN_VALUE
						match args.size():
							0:
								token.value = Callable()
							1:
								token.value = Callable(args[0])
							2:
								token.value = Callable(args[0], args[1])
						found = true
					&"Color":
						token.type = DMConstants.TOKEN_VALUE
						match args.size():
							0:
								token.value = Color()
							1:
								token.value = Color(args[0])
							2:
								token.value = Color(args[0], args[1])
							3:
								token.value = Color(args[0], args[1], args[2])
							4:
								token.value = Color(args[0], args[1], args[2], args[3])
						found = true
					&"load", &"Load":
						token.type = DMConstants.TOKEN_VALUE
						token.value = load(args[0])
						found = true
					&"roll_dice", &"RollDice":
						token.type = DMConstants.TOKEN_VALUE
						token.value = randi_range(1, args[0])
						found = true
					_:
						# Check for top level name conflicts
						_warn_about_state_name_collisions(function_name, extra_game_states)

						for state in _get_game_states(extra_game_states):
							if _thing_has_method(state, function_name, args):
								token.type = DMConstants.TOKEN_VALUE
								token.value = await _resolve_thing_method(state, function_name, args)
								found = true
								break

				show_error_for_missing_state_value(DMConstants.translate(&"runtime.method_not_found").format({
					method = args[0] if function_name in ["call", "call_deferred"] else function_name,
					states = _get_state_shortcut_names(extra_game_states)
				}), not found)

		elif token.type == DMConstants.TOKEN_DICTIONARY_REFERENCE:
			var value
			if i > 0 and tokens[i - 1].type == DMConstants.TOKEN_DOT:
				# If we are deep referencing then we need to get the parent object.
				# `parent.value` is the actual object and `token.variable` is the name of
				# the property within it.
				value = tokens[i - 2].value[token.variable]
				# Clean up the previous tokens
				token.erase("variable")
				tokens.remove_at(i - 1)
				tokens.remove_at(i - 2)
				i -= 2
			else:
				# Otherwise we can just get this variable as a normal state reference
				value = _get_state_value(token.variable, extra_game_states)

			var index = await _resolve(token.value, extra_game_states)
			if typeof(value) == TYPE_DICTIONARY:
				if tokens.size() > i + 1 and tokens[i + 1].type == DMConstants.TOKEN_ASSIGNMENT:
					# If the next token is an assignment then we need to leave this as a reference
					# so that it can be resolved once everything ahead of it has been resolved
					token.type = "dictionary"
					token.value = value
					token.key = index
				else:
					if value.has(index):
						token.type = DMConstants.TOKEN_VALUE
						token.value = value[index]
					else:
						show_error_for_missing_state_value(DMConstants.translate(&"runtime.key_not_found").format({ key = str(index), dictionary = token.variable }))
			elif typeof(value) in [TYPE_ARRAY, TYPE_PACKED_STRING_ARRAY, TYPE_PACKED_INT32_ARRAY, TYPE_PACKED_INT64_ARRAY, TYPE_PACKED_BYTE_ARRAY, TYPE_PACKED_COLOR_ARRAY, TYPE_PACKED_FLOAT32_ARRAY, TYPE_PACKED_FLOAT64_ARRAY]:
				if tokens.size() > i + 1 and tokens[i + 1].type == DMConstants.TOKEN_ASSIGNMENT:
					# If the next token is an assignment then we need to leave this as a reference
					# so that it can be resolved once everything ahead of it has been resolved
					token.type = "array"
					token.value = value
					token.key = index
				else:
					if index >= 0 and index < value.size():
						token.type = DMConstants.TOKEN_VALUE
						token.value = value[index]
					else:
						show_error_for_missing_state_value(DMConstants.translate(&"runtime.array_index_out_of_bounds").format({ index = index, array = token.variable }))

		elif token.type == DMConstants.TOKEN_DICTIONARY_NESTED_REFERENCE:
			var dictionary: Dictionary = tokens[i - 1]
			var index = await _resolve(token.value, extra_game_states)
			var value = dictionary.value
			if typeof(value) == TYPE_DICTIONARY:
				if tokens.size() > i + 1 and tokens[i + 1].type == DMConstants.TOKEN_ASSIGNMENT:
					# If the next token is an assignment then we need to leave this as a reference
					# so that it can be resolved once everything ahead of it has been resolved
					dictionary.type = "dictionary"
					dictionary.key = index
					dictionary.value = value
					tokens.remove_at(i)
					i -= 1
				else:
					if dictionary.value.has(index):
						dictionary.value = value.get(index)
						tokens.remove_at(i)
						i -= 1
					else:
						show_error_for_missing_state_value(DMConstants.translate(&"runtime.key_not_found").format({ key = str(index), dictionary = value }))
			elif typeof(value) == TYPE_ARRAY:
				if tokens.size() > i + 1 and tokens[i + 1].type == DMConstants.TOKEN_ASSIGNMENT:
					# If the next token is an assignment then we need to leave this as a reference
					# so that it can be resolved once everything ahead of it has been resolved
					dictionary.type = "array"
					dictionary.value = value
					dictionary.key = index
					tokens.remove_at(i)
					i -= 1
				else:
					if index >= 0 and index < value.size():
						dictionary.value = value[index]
						tokens.remove_at(i)
						i -= 1
					else:
						show_error_for_missing_state_value(DMConstants.translate(&"runtime.array_index_out_of_bounds").format({ index = index, array = value }))

		elif token.type == DMConstants.TOKEN_ARRAY:
			token.type = DMConstants.TOKEN_VALUE
			token.value = await _resolve_each(token.value, extra_game_states)

		elif token.type == DMConstants.TOKEN_DICTIONARY:
			token.type = DMConstants.TOKEN_VALUE
			var dictionary = {}
			for key in token.value.keys():
				var resolved_key = await _resolve([key], extra_game_states)
				var preresolved_value = token.value.get(key)
				if typeof(preresolved_value) != TYPE_ARRAY:
					preresolved_value = [preresolved_value]
				var resolved_value = await _resolve(preresolved_value, extra_game_states)
				dictionary[resolved_key] = resolved_value
			token.value = dictionary

		elif token.type == DMConstants.TOKEN_VARIABLE or token.type == DMConstants.TOKEN_NUMBER:
			if str(token.value) == "null":
				token.type = DMConstants.TOKEN_VALUE
				token.value = null
			elif str(token.value) == "self":
				token.type = DMConstants.TOKEN_VALUE
				token.value = extra_game_states[0].self
			elif tokens[i - 1].type == DMConstants.TOKEN_DOT:
				var caller: Dictionary = tokens[i - 2]
				var property = token.value
				if tokens.size() > i + 1 and tokens[i + 1].type == DMConstants.TOKEN_ASSIGNMENT:
					# If the next token is an assignment then we need to leave this as a reference
					# so that it can be resolved once everything ahead of it has been resolved
					caller.type = "property"
					caller.property = property
				else:
					# If we are requesting a deeper property then we need to collapse the
					# value into the thing we are referencing from
					caller.type = DMConstants.TOKEN_VALUE
					if Builtins.is_supported(caller.value):
						caller.value = Builtins.resolve_property(caller.value, property)
					else:
						caller.value = _resolve_thing_property(caller.value, property)
				tokens.remove_at(i)
				tokens.remove_at(i - 1)
				i -= 2
			elif tokens.size() > i + 1 and tokens[i + 1].type == DMConstants.TOKEN_ASSIGNMENT:
				# It's a normal variable but we will be assigning to it so don't resolve
				# it until everything after it has been resolved
				token.type = "variable"
			else:
				if token.type == DMConstants.TOKEN_NUMBER:
					token.type = DMConstants.TOKEN_VALUE
					token.value = token.value
				else:
					token.type = DMConstants.TOKEN_VALUE
					token.value = _get_state_value(str(token.value), extra_game_states)

		i += 1

	# Then multiply and divide
	i = 0
	limit = 0
	while i < tokens.size() and limit < 1000:
		limit += 1
		var token: Dictionary = tokens[i]
		if token.type == DMConstants.TOKEN_OPERATOR and token.value in ["*", "/", "%"]:
			token.type = DMConstants.TOKEN_VALUE
			token.value = _apply_operation(token.value, tokens[i - 1].value, tokens[i + 1].value)
			tokens.remove_at(i + 1)
			tokens.remove_at(i - 1)
			i -= 1
		i += 1

	if limit >= 1000:
		assert(false, DMConstants.translate(&"runtime.something_went_wrong"))

	# Then addition and subtraction
	i = 0
	limit = 0
	while i < tokens.size() and limit < 1000:
		limit += 1
		var token: Dictionary = tokens[i]
		if token.type == DMConstants.TOKEN_OPERATOR and token.value in ["+", "-"]:
			token.type = DMConstants.TOKEN_VALUE
			token.value = _apply_operation(token.value, tokens[i - 1].value, tokens[i + 1].value)
			tokens.remove_at(i + 1)
			tokens.remove_at(i - 1)
			i -= 1
		i += 1

	if limit >= 1000:
		assert(false, DMConstants.translate(&"runtime.something_went_wrong"))

	# Then negations
	i = 0
	limit = 0
	while i < tokens.size() and limit < 1000:
		limit += 1
		var token: Dictionary = tokens[i]
		if token.type == DMConstants.TOKEN_NOT:
			token.type = DMConstants.TOKEN_VALUE
			token.value = not tokens[i + 1].value
			tokens.remove_at(i + 1)
			i -= 1
		i += 1

	if limit >= 1000:
		assert(false, DMConstants.translate(&"runtime.something_went_wrong"))

	# Then comparisons
	i = 0
	limit = 0
	while i < tokens.size() and limit < 1000:
		limit += 1
		var token: Dictionary = tokens[i]
		if token.type == DMConstants.TOKEN_COMPARISON:
			token.type = DMConstants.TOKEN_VALUE
			token.value = _compare(token.value, tokens[i - 1].value, tokens[i + 1].value)
			tokens.remove_at(i + 1)
			tokens.remove_at(i - 1)
			i -= 1
		i += 1

	if limit >= 1000:
		assert(false, DMConstants.translate(&"runtime.something_went_wrong"))

	# Then and/or
	i = 0
	limit = 0
	while i < tokens.size() and limit < 1000:
		limit += 1
		var token: Dictionary = tokens[i]
		if token.type == DMConstants.TOKEN_AND_OR:
			token.type = DMConstants.TOKEN_VALUE
			token.value = _apply_operation(token.value, tokens[i - 1].value, tokens[i + 1].value)
			tokens.remove_at(i + 1)
			tokens.remove_at(i - 1)
			i -= 1
		i += 1

	if limit >= 1000:
		assert(false, DMConstants.translate(&"runtime.something_went_wrong"))

	# Lastly, resolve any assignments
	i = 0
	limit = 0
	while i < tokens.size() and limit < 1000:
		limit += 1
		var token: Dictionary = tokens[i]
		if token.type == DMConstants.TOKEN_ASSIGNMENT:
			var lhs: Dictionary = tokens[i - 1]
			var value

			match lhs.type:
				&"variable":
					value = _apply_operation(token.value, _get_state_value(lhs.value, extra_game_states), tokens[i + 1].value)
					_set_state_value(lhs.value, value, extra_game_states)
				&"property":
					value = _apply_operation(token.value, lhs.value.get(lhs.property), tokens[i + 1].value)
					if typeof(lhs.value) == TYPE_DICTIONARY:
						lhs.value[lhs.property] = value
					else:
						lhs.value.set(lhs.property, value)
				&"dictionary":
					value = _apply_operation(token.value, lhs.value.get(lhs.key, null), tokens[i + 1].value)
					lhs.value[lhs.key] = value
				&"array":
					show_error_for_missing_state_value(
						DMConstants.translate(&"runtime.array_index_out_of_bounds").format({ index = lhs.key, array = lhs.value }),
						lhs.key >= lhs.value.size()
					)
					value = _apply_operation(token.value, lhs.value[lhs.key], tokens[i + 1].value)
					lhs.value[lhs.key] = value
				_:
					show_error_for_missing_state_value(DMConstants.translate(&"runtime.left_hand_size_cannot_be_assigned_to"))

			token.type = DMConstants.TOKEN_VALUE
			token.value = value
			tokens.remove_at(i + 1)
			tokens.remove_at(i - 1)
			i -= 1
		i += 1

	if limit >= 1000:
		assert(false, DMConstants.translate(&"runtime.something_went_wrong"))

	return tokens[0].value


# Compare two values.
func _compare(operator: String, first_value, second_value) -> bool:
	match operator:
		&"in":
			if first_value == null or second_value == null:
				return false
			else:
				return first_value in second_value
		&"<":
			if first_value == null:
				return true
			elif second_value == null:
				return false
			else:
				return first_value < second_value
		&">":
			if first_value == null:
				return false
			elif second_value == null:
				return true
			else:
				return first_value > second_value
		&"<=":
			if first_value == null:
				return true
			elif second_value == null:
				return false
			else:
				return first_value <= second_value
		&">=":
			if first_value == null:
				return false
			elif second_value == null:
				return true
			else:
				return first_value >= second_value
		&"==":
			if first_value == null:
				if typeof(second_value) == TYPE_BOOL:
					return second_value == false
				else:
					return second_value == null
			else:
				return first_value == second_value
		&"!=":
			if first_value == null:
				if typeof(second_value) == TYPE_BOOL:
					return second_value == true
				else:
					return second_value != null
			else:
				return first_value != second_value

	return false


# Apply an operation from one value to another.
func _apply_operation(operator: String, first_value, second_value):
	match operator:
		&"=":
			return second_value
		&"+", &"+=":
			return first_value + second_value
		&"-", &"-=":
			return first_value - second_value
		&"/", &"/=":
			return first_value / second_value
		&"*", &"*=":
			return first_value * second_value
		&"%":
			return first_value % second_value
		&"and":
			return first_value and second_value
		&"or":
			return first_value or second_value

	assert(false, DMConstants.translate(&"runtime.unknown_operator"))


# Check if a dialogue line contains meaningful information.
func _is_valid(line: DialogueLine) -> bool:
	if line == null:
		return false
	if line.type == DMConstants.TYPE_MUTATION and line.mutation == null:
		return false
	if line.type == DMConstants.TYPE_RESPONSE and line.get(&"responses").size() == 0:
		return false
	return true


# Check that a thing has a given method.
func _thing_has_method(thing, method: String, args: Array) -> bool:
	if not is_instance_valid(thing):
		return false

	if Builtins.is_supported(thing, method):
		return thing != _autoloads
	elif thing is Dictionary:
		return false

	if method in [&"call", &"call_deferred"]:
		return thing.has_method(args[0])

	if method == &"emit_signal":
		return thing.has_signal(args[0])

	if thing.has_method(method):
		return true

	if thing is Script:
		thing = thing.new()
	if thing.get_script() and thing.get_script().resource_path.ends_with(".cs"):
		# If we get this far then the method might be a C# method with a Task return type
		return _get_dotnet_dialogue_manager().ThingHasMethod(thing, method, args)

	return false


# Check if a given property exists
func _thing_has_property(thing: Object, property: String) -> bool:
	if thing == null:
		return false

	for p in thing.get_property_list():
		if _node_properties.has(p.name):
			# Ignore any properties on the base Node
			continue
		if p.name == property:
			return true

	if thing.get_script() and thing.get_script().resource_path.ends_with(".cs"):
		# If we get this far then the property might be a C# constant.
		return _get_dotnet_dialogue_manager().ThingHasConstant(thing, property)

	return false


func _get_method_info_for(thing: Variant, method: String, args: Array) -> Dictionary:
	# Use the thing instance id as a key for the caching dictionary.
	var thing_instance_id: int = thing.get_instance_id()
	if not _method_info_cache.has(thing_instance_id):
		var methods: Dictionary = {}
		for m in thing.get_method_list():
			methods["%s:%d" % [m.name, m.args.size()]] = m
			if not methods.has(m.name):
				methods[m.name] = m
		_method_info_cache[thing_instance_id] = methods

	var methods: Dictionary = _method_info_cache.get(thing_instance_id, {})
	var method_key: String = "%s:%d" % [method, args.size()]
	if methods.has(method_key):
		return methods.get(method_key)
	elif methods.has(method):
		return methods.get(method)
	else:
		return _get_method_info_for(thing.new(), method, args)


func _resolve_thing_method(thing, method: String, args: Array):
	if Builtins.is_supported(thing):
		var result = Builtins.resolve_method(thing, method, args)
		if not Builtins.has_resolve_method_failed():
			return result

	if thing.has_method(method):
		# Try to convert any literals to the right type
		var method_info: Dictionary = _get_method_info_for(thing, method, args)
		var method_args: Array = method_info.args
		if method_info.flags & METHOD_FLAG_VARARG == 0 and method_args.size() < args.size():
			assert(false, DMConstants.translate(&"runtime.expected_n_got_n_args").format({ expected = method_args.size(), method = method, received = args.size()}))
		for i in range(0, min(method_args.size(), args.size())):
			var m: Dictionary = method_args[i]
			var to_type: int = typeof(args[i])
			if m.type == TYPE_ARRAY:
				match m.hint_string:
					&"String":
						to_type = TYPE_PACKED_STRING_ARRAY
					&"int":
						to_type = TYPE_PACKED_INT64_ARRAY
					&"float":
						to_type = TYPE_PACKED_FLOAT64_ARRAY
					&"Vector2":
						to_type = TYPE_PACKED_VECTOR2_ARRAY
					&"Vector3":
						to_type = TYPE_PACKED_VECTOR3_ARRAY
					_:
						if m.hint_string != "":
							assert(false, DMConstants.translate(&"runtime.unsupported_array_type").format({ type = m.hint_string}))
			if typeof(args[i]) != to_type:
				args[i] = convert(args[i], to_type)

		return await thing.callv(method, args)

	# If we get here then it's probably a C# method with a Task return type
	if thing is Script:
		thing = thing.new()
	var dotnet_dialogue_manager = _get_dotnet_dialogue_manager()
	dotnet_dialogue_manager.ResolveThingMethod(thing, method, args)
	return await dotnet_dialogue_manager.Resolved


func _resolve_thing_property(thing: Object, property: String) -> Variant:
	if thing == null:
		return false

	if thing.get_script() and thing.get_script().resource_path.ends_with(".cs"):
		# If we get this far then the property might be a C# constant.
		return _get_dotnet_dialogue_manager().ResolveThingConstant(thing, property)

	return thing.get(property)


func _get_resource_uid(resource: DialogueResource) -> String:
	return ResourceUID.id_to_text(ResourceLoader.get_resource_uid(resource.resource_path)).replace("uid://", "")


func _get_id_with_resource(resource: DialogueResource, id: String) -> String:
	return id if "@" in id else "%s@%s" % [_get_resource_uid(resource), id]
```

## File: addons/dialogue_manager/dialogue_manager.gd.uid
```
uid://c3rodes2l3gxb
```

## File: addons/dialogue_manager/dialogue_processor.gd
```
class_name DMDialogueProcessor extends RefCounted


## Override to modify the incoming raw string.
func _preprocess_line(raw_line: String) -> String:
	return raw_line


## Override to modify the outgoing dialogue line.
func _process_line(line: DMCompiledLine) -> void:
	pass
```

## File: addons/dialogue_manager/dialogue_processor.gd.uid
```
uid://m3b28rmso14t
```

## File: addons/dialogue_manager/dialogue_resource.gd
```
@tool
@icon("./assets/icon.svg")

## A collection of dialogue lines for use with [code]DialogueManager[/code].
class_name DialogueResource extends Resource


const DialogueLine = preload("./dialogue_line.gd")

## A list of state shortcuts
@export var using_states: PackedStringArray = []

## A map of titles and the lines they point to.
@export var titles: Dictionary = {}

## A list of character names.
@export var character_names: PackedStringArray = []

## The first title in the file.
@export var first_title: String = ""

## A map of the encoded lines of dialogue.
@export var lines: Dictionary = {}

## raw version of the text
@export var raw_text: String


## Get the next printable line of dialogue, starting from a referenced line ([code]title[/code] can
## be a title string or a stringified line number). Runs any mutations along the way and then returns
## the first dialogue line encountered.
func get_next_dialogue_line(title: String = "", extra_game_states: Array = [], mutation_behaviour: DMConstants.MutationBehaviour = DMConstants.MutationBehaviour.Wait) -> DialogueLine:
	return await Engine.get_singleton("DialogueManager").get_next_dialogue_line(self, title, extra_game_states, mutation_behaviour)


## Get the list of any titles found in the file.
func get_titles() -> PackedStringArray:
	return titles.keys()


func _to_string() -> String:
	if resource_path:
		return "<DialogueResource path=\"%s\">" % [resource_path]
	else:
		return "<DialogueResource>"
```

## File: addons/dialogue_manager/dialogue_resource.gd.uid
```
uid://dbs4435dsf3ry
```

## File: addons/dialogue_manager/dialogue_response.gd
```
## A response to a line of dialogue, usualy attached to a [code]DialogueLine[/code].
class_name DialogueResponse extends RefCounted


## The ID of this response
var id: String

## The internal type of this dialogue object, always set to [code]TYPE_RESPONSE[/code].
var type: String = DMConstants.TYPE_RESPONSE

## The next line ID to use if this response is selected by the player.
var next_id: String = ""

## [code]true[/code] if the condition of this line was met.
var is_allowed: bool = true

## The original condition text.
var condition_as_text: String = ""

## A character (depending on the "characters in responses" behaviour setting).
var character: String = ""

## A dictionary of varialbe replaces for the character name. Generally for internal use only.
var character_replacements: Array[Dictionary] = []

## The prompt for this response.
var text: String = ""

## A dictionary of variable replaces for the text. Generally for internal use only.
var text_replacements: Array[Dictionary] = []

## Any #tags
var tags: PackedStringArray = []

## The key to use for translating the text.
var translation_key: String = ""


func _init(data: Dictionary = {}) -> void:
	if data.size() > 0:
		id = data.id
		type = data.type
		next_id = data.next_id
		is_allowed = data.is_allowed
		character = data.character
		character_replacements = data.character_replacements
		text = data.text
		text_replacements = data.text_replacements
		tags = data.tags
		translation_key = data.translation_key
		condition_as_text = data.condition_as_text


func _to_string() -> String:
	return "<DialogueResponse text=\"%s\">" % text


func get_tag_value(tag_name: String) -> String:
	var wrapped := "%s=" % tag_name
	for t in tags:
		if t.begins_with(wrapped):
			return t.replace(wrapped, "").strip_edges()
	return ""
```

## File: addons/dialogue_manager/dialogue_response.gd.uid
```
uid://cm0xpfeywpqid
```

## File: addons/dialogue_manager/dialogue_responses_menu.gd
```
@icon("./assets/responses_menu.svg")

## A [Container] for dialogue responses provided by [b]Dialogue Manager[/b].
class_name DialogueResponsesMenu extends Container


## Emitted when a response is focused.
signal response_focused(response: Control)

## Emitted when a response is selected.
signal response_selected(response: Control)


## Optionally specify a control to duplicate for each response
@export var response_template: Control

## The action for accepting a response (is possibly overridden by parent dialogue balloon).
@export var next_action: StringName = &""

## Automatically set up focus neighbours when the responses list changes.
@export var auto_configure_focus: bool = true

## Automatically focus the first item when showing.
@export var auto_focus_first_item: bool = true

## Hide any responses where [code]is_allowed[/code] is false
@export var hide_failed_responses: bool = false

## The list of dialogue responses.
var responses: Array = []:
	set(value):
		responses = value
		_apply_responses()
	get:
		return responses

# The previously focused item in this menu.
var _previously_focused_item: Control = null


func _ready() -> void:
	visibility_changed.connect(func():
		if auto_focus_first_item and visible and get_menu_items().size() > 0:
			var first_item: Control = get_menu_items()[0]
			if first_item.is_inside_tree():
				first_item.grab_focus()
	)

	if is_instance_valid(response_template):
		response_template.hide()

	get_viewport().gui_focus_changed.connect(_on_focus_changed)


## Get the selectable items in the menu.
func get_menu_items() -> Array:
	var items: Array = []
	for child in get_children():
		if not child.visible: continue
		if "Disallowed" in child.name: continue
		items.append(child)

	return items


## Prepare the menu for keyboard and mouse navigation.
func configure_focus() -> void:
	var items = get_menu_items()
	for i in items.size():
		var item: Control = items[i]

		item.focus_mode = Control.FOCUS_ALL

		item.focus_neighbor_left = item.get_path()
		item.focus_neighbor_right = item.get_path()

		if i == 0:
			item.focus_neighbor_top = item.get_path()
			item.focus_neighbor_left = item.get_path()
			item.focus_previous = item.get_path()
		else:
			item.focus_neighbor_top = items[i - 1].get_path()
			item.focus_neighbor_left = items[i - 1].get_path()
			item.focus_previous = items[i - 1].get_path()

		if i == items.size() - 1:
			item.focus_neighbor_bottom = item.get_path()
			item.focus_neighbor_right = item.get_path()
			item.focus_next = item.get_path()
		else:
			item.focus_neighbor_bottom = items[i + 1].get_path()
			item.focus_neighbor_right = items[i + 1].get_path()
			item.focus_next = items[i + 1].get_path()

		item.mouse_entered.connect(_on_response_mouse_entered.bind(item))
		item.gui_input.connect(_on_response_gui_input.bind(item, item.get_meta("response")))

	_previously_focused_item = items[0]

	if auto_focus_first_item:
		items[0].grab_focus()


#region Internal


# Set up the visual side of things.
func _apply_responses() -> void:
	# Remove any current items
	for item in get_children():
		if item == response_template: continue

		remove_child(item)
		item.queue_free()

	# Add new items
	if responses.size() > 0:
		for response in responses:
			if hide_failed_responses and not response.is_allowed: continue

			var item: Control
			if is_instance_valid(response_template):
				item = response_template.duplicate(DUPLICATE_GROUPS | DUPLICATE_SCRIPTS | DUPLICATE_SIGNALS)
				item.show()
			else:
				item = Button.new()
			item.name = "Response%d" % get_child_count()
			if not response.is_allowed:
				item.name = item.name + &"Disallowed"
				item.disabled = true

			# If the item has a response property then use that
			if "response" in item:
				item.response = response
			# Otherwise assume we can just set the text
			else:
				item.text = response.text

			item.set_meta("response", response)

			add_child(item)

		if auto_configure_focus:
			configure_focus()


#endregion

#region Signals


func _on_focus_changed(control: Control) -> void:
	if "Disallowed" in control.name: return
	if not control in get_menu_items(): return

	if _previously_focused_item != control:
		_previously_focused_item = control
		response_focused.emit(control)


func _on_response_mouse_entered(item: Control) -> void:
	if "Disallowed" in item.name: return

	item.grab_focus()


func _on_response_gui_input(event: InputEvent, item: Control, response) -> void:
	if "Disallowed" in item.name: return

	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		get_viewport().set_input_as_handled()
		response_selected.emit(response)
	elif event.is_action_pressed(&"ui_accept" if next_action.is_empty() else next_action) and item in get_menu_items():
		get_viewport().set_input_as_handled()
		response_selected.emit(response)


#endregion
```

## File: addons/dialogue_manager/dialogue_responses_menu.gd.uid
```
uid://bb52rsfwhkxbn
```

## File: addons/dialogue_manager/DialogueManager.cs
```csharp
using Godot;
using Godot.Collections;
using System;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

#nullable enable

namespace DialogueManagerRuntime
{

    public enum MutationBehaviour
    {
        Wait,
        DoNotWait,
        Skip
    }

    public enum TranslationSource
    {
        None,
        Guess,
        CSV,
        PO
    }

    public partial class DialogueManager : RefCounted
    {
        public delegate void DialogueStartedEventHandler(Resource dialogueResource);
        public delegate void PassedTitleEventHandler(string title);
        public delegate void GotDialogueEventHandler(DialogueLine dialogueLine);
        public delegate void MutatedEventHandler(Dictionary mutation);
        public delegate void DialogueEndedEventHandler(Resource dialogueResource);

        public static DialogueStartedEventHandler? DialogueStarted;
        public static PassedTitleEventHandler? PassedTitle;
        public static GotDialogueEventHandler? GotDialogue;
        public static MutatedEventHandler? Mutated;
        public static DialogueEndedEventHandler? DialogueEnded;

        [Signal] public delegate void ResolvedEventHandler(Variant value);

        private static Random random = new Random();

        private static GodotObject? instance;
        public static GodotObject Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = Engine.GetSingleton("DialogueManager");
                    instance.Connect("dialogue_started", Callable.From((Resource dialogueResource) => DialogueStarted?.Invoke(dialogueResource)));
                    instance.Connect("passed_title", Callable.From((string title) => PassedTitle?.Invoke(title)));
                    instance.Connect("got_dialogue", Callable.From((RefCounted line) => GotDialogue?.Invoke(new DialogueLine(line))));
                    instance.Connect("mutated", Callable.From((Dictionary mutation) => Mutated?.Invoke(mutation)));
                    instance.Connect("dialogue_ended", Callable.From((Resource dialogueResource) => DialogueEnded?.Invoke(dialogueResource)));
                }
                return instance;
            }
        }


        public static Godot.Collections.Array GameStates
        {
            get => (Godot.Collections.Array)Instance.Get("game_states");
            set => Instance.Set("game_states", value);
        }


        public static bool IncludeSingletons
        {
            get => (bool)Instance.Get("include_singletons");
            set => Instance.Set("include_singletons", value);
        }


        public static bool IncludeClasses
        {
            get => (bool)Instance.Get("include_classes");
            set => Instance.Set("include_classes", value);
        }


        public static TranslationSource TranslationSource
        {
            get => (TranslationSource)(int)Instance.Get("translation_source");
            set => Instance.Set("translation_source", (int)value);
        }


        public static Func<Node> GetCurrentScene
        {
            set => Instance.Set("get_current_scene", Callable.From(value));
        }

        public static Resource CreateResourceFromText(string text)
        {
            return (Resource)Instance.Call("create_resource_from_text", text);
        }

        public static async Task<DialogueLine?> GetNextDialogueLine(Resource dialogueResource, string key = "", Array<Variant>? extraGameStates = null, MutationBehaviour mutation_behaviour = MutationBehaviour.Wait)
        {
            int id = random.Next();
            Instance.Call("_bridge_get_next_dialogue_line", id, dialogueResource, key, extraGameStates ?? new Array<Variant>(), (int)mutation_behaviour);
            while (true)
            {
                var result = await Instance.ToSignal(Instance, "bridge_get_next_dialogue_line_completed");
                if ((int)result[0] == id)
                {
                    return ((RefCounted)result[1] == null) ? null : new DialogueLine((RefCounted)result[1]);
                }
            }
        }

        public static async Task<DialogueLine?> GetLine(Resource dialogueResource, string key = "", Array<Variant>? extraGameStates = null)
        {
            int id = random.Next();
            Instance.Call("_bridge_get_line", id, dialogueResource, key, extraGameStates ?? new Array<Variant>());
            while (true)
            {
                var result = await Instance.ToSignal(Instance, "bridge_get_line_completed");
                if ((int)result[0] == id)
                {
                    return ((RefCounted)result[0] == null) ? null : new DialogueLine((RefCounted)result[0]);
                }
            }
        }


        public static CanvasLayer ShowExampleDialogueBalloon(Resource dialogueResource, string key = "", Array<Variant>? extraGameStates = null)
        {
            return (CanvasLayer)Instance.Call("show_example_dialogue_balloon", dialogueResource, key, extraGameStates ?? new Array<Variant>());
        }


        public static Node ShowDialogueBalloonScene(string balloonScene, Resource dialogueResource, string key = "", Array<Variant>? extraGameStates = null)
        {
            return (Node)Instance.Call("show_dialogue_balloon_scene", balloonScene, dialogueResource, key, extraGameStates ?? new Array<Variant>());
        }

        public static Node ShowDialogueBalloonScene(PackedScene balloonScene, Resource dialogueResource, string key = "", Array<Variant>? extraGameStates = null)
        {
            return (Node)Instance.Call("show_dialogue_balloon_scene", balloonScene, dialogueResource, key, extraGameStates ?? new Array<Variant>());
        }

        public static Node ShowDialogueBalloonScene(Node balloonScene, Resource dialogueResource, string key = "", Array<Variant>? extraGameStates = null)
        {
            return (Node)Instance.Call("show_dialogue_balloon_scene", balloonScene, dialogueResource, key, extraGameStates ?? new Array<Variant>());
        }


        public static Node ShowDialogueBalloon(Resource dialogueResource, string key = "", Array<Variant>? extraGameStates = null)
        {
            return (Node)Instance.Call("show_dialogue_balloon", dialogueResource, key, extraGameStates ?? new Array<Variant>());
        }


        public static Array<string> StaticIdToLineIds(Resource dialogueResource, string staticId)
        {
            return (Array<string>)Instance.Call("static_id_to_line_ids", dialogueResource, staticId);
        }


        public static string StaticIdToLineId(Resource dialogueResource, string staticId)
        {
            return (string)Instance.Call("static_id_to_line_id", dialogueResource, staticId);
        }


        public static async void Mutate(Dictionary mutation, Array<Variant>? extraGameStates = null, bool isInlineMutation = false)
        {
            int id = random.Next();
            Instance.Call("_bridge_mutate", id, mutation, extraGameStates ?? new Array<Variant>(), isInlineMutation);
            while (true)
            {
                var result = await Instance.ToSignal(Instance, "bridge_mutated");
                if ((int)result[0] == id)
                {
                    return;
                }
            }
        }


        public static Array<Dictionary> GetMembersForScript(Script script)
        {
            Array<Dictionary> members = new Array<Dictionary>();

            string typeName = script.ResourcePath.GetFile().GetBaseName();
            var matchingTypes = Assembly.GetExecutingAssembly().GetTypes().Where(t => t.Name == typeName);
            foreach (var matchingType in matchingTypes)
            {
                var memberInfos = matchingType.GetMembers(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.DeclaredOnly);
                foreach (var memberInfo in memberInfos)
                {
                    string type;
                    switch (memberInfo.MemberType)
                    {
                        case MemberTypes.Field:
                            FieldInfo fieldInfo = memberInfo as FieldInfo;

                            if (fieldInfo.FieldType.ToString().Contains("EventHandler"))
                            {
                                type = "signal";
                            }
                            else if (fieldInfo.IsLiteral)
                            {
                                type = "constant";
                            }
                            else
                            {
                                type = "property";
                            }
                            break;
                        case MemberTypes.Method:
                            type = "method";
                            break;

                        case MemberTypes.NestedType:
                            type = "constant";
                            break;

                        default:
                            continue;
                    }

                    members.Add(new Dictionary() {
                        { "name", memberInfo.Name },
                        { "type", type }
                    });
                }
            }

            return members;
        }


        public bool ThingHasConstant(GodotObject thing, string property)
        {
            var memberInfos = thing.GetType().GetMember(property, BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.DeclaredOnly);
            return memberInfos.Length > 0;
        }


        public Variant ResolveThingConstant(GodotObject thing, string property)
        {
            var memberInfos = thing.GetType().GetMember(property, BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.DeclaredOnly);
            foreach (var memberInfo in memberInfos)
            {
                if (memberInfo != null)
                {
                    try
                    {
                        switch (memberInfo.MemberType)
                        {
                            case MemberTypes.Field:
                                return ConvertValueToVariant((memberInfo as FieldInfo).GetValue(thing));

                            case MemberTypes.Property:
                                return ConvertValueToVariant((memberInfo as PropertyInfo).GetValue(thing));

                            case MemberTypes.NestedType:
                                var type = thing.GetType().GetNestedType(property);
                                if (type.IsEnum)
                                {
                                    return GetEnumAsDictionary(type);
                                }
                                break;

                            default:
                                continue;
                        }
                    }
                    catch (Exception e)
                    {
                        throw new Exception($"{property} is not supported by Variant.");
                    }
                }
            }

            throw new Exception($"{property} is not a public constant on {thing}");
        }


        Dictionary GetEnumAsDictionary(Type enumType)
        {
            Dictionary dictionary = new Dictionary();
            foreach (var value in enumType.GetEnumValuesAsUnderlyingType())
            {
                var key = enumType.GetEnumName(value);
                if (key != null)
                {
                    dictionary.Add(key, ConvertValueToVariant(value));
                }
            }
            return dictionary;
        }


        Variant ConvertValueToVariant(object value)
        {
            if (value == null) return default;

            Type rawType = value.GetType();
            if (rawType.IsEnum)
            {
                var values = GetEnumAsDictionary(rawType);
                value = values[value.ToString()];
            }

            return value switch
            {
                Variant v => v,
                bool v => Variant.From(v),
                byte v => Variant.From((long)v),
                sbyte v => Variant.From((long)v),
                short v => Variant.From((long)v),
                ushort v => Variant.From((long)v),
                int v => Variant.From((long)v),
                uint v => Variant.From((long)v),
                long v => Variant.From(v),
                ulong v => Variant.From((long)v),
                float v => Variant.From((double)v),
                double v => Variant.From(v),
                string v => Variant.From(v),
                GodotObject godotObj => Variant.From(godotObj),
                _ => default
            };
        }


        public bool ThingHasMethod(GodotObject thing, string method, Array<Variant> args)
        {
            var methodInfos = thing.GetType().GetMethods(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.DeclaredOnly);
            foreach (var methodInfo in methodInfos)
            {
                if (methodInfo.Name == method && args.Count >= methodInfo.GetParameters().Where(p => !p.HasDefaultValue).Count())
                {
                    return true;
                }
            }

            return false;
        }


        public async void ResolveThingMethod(GodotObject thing, string method, Array<Variant> args)
        {
            MethodInfo? info = null;
            var methodInfos = thing.GetType().GetMethods(BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.DeclaredOnly);
            foreach (var methodInfo in methodInfos)
            {
                if (methodInfo.Name == method && args.Count >= methodInfo.GetParameters().Where(p => !p.HasDefaultValue).Count())
                {
                    info = methodInfo;
                }
            }

            if (info == null) return;

#nullable disable
            // Convert the method args to something reflection can handle
            ParameterInfo[] argTypes = info.GetParameters();
            object[] _args = new object[argTypes.Length];
            for (int i = 0; i < argTypes.Length; i++)
            {
                // check if args is assignable from derived type
                if (i < args.Count && args[i].Obj != null)
                {
                    if (argTypes[i].ParameterType.IsAssignableFrom(args[i].Obj.GetType()))
                    {
                        _args[i] = args[i].Obj;
                    }
                    // fallback to assigning primitive types
                    else
                    {
                        _args[i] = Convert.ChangeType(args[i].Obj, argTypes[i].ParameterType);
                    }
                }
                else if (argTypes[i].DefaultValue != null)
                {
                    _args[i] = argTypes[i].DefaultValue;
                }
            }

            // Add a single frame wait in case the method returns before signals can listen
            await ToSignal(Engine.GetMainLoop(), SceneTree.SignalName.ProcessFrame);

            // invoke method and handle the result based on return type
            object result = info.Invoke(thing, _args);

            if (result is Task taskResult)
            {
                await taskResult;
                try
                {
                    object value = taskResult.GetType().GetProperty("Result").GetValue(taskResult);
                    EmitSignal(SignalName.Resolved, ConvertValueToVariant(value));
                }
                catch (Exception)
                {
                    EmitSignal(SignalName.Resolved);
                }
            }
            else
            {
                EmitSignal(SignalName.Resolved, ConvertValueToVariant(result));
            }
        }
#nullable enable


        public static string GetErrorMessage(int error)
        {
            return (string)Instance.Call("_bridge_get_error_message", error);
        }
    }


    public partial class DialogueLine : RefCounted
    {
        private string id = "";
        public string Id
        {
            get => id;
            set => id = value;
        }

        private string type = "dialogue";
        public string Type
        {
            get => type;
            set => type = value;
        }

        private string next_id = "";
        public string NextId
        {
            get => next_id;
            set => next_id = value;
        }

        private string character = "";
        public string Character
        {
            get => character;
            set => character = value;
        }

        private string text = "";
        public string Text
        {
            get => text;
            set => text = value;
        }

        private string translation_key = "";
        public string TranslationKey
        {
            get => translation_key;
            set => translation_key = value;
        }

        private Array<DialogueResponse> responses = new Array<DialogueResponse>();
        public Array<DialogueResponse> Responses
        {
            get => responses;
        }

        private string? time = null;
        public string? Time
        {
            get => time;
        }

        private Dictionary speeds = new Dictionary();
        public Dictionary Speeds
        {
            get => speeds;
        }

        private Array<Godot.Collections.Array> inline_mutations = new Array<Godot.Collections.Array>();
        public Array<Godot.Collections.Array> InlineMutations
        {
            get => inline_mutations;
        }

        private Array<DialogueLine> concurrent_lines = new Array<DialogueLine>();
        public Array<DialogueLine> ConcurrentLines
        {
            get => concurrent_lines;
        }

        private Array<Variant> extra_game_states = new Array<Variant>();
        public Array<Variant> ExtraGameStates
        {
            get => extra_game_states;
        }

        private Array<string> tags = new Array<string>();
        public Array<string> Tags
        {
            get => tags;
        }

        public DialogueLine(RefCounted data)
        {
            id = (string)data.Get("id");
            type = (string)data.Get("type");
            next_id = (string)data.Get("next_id");
            character = (string)data.Get("character");
            text = (string)data.Get("text");
            translation_key = (string)data.Get("translation_key");
            speeds = (Dictionary)data.Get("speeds");
            inline_mutations = (Array<Godot.Collections.Array>)data.Get("inline_mutations");
            time = (string)data.Get("time");
            tags = (Array<string>)data.Get("tags");

            foreach (var concurrent_line_data in (Array<RefCounted>)data.Get("concurrent_lines"))
            {
                concurrent_lines.Add(new DialogueLine(concurrent_line_data));
            }

            foreach (var response in (Array<RefCounted>)data.Get("responses"))
            {
                responses.Add(new DialogueResponse(response));
            }
        }


        public bool HasTag(string tagName)
        {
            string wrapped = $"{tagName}=";
            foreach (var tag in tags)
            {
                if (tag.StartsWith(wrapped))
                {
                    return true;
                }
            }
            return false;
        }


        public string GetTagValue(string tagName)
        {
            string wrapped = $"{tagName}=";
            foreach (var tag in tags)
            {
                if (tag.StartsWith(wrapped))
                {
                    return tag.Substring(wrapped.Length);
                }
            }
            return "";
        }

        public override string ToString()
        {
            switch (type)
            {
                case "dialogue":
                    return $"<DialogueLine character=\"{character}\" text=\"{text}\">";
                case "mutation":
                    return "<DialogueLine mutation>";
                default:
                    return "";
            }
        }
    }


    public partial class DialogueResponse : RefCounted
    {
        private string next_id = "";
        public string NextId
        {
            get => next_id;
            set => next_id = value;
        }

        private bool is_allowed = true;
        public bool IsAllowed
        {
            get => is_allowed;
            set => is_allowed = value;
        }

        private string condition_as_text = "";
        public string ConditionAsText
        {
            get => condition_as_text;
            set => condition_as_text = value;
        }

        private string text = "";
        public string Text
        {
            get => text;
            set => text = value;
        }

        private string translation_key = "";
        public string TranslationKey
        {
            get => translation_key;
            set => translation_key = value;
        }

        private Array<string> tags = new Array<string>();
        public Array<string> Tags
        {
            get => tags;
        }

        public DialogueResponse(RefCounted data)
        {
            next_id = (string)data.Get("next_id");
            is_allowed = (bool)data.Get("is_allowed");
            text = (string)data.Get("text");
            translation_key = (string)data.Get("translation_key");
            tags = (Array<string>)data.Get("tags");
        }

        public string GetTagValue(string tagName)
        {
            string wrapped = $"{tagName}=";
            foreach (var tag in tags)
            {
                if (tag.StartsWith(wrapped))
                {
                    return tag.Substring(wrapped.Length);
                }
            }
            return "";
        }

        public override string ToString()
        {
            return $"<DialogueResponse text=\"{text}\"";
        }
    }
}
```

## File: addons/dialogue_manager/DialogueManager.cs.uid
```
uid://c4c5lsrwy3opj
```

## File: addons/dialogue_manager/editor_translation_parser_plugin.gd
```
class_name DMTranslationParserPlugin extends EditorTranslationParserPlugin


## Cached result of parsing a dialogue file.
var data: DMCompilerResult
## List of characters that were added.
var translated_character_names: PackedStringArray = []
var translated_lines: Array[Dictionary] = []


func _parse_file(path: String) -> Array[PackedStringArray]:
	var msgs: Array[PackedStringArray] = []
	var file: FileAccess = FileAccess.open(path, FileAccess.READ)
	var text: String = file.get_as_text()

	data = DMCompiler.compile_string(text, path)

	var known_keys: PackedStringArray = PackedStringArray([])

	# Add all character names if settings ask for it
	if DMSettings.get_setting(DMSettings.INCLUDE_CHARACTERS_IN_TRANSLATABLE_STRINGS_LIST, true):
		translated_character_names = [] as Array[DialogueLine]
		for character_name: String in data.character_names:
			if character_name in known_keys: continue

			known_keys.append(character_name)

			translated_character_names.append(character_name)
			msgs.append(PackedStringArray([character_name.replace('"', '\"'), "dialogue", "", DMConstants.translate("translation_plugin.character_name")]))

	# Add all dialogue lines and responses
	var dialogue: Dictionary = data.lines
	for key: String in dialogue.keys():
		var line: Dictionary = dialogue.get(key)

		if not line.type in [DMConstants.TYPE_DIALOGUE, DMConstants.TYPE_RESPONSE]: continue

		var translation_key: String = line.get(&"translation_key", line.text)

		if translation_key in known_keys: continue

		known_keys.append(translation_key)
		translated_lines.append(line)
		if translation_key == line.text:
			msgs.append(PackedStringArray([line.text.replace('"', '\"'), "", "", line.get("notes", "")]))
		else:
			msgs.append(PackedStringArray([line.text.replace('"', '\"'), line.translation_key.replace('"', '\"'), "", line.get("notes", "")]))

	return msgs


func _get_recognized_extensions() -> PackedStringArray:
	return ["dialogue"]
```

## File: addons/dialogue_manager/editor_translation_parser_plugin.gd.uid
```
uid://c6bya881h1egb
```

## File: addons/dialogue_manager/export_plugin.gd
```
class_name DMExportPlugin extends EditorExportPlugin

const IGNORED_PATHS = [
	"/assets",
	"/components",
	"/views",
	"inspector_plugin",
	"test_scene"
]


func _get_name() -> String:
	return "Dialogue Manager Export Plugin"


func _export_file(path: String, type: String, features: PackedStringArray) -> void:
	var plugin_path: String = DMPlugin.get_plugin_path()

	# Ignore any editor stuff
	for ignored_path: String in IGNORED_PATHS:
		if path.begins_with(plugin_path + ignored_path):
			skip()

	# Ignore C# stuff it not using dotnet
	if path.begins_with(plugin_path) and not DMSettings.check_for_dotnet_solution() and path.ends_with(".cs"):
		skip()
```

## File: addons/dialogue_manager/export_plugin.gd.uid
```
uid://sa55ra11ji2q
```

## File: addons/dialogue_manager/import_plugin.gd
```
@tool
class_name DMImportPlugin extends EditorImportPlugin


signal compiled_resource(resource: Resource)


const COMPILER_VERSION = 15


func _get_importer_name() -> String:
	return "dialogue_manager"


func _get_format_version() -> int:
	return COMPILER_VERSION


func _get_visible_name() -> String:
	return "Dialogue"


func _get_import_order() -> int:
	return -1000


func _get_priority() -> float:
	return 1000.0


func _get_resource_type():
	return "Resource"


func _get_recognized_extensions() -> PackedStringArray:
	return PackedStringArray(["dialogue"])


func _get_save_extension():
	return "tres"


func _get_preset_count() -> int:
	return 0


func _get_preset_name(preset_index: int) -> String:
	return "Unknown"


func _get_import_options(path: String, preset_index: int) -> Array:
	# When the options array is empty there is a misleading error on export
	# that actually means nothing so let's just have an invisible option.
	return [{
		name = "defaults",
		default_value = true
	}]


func _get_option_visibility(path: String, option_name: StringName, options: Dictionary) -> bool:
	return false


func _import(source_file: String, save_path: String, options: Dictionary, platform_variants: Array[String], gen_files: Array[String]) -> Error:
	# Get the raw file contents
	if not FileAccess.file_exists(source_file): return ERR_FILE_NOT_FOUND

	var file: FileAccess = FileAccess.open(source_file, FileAccess.READ)
	var raw_text: String = file.get_as_text()

	DMPlugin.instance.cache_file_content_changed.emit(source_file, raw_text)

	# Compile the text
	var result: DMCompilerResult = DMCompiler.compile_string(raw_text, source_file)
	if result.errors.size() > 0:
		printerr("%d errors found in %s" % [result.errors.size(), source_file])
		DMCache.add_errors_to_file(source_file, result.errors)
		return OK

	# Get the current addon version
	var config: ConfigFile = ConfigFile.new()
	config.load("res://addons/dialogue_manager/plugin.cfg")
	var version: String = config.get_value("plugin", "version")

	# Save the results to a resource
	var resource: DialogueResource = DialogueResource.new()
	resource.set_meta("dialogue_manager_version", version)

	resource.using_states = result.using_states
	resource.titles = result.titles
	resource.first_title = result.first_title
	resource.character_names = result.character_names
	resource.lines = result.lines
	resource.raw_text = result.raw_text

	# Clear errors and possibly trigger any cascade recompiles
	DMCache.add_file(source_file, result)

	var err: Error = ResourceSaver.save(resource, "%s.%s" % [save_path, _get_save_extension()])

	compiled_resource.emit(resource)

	# Recompile any dependencies
	var dependent_paths: PackedStringArray = DMCache.get_dependent_paths_for_reimport(source_file)
	for path in dependent_paths:
		append_import_external_resource(path)

	return err
```

## File: addons/dialogue_manager/import_plugin.gd.uid
```
uid://dhwpj6ed8soyq
```

## File: addons/dialogue_manager/inspector_plugin.gd
```
@tool
class_name DMInspectorPlugin extends EditorInspectorPlugin


func _can_handle(object: Object) -> bool:
	if object is GDScript: return false
	if not object is Node and not object is Resource: return false
	if "name" in object and object.name == "Dialogue Manager": return false
	return true


func _parse_property(object: Object, type, name: String, hint_type: PropertyHint, hint_string: String, usage_flags: int, wide: bool) -> bool:
	if hint_string == "DialogueResource" or ("dialogue" in name.to_lower() and hint_string == "Resource"):
		add_property_editor(name, DMDialogueEditorProperty.new())
		return true

	return false
```

## File: addons/dialogue_manager/inspector_plugin.gd.uid
```
uid://0x31sbqbikov
```

## File: addons/dialogue_manager/LICENSE
```
MIT License

Copyright (c) 2022-present Nathan Hoad and Dialogue Manager contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## File: addons/dialogue_manager/plugin.cfg
```ini
[plugin]

name="Dialogue Manager"
description="A powerful nonlinear dialogue system"
author="Nathan Hoad"
version="3.9.1"
script="plugin.gd"
```

## File: addons/dialogue_manager/plugin.cfg.uid
```
uid://hrny2utekhei
```

## File: addons/dialogue_manager/plugin.gd
```
@tool
class_name DMPlugin extends EditorPlugin


signal cache_file_content_changed(path: String, new_content: String)


const MainView: PackedScene = preload("./views/main_view.tscn")
const FindInDialogueView: PackedScene = preload("./views/find_in_dialogue_view.tscn")


static var instance: DMPlugin

var import_plugin: DMImportPlugin
var export_plugin: DMExportPlugin
var inspector_plugin: DMInspectorPlugin
var translation_parser_plugin: DMTranslationParserPlugin
var main_view: Control
var find_in_dialogue_view: Control


func _init() -> void:
	instance = self


func _enable_plugin() -> void:
	add_autoload_singleton("DialogueManager", get_plugin_path() + "/dialogue_manager.gd")
	_housekeeping()


func _disable_plugin() -> void:
	remove_autoload_singleton("DialogueManager")


func _enter_tree() -> void:
	if Engine.is_editor_hint():
		DMSettings.prepare()
		DMCache.prepare()

		import_plugin = DMImportPlugin.new()
		add_import_plugin(import_plugin)

		export_plugin = DMExportPlugin.new()
		add_export_plugin(export_plugin)

		inspector_plugin = DMInspectorPlugin.new()
		add_inspector_plugin(inspector_plugin)

		translation_parser_plugin = DMTranslationParserPlugin.new()
		add_translation_parser_plugin(translation_parser_plugin)

		main_view = MainView.instantiate()
		EditorInterface.get_editor_main_screen().add_child(main_view)
		_make_visible(false)

		_update_localization()

		EditorInterface.get_file_system_dock().files_moved.connect(_on_files_moved)
		EditorInterface.get_file_system_dock().file_removed.connect(_on_file_removed)

		add_tool_menu_item("Create copy of dialogue example balloon...", _copy_dialogue_balloon)


func _exit_tree() -> void:
	remove_import_plugin(import_plugin)
	import_plugin = null

	remove_export_plugin(export_plugin)
	export_plugin = null

	remove_inspector_plugin(inspector_plugin)
	inspector_plugin = null

	remove_translation_parser_plugin(translation_parser_plugin)
	translation_parser_plugin = null

	if is_instance_valid(main_view):
		main_view.queue_free()

	_hide_find_in_dialogue()

	EditorInterface.get_file_system_dock().files_moved.disconnect(_on_files_moved)
	EditorInterface.get_file_system_dock().file_removed.disconnect(_on_file_removed)

	remove_tool_menu_item("Create copy of dialogue example balloon...")

	instance = null


func _has_main_screen() -> bool:
	return true


func _make_visible(next_visible: bool) -> void:
	if is_instance_valid(main_view):
		main_view.visible = next_visible


func _get_plugin_name() -> String:
	return "Dialogue"


func _get_plugin_icon() -> Texture2D:
	return load(get_plugin_path() + "/assets/icon.svg")


func _handles(object) -> bool:
	var editor_settings: EditorSettings = EditorInterface.get_editor_settings()
	var external_editor: String = editor_settings.get_setting("text_editor/external/exec_path")
	var use_external_editor: bool = editor_settings.get_setting("text_editor/external/use_external_editor") and external_editor != ""
	if object is DialogueResource and use_external_editor and DMSettings.get_user_value("open_in_external_editor", false):
		var project_path: String = ProjectSettings.globalize_path("res://")
		var file_path: String = ProjectSettings.globalize_path(object.resource_path)
		OS.create_process(external_editor, [project_path, file_path])
		return false

	return object is DialogueResource


func _edit(object) -> void:
	if is_instance_valid(main_view) and is_instance_valid(object):
		main_view.open_resource(object)


func _apply_changes() -> void:
	if is_instance_valid(main_view):
		main_view.apply_changes()
		_update_localization()


func _get_unsaved_status(for_scene: String) -> String:
	if not for_scene.is_empty(): return ""
	if not is_instance_valid(main_view): return ""

	var unsaved_count: int = main_view.count_unsaved_files()
	if unsaved_count > 0:
		return DMConstants.translate(&"confirm_n_unsaved_files").format({ count = unsaved_count })
	else:
		return ""


func _save_external_data() -> void:
	if is_instance_valid(main_view) and EditorInterface.get_editor_settings().get_setting("run/auto_save/save_before_running"):
		main_view.apply_changes()
		_update_localization()

	DMCache.reimport_files()


func _build() -> bool:
	# If this is the dotnet Godot then we need to check if the solution file exists
	DMSettings.check_for_dotnet_solution()

	# Ignore errors in other files if we are just running the test scene
	if DMSettings.get_user_value("is_running_test_scene", true): return true

	DMCache.reimport_files()

	var files_with_errors: Array[Dictionary] = DMCache.get_files_with_errors()
	if files_with_errors.size() > 0:
		for dialogue_file: Dictionary in files_with_errors:
			push_error("You have %d error(s) in %s" % [dialogue_file.errors.size(), dialogue_file.path])
		EditorInterface.edit_resource(load(files_with_errors[0].path))
		main_view.show_build_error_dialog()
		return false

	return true


## Open a [Dialogue Resource] and jump to a given title.
static func open_file_at_title(resource_or_path: Variant, title: String, create_if_none: bool = false) -> void:
	var resource: DialogueResource = resource_or_path if resource_or_path is DialogueResource else load(resource_or_path)
	EditorInterface.edit_resource(resource)
	instance.main_view.go_to_title(title, create_if_none)


static func show_find_in_dialogue() -> void:
	instance._show_find_in_dialogue()


func _show_find_in_dialogue() -> void:
	if not is_instance_valid(find_in_dialogue_view):
		find_in_dialogue_view = FindInDialogueView.instantiate()
		find_in_dialogue_view.main_view = main_view
		find_in_dialogue_view.result_selected.connect(main_view._on_find_in_files_result_selected)
		add_control_to_bottom_panel(find_in_dialogue_view, DMConstants.translate(&"search.find_in_dialogue"))
	make_bottom_panel_item_visible(find_in_dialogue_view)
	find_in_dialogue_view.prepare()


func _hide_find_in_dialogue() -> void:
	if is_instance_valid(find_in_dialogue_view):
		remove_control_from_bottom_panel(find_in_dialogue_view)
		find_in_dialogue_view.queue_free()


## Get the shortcuts used by the plugin
static func get_editor_shortcuts() -> Dictionary:
	var shortcuts: Dictionary = {
		toggle_comment = [
			_create_event("Ctrl+K"),
			_create_event("Ctrl+Slash")
		],
		delete_line = [
			_create_event("Ctrl+Shift+K")
		],
		move_up = [
			_create_event("Alt+Up")
		],
		move_down = [
			_create_event("Alt+Down")
		],
		save = [
			_create_event("Ctrl+Alt+S")
		],
		close_file = [
			_create_event("Ctrl+W")
		],
		find_in_files = [
			_create_event("Ctrl+Shift+F")
		],

		run_test_scene = [
			_create_event("Ctrl+F5")
		],
		text_size_increase = [
			_create_event("Ctrl+Equal")
		],
		text_size_decrease = [
			_create_event("Ctrl+Minus")
		],
		text_size_reset = [
			_create_event("Ctrl+0")
		],

		make_bold = [
			_create_event("Ctrl+Shift+b")
		],
		make_italic = [
			_create_event("Ctrl+Shift+i")
		]
	}

	var paths = EditorInterface.get_editor_paths()
	var settings: Resource = null
	for version: String in ["4.5", "4.4", "4.3", "4"]:
		var path: String = paths.get_config_dir() + "/editor_settings-" + version + ".tres"
		if FileAccess.file_exists(path):
			settings = load(path)
			break

	if settings == null: return shortcuts

	for s: Dictionary in settings.get("shortcuts"):
		for key: String in shortcuts:
			if s.name == "script_text_editor/%s" % key or s.name == "script_editor/%s" % key:
				shortcuts[key] = []
				for event: InputEvent in s.shortcuts:
					if event is InputEventKey:
						shortcuts[key].append(event)

	return shortcuts


static func _create_event(string: String) -> InputEventKey:
	var event: InputEventKey = InputEventKey.new()
	var bits = string.split("+")
	event.keycode = OS.find_keycode_from_string(bits[bits.size() - 1])
	event.shift_pressed = bits.has("Shift")
	event.alt_pressed = bits.has("Alt")
	if bits.has("Ctrl") or bits.has("Command"):
		event.command_or_control_autoremap = true
	return event


## Get the editor shortcut that matches an event
static func get_editor_shortcut(event: InputEventKey) -> String:
	var shortcuts: Dictionary = get_editor_shortcuts()
	for key: String in shortcuts:
		for shortcut: InputEvent in shortcuts.get(key, []):
			if event.as_text().split(" ")[0] == shortcut.as_text().split(" ")[0]:
				return key
	return ""


## Get the current version
static func get_version() -> String:
	var config: ConfigFile = ConfigFile.new()
	config.load(get_plugin_path() + "/plugin.cfg")
	return config.get_value("plugin", "version")


## Get the current path of the plugin
static func get_plugin_path() -> String:
	if not is_instance_valid(instance):
		return ""
	return instance.get_script().resource_path.get_base_dir()


## Update references to a moved file
func _update_import_paths(from_path: String, to_path: String) -> void:
	DMCache.move_file_path(from_path, to_path)

	# Reopen the file if it's already open
	if main_view.current_file_path == from_path:
		if to_path == "":
			main_view.close_file(from_path)
		else:
			main_view.current_file_path = ""
			main_view.open_file(to_path)

	# Update any other files that import the moved file
	var dependents: Array = DMCache.get_files_with_dependency(from_path)
	for dependent: Dictionary in dependents:
		dependent.dependencies.remove_at(dependent.dependencies.find(from_path))
		dependent.dependencies.append(to_path)

		# Update the live buffer
		if main_view.current_file_path == dependent.path:
			main_view.code_edit.text = main_view.code_edit.text.replace(from_path, to_path)
			main_view.open_buffers[main_view.current_file_path].pristine_text = main_view.code_edit.text

		# Open the file and update the path
		var file: FileAccess = FileAccess.open(dependent.path, FileAccess.READ)
		var text: String = file.get_as_text().replace(from_path, to_path)
		file.close()

		file = FileAccess.open(dependent.path, FileAccess.WRITE)
		file.store_string(text)
		file.close()


func _update_localization() -> void:
	if not DMSettings.get_setting(DMSettings.UPDATE_POT_FILES_AUTOMATICALLY, true):
		return

	var dialogue_files: PackedStringArray = DMCache.get_files()

	# Add any new files to POT generation
	var files_for_pot: PackedStringArray = ProjectSettings.get_setting("internationalization/locale/translations_pot_files", [])
	var files_for_pot_changed: bool = false
	for path: String in dialogue_files:
		if not files_for_pot.has(path):
			files_for_pot.append(path)
			files_for_pot_changed = true

	# Remove any POT references that don't exist any more
	for i: int in range(files_for_pot.size() - 1, -1, -1):
		var file_for_pot: String = files_for_pot[i]
		if file_for_pot.get_extension() == "dialogue" and not dialogue_files.has(file_for_pot):
			files_for_pot.remove_at(i)
			files_for_pot_changed = true

	# Update project settings if POT changed
	if files_for_pot_changed:
		ProjectSettings.set_setting("internationalization/locale/translations_pot_files", files_for_pot)
		ProjectSettings.save()


### Callbacks


func _copy_dialogue_balloon() -> void:
	var scale: float = EditorInterface.get_editor_scale()
	var directory_dialog: FileDialog = FileDialog.new()
	var label: Label = Label.new()
	label.text = "Dialogue balloon files will be copied into chosen directory."
	directory_dialog.get_vbox().add_child(label)
	directory_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	directory_dialog.min_size = Vector2(600, 500) * scale
	directory_dialog.dir_selected.connect(func(path):
		var plugin_path: String = get_plugin_path()
		var is_dotnet: bool = DMSettings.check_for_dotnet_solution()

		var balloon_path: String = path + ("/Balloon.tscn" if is_dotnet else "/balloon.tscn")
		var balloon_script_path: String = path + ("/DialogueBalloon.cs" if is_dotnet else "/balloon.gd")

		# Copy the balloon scene file and change the script reference
		var is_small_window: bool = ProjectSettings.get_setting("display/window/size/viewport_width") < 400
		var example_balloon_file_name: String = "small_example_balloon.tscn" if is_small_window else "example_balloon.tscn"
		var example_balloon_path: String = plugin_path + "/example_balloon/" + example_balloon_file_name
		var example_balloon_script_file_name: String = "ExampleBalloon.cs" if is_dotnet else "example_balloon.gd"
		var example_balloon_script_uid: String = ResourceUID.id_to_text(ResourceLoader.get_resource_uid(plugin_path + "/example_balloon/example_balloon.gd"))
		var example_balloon_uid: String = ResourceUID.id_to_text(ResourceLoader.get_resource_uid(example_balloon_path))

		# Copy the script file
		var file: FileAccess = FileAccess.open(plugin_path + "/example_balloon/" + example_balloon_script_file_name, FileAccess.READ)
		var file_contents: String = file.get_as_text()
		if is_dotnet:
			file_contents = file_contents.replace("class ExampleBalloon", "class DialogueBalloon")
		else:
			file_contents = file_contents.replace("class_name DialogueManagerExampleBalloon ", "")
		file = FileAccess.open(balloon_script_path, FileAccess.WRITE)
		file.store_string(file_contents)
		file.close()
		var new_balloon_script_uid_raw: int = ResourceUID.create_id()
		ResourceUID.add_id(new_balloon_script_uid_raw, balloon_script_path)
		var new_balloon_script_uid: String = ResourceUID.id_to_text(new_balloon_script_uid_raw)

		# Save the new balloon
		file_contents = FileAccess.get_file_as_string(example_balloon_path)
		if "example_balloon.gd" in file_contents:
			file_contents = file_contents.replace(plugin_path + "/example_balloon/example_balloon.gd", balloon_script_path)
		else:
			file_contents = file_contents.replace(plugin_path + "/example_balloon/ExampleBalloon.cs", balloon_script_path)
		var new_balloon_uid: String = ResourceUID.id_to_text(ResourceUID.create_id())
		file_contents = file_contents.replace(example_balloon_uid, new_balloon_uid).replace(example_balloon_script_uid, new_balloon_script_uid)
		file = FileAccess.open(balloon_path, FileAccess.WRITE)
		file.store_string(file_contents)
		file.close()

		EditorInterface.get_resource_filesystem().scan()
		EditorInterface.get_file_system_dock().call_deferred("navigate_to_path", balloon_path)

		DMSettings.set_setting(DMSettings.BALLOON_PATH, balloon_path)

		directory_dialog.queue_free()
	)
	EditorInterface.get_base_control().add_child(directory_dialog)
	directory_dialog.popup_centered()


# Tidy up some things that may have gotten messy between versions.
func _housekeeping() -> void:
	# Automatically swap the script on the example balloon depending on if dotnet is being used.
	if not FileAccess.file_exists("res://tests/test_basic_dialogue.gd"):
		var plugin_path: String = get_plugin_path()
		var balloon_file_names: PackedStringArray = ["example_balloon.tscn", "small_example_balloon.tscn"]
		for balloon_file_name: String in balloon_file_names:
			var balloon_path: String = plugin_path + "/example_balloon/" + balloon_file_name
			var balloon_content: String = FileAccess.get_file_as_string(balloon_path)
			if "example_balloon.gd" in balloon_content and DMSettings.check_for_dotnet_solution():
				balloon_content = balloon_content \
					# Replace script path with the C# one
					.replace("example_balloon.gd", "ExampleBalloon.cs") \
					# Replace script UID with the C# one
					.replace(ResourceUID.id_to_text(ResourceLoader.get_resource_uid(plugin_path + "/example_balloon/example_balloon.gd")), ResourceUID.id_to_text(ResourceLoader.get_resource_uid(plugin_path + "/example_balloon/ExampleBalloon.cs")))
				var balloon_file: FileAccess = FileAccess.open(balloon_path, FileAccess.WRITE)
				balloon_file.store_string(balloon_content)
				balloon_file.close()
			elif "ExampleBalloon.cs" in balloon_content and not DMSettings.check_for_dotnet_solution():
				balloon_content = balloon_content \
					# Replace script path with the GDScript one
					.replace("ExampleBalloon.cs", "example_balloon.gd") \
					# Replace script UID with the GDScript one
					.replace(ResourceUID.id_to_text(ResourceLoader.get_resource_uid(plugin_path + "/example_balloon/ExampleBalloon.cs")), ResourceUID.id_to_text(ResourceLoader.get_resource_uid(plugin_path + "/example_balloon/example_balloon.gd")))
				var balloon_file: FileAccess = FileAccess.open(balloon_path, FileAccess.WRITE)
				balloon_file.store_string(balloon_content)
				balloon_file.close()

	# Automatically make any changes to the known custom balloon if there is one.
	var balloon_path: String = DMSettings.get_setting(DMSettings.BALLOON_PATH, "")
	if balloon_path != "" and FileAccess.file_exists(balloon_path):
		var is_small_window: bool = ProjectSettings.get_setting("display/window/size/viewport_width") < 400
		var example_balloon_file_name: String = "small_example_balloon.tscn" if is_small_window else "example_balloon.tscn"
		var example_balloon_path: String = get_plugin_path() + "/example_balloon/" + example_balloon_file_name

		var contents: String = FileAccess.get_file_as_string(balloon_path)
		var has_changed: bool = false

		# Make sure the current balloon has a UID unique from the example balloon's
		var example_balloon_uid: String = ResourceUID.id_to_text(ResourceLoader.get_resource_uid(example_balloon_path))
		var balloon_uid: String = ResourceUID.id_to_text(ResourceLoader.get_resource_uid(balloon_path))
		if example_balloon_uid == balloon_uid:
			var new_balloon_uid: String = ResourceUID.id_to_text(ResourceUID.create_id())
			contents = contents.replace(example_balloon_uid, new_balloon_uid)
			has_changed = true

		# Make sure the example balloon copy has the correct renaming of the responses menu
		if "reponses" in contents:
			contents = contents.replace("reponses", "responses")
			has_changed = true

		# Save any changes
		if has_changed:
			var balloon_file: FileAccess = FileAccess.open(balloon_path, FileAccess.WRITE)
			balloon_file.store_string(contents)
			balloon_file.close()



### Signals


func _on_files_moved(old_file: String, new_file: String) -> void:
	_update_import_paths(old_file, new_file)
	DMSettings.move_recent_file(old_file, new_file)


func _on_file_removed(file: String) -> void:
	_update_import_paths(file, "")
	if is_instance_valid(main_view):
		main_view.close_file(file)
	_update_localization()
```

## File: addons/dialogue_manager/plugin.gd.uid
```
uid://bpv426rpvrafa
```

## File: addons/dialogue_manager/settings.gd
```
@tool
class_name DMSettings extends Node


#region Editor



## Wrap lines in the dialogue editor.
const WRAP_LONG_LINES = "editor/wrap_long_lines"
## The template to start new dialogue files with.
const NEW_FILE_TEMPLATE = "editor/new_file_template"

## Show lines without statis IDs as errors.
const MISSING_TRANSLATIONS_ARE_ERRORS = "editor/translations/missing_translations_are_errors"
## Include character names in the list of translatable strings.
const INCLUDE_CHARACTERS_IN_TRANSLATABLE_STRINGS_LIST = "editor/translations/include_characters_in_translatable_strings_list"
## The default delimiter to use when exporting CSVs
const DEFAULT_CSV_DELIMITER = "editor/translations/default_csv_delimiter"
## The default locale to use when exporting CSVs
const DEFAULT_CSV_LOCALE = "editor/translations/default_csv_locale"
## Any extra CSV locales to append to the exported translation CSV
const EXTRA_CSV_LOCALES = "editor/translations/extra_csv_locales"
## Includes a "_character" column in CSV exports.
const INCLUDE_CHARACTER_IN_TRANSLATION_EXPORTS = "editor/translations/include_character_in_translation_exports"
## Includes a "_notes" column in CSV exports
const INCLUDE_NOTES_IN_TRANSLATION_EXPORTS = "editor/translations/include_notes_in_translation_exports"
## Automatically update the project's list of translatable files when dialogue files are added or removed
const UPDATE_POT_FILES_AUTOMATICALLY = "editor/translations/update_pot_files_automatically"

## A processor handling special case compilation.
const DIALOGUE_PROCESSOR_PATH = "editor/advanced/dialogue_processor_path"

## A custom test scene to use when testing dialogue.
const CUSTOM_TEST_SCENE_PATH = "editor/advanced/custom_test_scene_path"
## Extra script files to include in the auto-complete-able list
const EXTRA_AUTO_COMPLETE_SCRIPT_SOURCES = "editor/advanced/extra_auto_complete_script_sources"

## The custom balloon for this game.
const BALLOON_PATH = "runtime/balloon_path"
## The names of any autoloads to shortcut into all dialogue files (so you don't have to write `using SomeGlobal` in each file).
const STATE_AUTOLOAD_SHORTCUTS = "runtime/state_autoload_shortcuts"
## Check for possible naming conflicts in state shortcuts.
const WARN_ABOUT_METHOD_PROPERTY_OR_SIGNAL_NAME_CONFLICTS = "runtime/warn_about_method_property_or_signal_name_conflicts"

## Bypass any missing state when running dialogue.
const IGNORE_MISSING_STATE_VALUES = "runtime/advanced/ignore_missing_state_values"
## Whether or not the project is utilising dotnet.
const USES_DOTNET = "runtime/advanced/uses_dotnet"


static var SETTINGS_CONFIGURATION = {
	WRAP_LONG_LINES: {
		value = false,
		type = TYPE_BOOL,
	},
	NEW_FILE_TEMPLATE: {
		value = "~ start\nNathan: [[Hi|Hello|Howdy]], this is some dialogue.\nNathan: Here are some choices.\n- First one\n\tNathan: You picked the first one.\n- Second one\n\tNathan: You picked the second one.\n- Start again => start\n- End the conversation => END\nNathan: For more information see the online documentation.\n=> END",
		type = TYPE_STRING,
		hint = PROPERTY_HINT_MULTILINE_TEXT,
	},

	MISSING_TRANSLATIONS_ARE_ERRORS: {
		value = false,
		type = TYPE_BOOL,
		is_advanced = true
	},
	INCLUDE_CHARACTERS_IN_TRANSLATABLE_STRINGS_LIST: {
		value = true,
		type = TYPE_BOOL,
	},
	DEFAULT_CSV_DELIMITER: {
		value = "Comma",
		type = TYPE_STRING,
		hint = PROPERTY_HINT_ENUM,
		hint_string = "Comma,Semicolon,Tab"
	},
	DEFAULT_CSV_LOCALE: {
		value = "en",
		type = TYPE_STRING,
		hint = PROPERTY_HINT_LOCALE_ID,
	},
	EXTRA_CSV_LOCALES: {
		value = [],
		type = TYPE_PACKED_STRING_ARRAY,
		hint = PROPERTY_HINT_TYPE_STRING,
		hint_string = "%d:" % [TYPE_STRING],
		is_advanced = true
	},
	INCLUDE_CHARACTER_IN_TRANSLATION_EXPORTS: {
		value = false,
		type = TYPE_BOOL,
		is_advanced = true
	},
	INCLUDE_NOTES_IN_TRANSLATION_EXPORTS: {
		value = false,
		type = TYPE_BOOL,
		is_advanced = true
	},
	UPDATE_POT_FILES_AUTOMATICALLY: {
		value = true,
		type = TYPE_BOOL,
		is_advanced = true
	},

	DIALOGUE_PROCESSOR_PATH: {
		value = "",
		type = TYPE_STRING,
		hint = PROPERTY_HINT_FILE,
		hint_string = "*.gd,*.cs",
		is_advanced = true
	},

	CUSTOM_TEST_SCENE_PATH: {
		value = preload("./test_scene.tscn").resource_path,
		type = TYPE_STRING,
		hint = PROPERTY_HINT_FILE,
		is_advanced = true
	},
	EXTRA_AUTO_COMPLETE_SCRIPT_SOURCES: {
		value = [],
		type = TYPE_PACKED_STRING_ARRAY,
		hint = PROPERTY_HINT_TYPE_STRING,
		hint_string = "%d/%d:*.*" % [TYPE_STRING, PROPERTY_HINT_FILE],
		is_advanced = true
	},

	BALLOON_PATH: {
		value = "",
		type = TYPE_STRING,
		hint = PROPERTY_HINT_FILE,
	},
	STATE_AUTOLOAD_SHORTCUTS: {
		value = [],
		type = TYPE_PACKED_STRING_ARRAY,
		hint = PROPERTY_HINT_TYPE_STRING,
		hint_string = "%d:" % [TYPE_STRING],
	},
	WARN_ABOUT_METHOD_PROPERTY_OR_SIGNAL_NAME_CONFLICTS: {
		value = false,
		type = TYPE_BOOL,
		is_advanced = true
	},

	IGNORE_MISSING_STATE_VALUES: {
		value = false,
		type = TYPE_BOOL,
		is_advanced = true
	},
	USES_DOTNET: {
		value = false,
		type = TYPE_BOOL,
		is_hidden = true
	}
}


static func prepare() -> void:
	var should_save_settings: bool = false

	# Remap any old settings into their new keys
	var legacy_map: Dictionary = {
		states = STATE_AUTOLOAD_SHORTCUTS,
		missing_translations_are_errors = MISSING_TRANSLATIONS_ARE_ERRORS,
		export_characters_in_translation = INCLUDE_CHARACTERS_IN_TRANSLATABLE_STRINGS_LIST,
		wrap_lines = WRAP_LONG_LINES,
		new_with_template = null,
		new_template = NEW_FILE_TEMPLATE,
		include_all_responses = null,
		ignore_missing_state_values = IGNORE_MISSING_STATE_VALUES,
		custom_test_scene_path = CUSTOM_TEST_SCENE_PATH,
		default_csv_locale = DEFAULT_CSV_LOCALE,
		balloon_path = BALLOON_PATH,
		create_lines_for_responses_with_characters = null,
		include_character_in_translation_exports = INCLUDE_CHARACTER_IN_TRANSLATION_EXPORTS,
		include_notes_in_translation_exports = INCLUDE_NOTES_IN_TRANSLATION_EXPORTS,
		uses_dotnet = USES_DOTNET,
		try_suppressing_startup_unsaved_indicator = null
	}

	for legacy_key: String in legacy_map:
		if ProjectSettings.has_setting("dialogue_manager/general/%s" % legacy_key):
			should_save_settings = true
			# Remove the old setting
			var value = ProjectSettings.get_setting("dialogue_manager/general/%s" % legacy_key)
			ProjectSettings.set_setting("dialogue_manager/general/%s" % legacy_key, null)
			if legacy_map.get(legacy_key) != null:
				prints("Migrating Dialogue Manager setting %s to %s with value %s" % [legacy_key, legacy_map.get(legacy_key), str(value)])
				ProjectSettings.set_setting("dialogue_manager/%s" % [legacy_map.get(legacy_key)], value)

	# Set up initial settings
	for key: String in SETTINGS_CONFIGURATION:
		var setting_config: Dictionary = SETTINGS_CONFIGURATION[key]
		var setting_name: String = "dialogue_manager/%s" % key
		if not ProjectSettings.has_setting(setting_name):
			ProjectSettings.set_setting(setting_name, setting_config.value)
		ProjectSettings.set_initial_value(setting_name, setting_config.value)
		ProjectSettings.add_property_info({
			"name" = setting_name,
			"type" = setting_config.type,
			"hint" = setting_config.get("hint", PROPERTY_HINT_NONE),
			"hint_string" = setting_config.get("hint_string", "")
		})
		ProjectSettings.set_as_basic(setting_name, not setting_config.has("is_advanced"))
		ProjectSettings.set_as_internal(setting_name, setting_config.has("is_hidden"))

	if should_save_settings:
		ProjectSettings.save()


static func set_setting(key: String, value) -> void:
	if get_setting(key, value) != value:
		ProjectSettings.set_setting("dialogue_manager/%s" % key, value)
		ProjectSettings.set_initial_value("dialogue_manager/%s" % key, SETTINGS_CONFIGURATION[key].value)
		ProjectSettings.save()


static func get_setting(key: String, default):
	if ProjectSettings.has_setting("dialogue_manager/%s" % key):
		return ProjectSettings.get_setting("dialogue_manager/%s" % key)
	else:
		return default


static func get_settings(only_keys: PackedStringArray = []) -> Dictionary:
	var settings: Dictionary = {}
	for key in SETTINGS_CONFIGURATION.keys():
		if only_keys.is_empty() or key in only_keys:
			settings[key] = get_setting(key, SETTINGS_CONFIGURATION[key].value)
	return settings


#endregion

#region User


static func get_user_config() -> Dictionary:
	var user_config: Dictionary = {
		check_for_updates = true,
		just_refreshed = null,
		recent_files = [],
		reopen_files = [],
		most_recent_reopen_file = "",
		file_meta = {},
		run_title = "",
		run_resource_path = "",
		is_running_test_scene = false,
		has_dotnet_solution = false,
		open_in_external_editor = false
	}

	if FileAccess.file_exists(DMConstants.USER_CONFIG_PATH):
		var file: FileAccess = FileAccess.open(DMConstants.USER_CONFIG_PATH, FileAccess.READ)
		user_config.merge(JSON.parse_string(file.get_as_text()), true)

	return user_config


static func save_user_config(user_config: Dictionary) -> void:
	var file: FileAccess = FileAccess.open(DMConstants.USER_CONFIG_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(user_config))


static func set_user_value(key: String, value) -> void:
	var user_config: Dictionary = get_user_config()
	user_config[key] = value
	save_user_config(user_config)


static func get_user_value(key: String, default = null) -> Variant:
	return get_user_config().get(key, default)


static func forget_path(path: String) -> void:
	remove_recent_file(path)
	var file_meta: Dictionary = get_user_value("file_meta", {})
	file_meta.erase(path)
	set_user_value("file_meta", file_meta)


static func add_recent_file(path: String) -> void:
	var recent_files: Array = get_user_value("recent_files", [])
	if path in recent_files:
		recent_files.erase(path)
	recent_files.insert(0, path)
	set_user_value("recent_files", recent_files)


static func move_recent_file(from_path: String, to_path: String) -> void:
	var recent_files: Array = get_user_value("recent_files", [])
	for i in range(0, recent_files.size()):
		if recent_files[i] == from_path:
			recent_files[i] = to_path
	set_user_value("recent_files", recent_files)


static func remove_recent_file(path: String) -> void:
	var recent_files: Array = get_user_value("recent_files", [])
	if path in recent_files:
		recent_files.erase(path)
	set_user_value("recent_files", recent_files)


static func get_recent_files() -> Array:
	return get_user_value("recent_files", [])


static func clear_recent_files() -> void:
	set_user_value("recent_files", [])
	set_user_value("carets", {})


static func set_caret(path: String, cursor: Vector2) -> void:
	var file_meta: Dictionary = get_user_value("file_meta", {})
	file_meta[path] = file_meta.get(path, {}).merged({ cursor = "%d,%d" % [cursor.x, cursor.y] }, true)
	set_user_value("file_meta", file_meta)


static func get_caret(path: String) -> Vector2:
	var file_meta: Dictionary = get_user_value("file_meta", {})
	if file_meta.has(path):
		var cursor: PackedStringArray = file_meta.get(path).get("cursor", "0,0").split(",")
		return Vector2(cursor[0].to_int(), cursor[1].to_int())
	else:
		return Vector2.ZERO


static func set_scroll(path: String, scroll_vertical: int) -> void:
	var file_meta: Dictionary = get_user_value("file_meta", {})
	file_meta[path] = file_meta.get(path, {}).merged({ scroll_vertical = scroll_vertical }, true)
	set_user_value("file_meta", file_meta)


static func get_scroll(path: String) -> int:
	var file_meta: Dictionary = get_user_value("file_meta", {})
	if file_meta.has(path):
		return file_meta.get(path).get("scroll_vertical", 0)
	else:
		return 0


static func check_for_dotnet_solution() -> bool:
	if Engine.is_editor_hint():
		var has_dotnet_solution: bool = false
		if ProjectSettings.has_setting("dotnet/project/solution_directory"):
			var directory: String = ProjectSettings.get("dotnet/project/solution_directory")
			var file_name: String = ProjectSettings.get("dotnet/project/assembly_name")
			has_dotnet_solution = FileAccess.file_exists("res://%s/%s.sln" % [directory, file_name])
		set_setting(DMSettings.USES_DOTNET, has_dotnet_solution)
		return has_dotnet_solution

	return get_setting(DMSettings.USES_DOTNET, false)


#endregion
```

## File: addons/dialogue_manager/settings.gd.uid
```
uid://ce1nk88365m52
```

## File: addons/dialogue_manager/test_scene.gd
```
class_name BaseDialogueTestScene extends Node2D


const DialogueSettings = preload("./settings.gd")
const DialogueResource = preload("./dialogue_resource.gd")


@onready var title: String = DialogueSettings.get_user_value("run_title")
@onready var resource: DialogueResource = load(DialogueSettings.get_user_value("run_resource_path"))


func _ready():
	if not Engine.is_embedded_in_editor:
		var window: Window = get_viewport()
		var screen_index: int = DisplayServer.get_primary_screen()
		window.position = Vector2(DisplayServer.screen_get_position(screen_index)) + (DisplayServer.screen_get_size(screen_index) - window.size) * 0.5
		window.mode = Window.MODE_WINDOWED

	# Normally you can just call DialogueManager directly but doing so before the plugin has been
	# enabled in settings will throw a compiler error here so I'm using `get_singleton` instead.
	var dialogue_manager = Engine.get_singleton("DialogueManager")
	dialogue_manager.dialogue_ended.connect(_on_dialogue_ended)
	dialogue_manager.show_dialogue_balloon(resource, title if not title.is_empty() else resource.first_title)


func _enter_tree() -> void:
	DialogueSettings.set_user_value("is_running_test_scene", false)


#region Signals


func _on_dialogue_ended(_resource: DialogueResource):
	get_tree().quit()


#endregion
```

## File: addons/dialogue_manager/test_scene.gd.uid
```
uid://c8e16qdgu40wo
```

## File: addons/dialogue_manager/test_scene.tscn
```
[gd_scene load_steps=2 format=3 uid="uid://ugd552efvil0"]

[ext_resource type="Script" uid="uid://c8e16qdgu40wo" path="res://addons/dialogue_manager/test_scene.gd" id="1_yupoh"]

[node name="TestScene" type="Node2D"]
script = ExtResource("1_yupoh")
```
