.intel_syntax noprefix

.macro PRINT label, length
    mov eax, 1
    mov edi, 1
    lea rsi, [rip + \label]
    mov edx, \length
    syscall
.endm

.section .rodata
intro:
    .ascii "THE LAST LIGHTHOUSE\n\nA storm has cut off the island road. The lighthouse flashes once, then\ngoes dark. Find a way to the harbor before midnight.\n\n"
.equ intro_len, . - intro
menu_text:
    .ascii "Choose your path:\n  1) Take the forest trail\n  2) Follow the shore\n  q) Quit\n> "
.equ menu_text_len, . - menu_text
forest_text:
    .ascii "A cabin window glows beneath the pines. A steep ridge overlooks the\nlighthouse.\n  1) Visit the cabin\n  2) Climb the ridge\n  3) Risk the washed-out bridge\n> "
.equ forest_text_len, . - forest_text
shore_text:
    .ascii "Waves roll over the beach. A wrecked boat lies nearby; a dark cave\nopens in the cliff.\n  1) Search the wreck\n  2) Enter the cave\n  3) Raise the wreck's signal flag\n> "
.equ shore_text_len, . - shore_text
cabin_text:
    .ascii "The keeper lets you in. Their radio crackles, but the signal is weak.\n  1) Repair the radio aerial\n  2) Study the keeper's tunnel map\n  3) Wait out the storm here\n> "
.equ cabin_text_len, . - cabin_text
ridge_text:
    .ascii "From the ridge, you spot a mirror and a line of blue lanterns below.\n  1) Flash the mirror toward the sea\n  2) Follow the lanterns downhill\n  3) Cut through the old quarry\n> "
.equ ridge_text_len, . - ridge_text
wreck_text:
    .ascii "A flare case is wedged beneath the wreck's mast. A small skiff tugs\nat its rope nearby.\n  1) Fire the flare\n  2) Take the skiff around the headland\n  3) Ring the wreck's bell\n> "
.equ wreck_text_len, . - wreck_text
cave_text:
    .ascii "A whistle answers from deeper in the cave. A lower tunnel slopes\ntoward the sound of rushing water.\n  1) Whistle back\n  2) Follow the lower tunnel\n  3) Follow the echo deeper\n> "
.equ cave_text_len, . - cave_text
cabin_radio_ending:
    .ascii "You straighten the aerial. With minutes to spare before midnight, the\nkeeper's distress call reaches the harbor. A rescue crew guides you in.\n\nGOOD ENDING: A LIGHT LEFT ON\n"
.equ cabin_radio_ending_len, . - cabin_radio_ending
cabin_map_ending:
    .ascii "The old service tunnel ends at the harbor gate. A watchman recognizes\nthe keeper's map and lets you shelter until the ferry arrives.\n\nENDING: THE HIDDEN WAY\n"
.equ cabin_map_ending_len, . - cabin_map_ending
ridge_mirror_ending:
    .ascii "Your mirror catches a ship's searchlight just before midnight. It\nsweeps back, then holds steady as the rescue boat turns toward you.\n\nGOOD ENDING: SIGNAL RECEIVED\n"
.equ ridge_mirror_ending_len, . - ridge_mirror_ending
ridge_lantern_ending:
    .ascii "The blue lights belong to island volunteers. A flooded path delays you,\nbut they guide you safely to the harbor shelter.\n\nENDING: THE ISLANDERS\n"
.equ ridge_lantern_ending_len, . - ridge_lantern_ending
wreck_flare_ending:
    .ascii "The flare burns bright above the surf. A passing fishing boat spots\nit before midnight and brings you safely to the harbor.\n\nGOOD ENDING: BRIGHT ENOUGH\n"
.equ wreck_flare_ending_len, . - wreck_flare_ending
wreck_skiff_ending:
    .ascii "You paddle around the headland and reach the harbor safely. The\nlighthouse stayed dark, but the harbor crew takes you in.\n\nENDING: HARBOR AT LAST\n"
.equ wreck_skiff_ending_len, . - wreck_skiff_ending
cave_whistle_ending:
    .ascii "Your whistle is answered by a coastguard guide, who leads you through\na passage opening beside the harbor just before midnight.\n\nGOOD ENDING: AN ANSWER IN THE DARK\n"
.equ cave_whistle_ending_len, . - cave_whistle_ending
cave_tunnel_ending:
    .ascii "The lower tunnel opens beside a freshwater spring. You reach the harbor\nby a long, winding route and find a dry place to wait.\n\nENDING: THE LONG WAY ROUND\n"
.equ cave_tunnel_ending_len, . - cave_tunnel_ending
cabin_wait_ending:
    .ascii "You wait as the keeper suggests. The radio battery dies, and the storm\nwashes out the forest trail. You are stranded until morning.\n\nBAD ENDING: LEFT BEHIND\n"
.equ cabin_wait_ending_len, . - cabin_wait_ending
ridge_quarry_ending:
    .ascii "The quarry path crumbles beneath the rain. You find a ledge above the\nfloodwater, but cannot climb out until daylight. The harbor is lost.\n\nBAD ENDING: THE FLOODED QUARRY\n"
.equ ridge_quarry_ending_len, . - ridge_quarry_ending
wreck_bell_ending:
    .ascii "The bell is too faint beneath the storm. The tide cuts off the rocks\nbefore you can return to shore. You wait through a cold, endless night.\n\nBAD ENDING: HIGH TIDE\n"
.equ wreck_bell_ending_len, . - wreck_bell_ending
cave_echo_ending:
    .ascii "The echo draws you into a maze of narrow passages. You find a dry\nledge, but the way out stays hidden until the tide falls at dawn.\n\nBAD ENDING: LOST BELOW\n"
.equ cave_echo_ending_len, . - cave_echo_ending
forest_bridge_ending:
    .ascii "The bridge gives way beneath your feet. You reach a stranded ledge,\nwhere rescuers find you at dawn. The harbor is out of reach tonight.\n\nBAD ENDING: THE BROKEN BRIDGE\n"
.equ forest_bridge_ending_len, . - forest_bridge_ending
shore_flag_ending:
    .ascii "A passing fishing boat spots your flag and brings you straight to the\nharbor. You make it safely without entering the wreck or cave.\n\nGOOD ENDING: THE QUICK RESCUE\n"
.equ shore_flag_ending_len, . - shore_flag_ending
cabin_map_prompt:
    .ascii "The tunnel map marks two exits from the keeper's cellar.\n  1) Take the marked harbor passage\n  2) Try the unmarked door\n> "
.equ cabin_map_prompt_len, . - cabin_map_prompt
ridge_lantern_prompt:
    .ascii "The volunteers' lanterns reach a fork in the flooded path.\n  1) Stay with the lanterns\n  2) Take a shortcut through the marsh\n> "
.equ ridge_lantern_prompt_len, . - ridge_lantern_prompt
wreck_skiff_prompt:
    .ascii "Beyond the headland, you see the harbor beacon and a distant ship's\nlantern.\n  1) Follow the beacon along the coast\n  2) Chase the ship's light offshore\n> "
.equ wreck_skiff_prompt_len, . - wreck_skiff_prompt
cave_tunnel_prompt:
    .ascii "The tunnel reaches an underground stream and a narrow side passage.\n  1) Follow the stream toward the harbor drain\n  2) Climb into the side passage\n> "
.equ cave_tunnel_prompt_len, . - cave_tunnel_prompt
cabin_door_ending:
    .ascii "The unmarked door opens into a flooded chamber. You climb onto a stone\nplatform and wait for the water to recede at dawn.\n\nBAD ENDING: THE FLOODED CELLAR\n"
.equ cabin_door_ending_len, . - cabin_door_ending
ridge_marsh_ending:
    .ascii "The marsh swallows the trail. You find firm ground, but the volunteers\nare gone and you spend the night lost in the reeds.\n\nBAD ENDING: THE MARSH\n"
.equ ridge_marsh_ending_len, . - ridge_marsh_ending
wreck_offshore_ending:
    .ascii "The ship's light vanishes in the rain. Your skiff drifts until a\ncoastguard boat finds you at first light.\n\nBAD ENDING: LOST AT SEA\n"
.equ wreck_offshore_ending_len, . - wreck_offshore_ending
cave_side_ending:
    .ascii "The side passage narrows and ends at a rockfall. You find a dry ledge,\nbut cannot turn back until the tide drops.\n\nBAD ENDING: THE DEAD END\n"
.equ cave_side_ending_len, . - cave_side_ending
invalid_text:
    .ascii "Please choose one of the listed options.\n\n"
.equ invalid_text_len, . - invalid_text
again_text:
    .ascii "\n  1) Play again\n  q) Quit\n> "
.equ again_text_len, . - again_text

.section .bss
.align 16
input_buffer:
    .skip 64

.section .text
.global _start
_start:
    PRINT intro, intro_len

menu:
    PRINT menu_text, menu_text_len
    call read_choice
    cmp al, 49
    je forest
    cmp al, 50
    je shore
    cmp al, 113
    je exit_game
    PRINT invalid_text, invalid_text_len
    jmp menu

forest:
    PRINT forest_text, forest_text_len
    call read_choice
    cmp al, 49
    je cabin_scene
    cmp al, 50
    je ridge_scene
    cmp al, 51
    je forest_bridge_ending_label
    PRINT invalid_text, invalid_text_len
    jmp forest

shore:
    PRINT shore_text, shore_text_len
    call read_choice
    cmp al, 49
    je wreck_scene
    cmp al, 50
    je cave_scene
    cmp al, 51
    je shore_flag_ending_label
    PRINT invalid_text, invalid_text_len
    jmp shore

cabin_scene:
    PRINT cabin_text, cabin_text_len
    call read_choice
    cmp al, 49
    je cabin_radio_ending_label
    cmp al, 50
    je cabin_map_scene
    cmp al, 51
    je cabin_wait_ending_label
    PRINT invalid_text, invalid_text_len
    jmp cabin_scene

ridge_scene:
    PRINT ridge_text, ridge_text_len
    call read_choice
    cmp al, 49
    je ridge_mirror_ending_label
    cmp al, 50
    je ridge_lantern_scene
    cmp al, 51
    je ridge_quarry_ending_label
    PRINT invalid_text, invalid_text_len
    jmp ridge_scene

wreck_scene:
    PRINT wreck_text, wreck_text_len
    call read_choice
    cmp al, 49
    je wreck_flare_ending_label
    cmp al, 50
    je wreck_skiff_scene
    cmp al, 51
    je wreck_bell_ending_label
    PRINT invalid_text, invalid_text_len
    jmp wreck_scene

cave_scene:
    PRINT cave_text, cave_text_len
    call read_choice
    cmp al, 49
    je cave_whistle_ending_label
    cmp al, 50
    je cave_tunnel_scene
    cmp al, 51
    je cave_echo_ending_label
    PRINT invalid_text, invalid_text_len
    jmp cave_scene

cabin_map_scene:
    PRINT cabin_map_prompt, cabin_map_prompt_len
    call read_choice
    cmp al, 49
    je cabin_map_ending_label
    cmp al, 50
    je cabin_door_ending_label
    PRINT invalid_text, invalid_text_len
    jmp cabin_map_scene

ridge_lantern_scene:
    PRINT ridge_lantern_prompt, ridge_lantern_prompt_len
    call read_choice
    cmp al, 49
    je ridge_lantern_ending_label
    cmp al, 50
    je ridge_marsh_ending_label
    PRINT invalid_text, invalid_text_len
    jmp ridge_lantern_scene

wreck_skiff_scene:
    PRINT wreck_skiff_prompt, wreck_skiff_prompt_len
    call read_choice
    cmp al, 49
    je wreck_skiff_ending_label
    cmp al, 50
    je wreck_offshore_ending_label
    PRINT invalid_text, invalid_text_len
    jmp wreck_skiff_scene

cave_tunnel_scene:
    PRINT cave_tunnel_prompt, cave_tunnel_prompt_len
    call read_choice
    cmp al, 49
    je cave_tunnel_ending_label
    cmp al, 50
    je cave_side_ending_label
    PRINT invalid_text, invalid_text_len
    jmp cave_tunnel_scene

cabin_radio_ending_label:
    PRINT cabin_radio_ending, cabin_radio_ending_len
    jmp play_again
cabin_map_ending_label:
    PRINT cabin_map_ending, cabin_map_ending_len
    jmp play_again
ridge_mirror_ending_label:
    PRINT ridge_mirror_ending, ridge_mirror_ending_len
    jmp play_again
ridge_lantern_ending_label:
    PRINT ridge_lantern_ending, ridge_lantern_ending_len
    jmp play_again
wreck_flare_ending_label:
    PRINT wreck_flare_ending, wreck_flare_ending_len
    jmp play_again
wreck_skiff_ending_label:
    PRINT wreck_skiff_ending, wreck_skiff_ending_len
    jmp play_again
cave_whistle_ending_label:
    PRINT cave_whistle_ending, cave_whistle_ending_len
    jmp play_again
cave_tunnel_ending_label:
    PRINT cave_tunnel_ending, cave_tunnel_ending_len
    jmp play_again
cabin_wait_ending_label:
    PRINT cabin_wait_ending, cabin_wait_ending_len
    jmp play_again
ridge_quarry_ending_label:
    PRINT ridge_quarry_ending, ridge_quarry_ending_len
    jmp play_again
wreck_bell_ending_label:
    PRINT wreck_bell_ending, wreck_bell_ending_len
    jmp play_again
cave_echo_ending_label:
    PRINT cave_echo_ending, cave_echo_ending_len
    jmp play_again
cabin_door_ending_label:
    PRINT cabin_door_ending, cabin_door_ending_len
    jmp play_again
ridge_marsh_ending_label:
    PRINT ridge_marsh_ending, ridge_marsh_ending_len
    jmp play_again
wreck_offshore_ending_label:
    PRINT wreck_offshore_ending, wreck_offshore_ending_len
    jmp play_again
cave_side_ending_label:
    PRINT cave_side_ending, cave_side_ending_len
    jmp play_again
forest_bridge_ending_label:
    PRINT forest_bridge_ending, forest_bridge_ending_len
    jmp play_again
shore_flag_ending_label:
    PRINT shore_flag_ending, shore_flag_ending_len
    jmp play_again

play_again:
    PRINT again_text, again_text_len
    call read_choice
    cmp al, 49
    je menu
    cmp al, 113
    je exit_game
    PRINT invalid_text, invalid_text_len
    jmp play_again

read_choice:
    xor eax, eax
    xor edi, edi
    lea rsi, [rip + input_buffer]
    mov edx, 1
    syscall
    test rax, rax
    jle exit_game
    movzx eax, BYTE PTR [rip + input_buffer]
    cmp al, 10
    je read_choice
    cmp al, 13
    je read_choice
    ret

exit_game:
    mov eax, 60
    xor edi, edi
    syscall