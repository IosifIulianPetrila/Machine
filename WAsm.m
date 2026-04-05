; WAsm write (print) "Hello, World!"

0000: 00 "asm"       ; magic: \0asm
0004: 01 00 00 00    ; version: 1

0008: 01             ; section id = 1 (type)
0009: 09             ; section size = 9 bytes
000A: 02             ; 2 type entries
000B: 60 02 7F 7F 00 ; type[0]: (i32, i32) -> void, signature for write(ptr, len)
0010: 60 00 00       ; type[1]: () -> void, signature for $main

0013: 02             ; section id = 2 (import)
0014: 18             ; section size = 24 bytes
0015: 02             ; 2 import entries
0016: 03 "env"       ; import[0]: "env"."mem" -> memory, min 1 page
001A: 03 "mem"       ; "mem"
001E: 02             ; import kind = memory
001F: 00             ; flags: no maximum
0020: 01             ; initial = 1 page (64KB)
0021: 03 "env"       ; import[1]: "env"."write" :: type[0]
0025: 05 "write"     ; "write"
002B: 00             ; import kind = func
002C: 00             ; type index = 0  -> (i32, i32) -> void

002D: 03             ; section id = 3 (function)
002E: 02             ; section size = 2 bytes
002F: 01             ; 1 function entry
0030: 01             ; func[1] uses type index 1  -> () -> void

0031: 08             ; section id = 8 (start)
0032: 01             ; section size = 1 byte
0033: 01             ; start function index = 1  ($main) called automatically on instantiation

0034: 0A             ; section id = 10 (code)
0035: 0A             ; section size = 10 bytes
0036: 01             ; 1 function body
0037: 08             ; body size = 8 bytes
0038: 00             ; local declarations = 0
0039: 41 00          ; i32.const 0     ; ptr -> "Hello, World!" at offset 0
003B: 41 0D          ; i32.const 13    ; len = 13
003D: 10 00          ; call 0          ; call func[0] = env.write
003F: 0B             ; end

0040: 0B             ; section id = 11 (data)
0041: 13             ; section size = 19 bytes
0042: 01             ; 1 data segment
0043: 00             ; flags: active segment, memory index 0
0044: 41 00          ; i32.const 0     ; offset expression: 0
0046: 0B             ; end (of offset expression)
0047: 0D             ; data length = 13 bytes
0048: "Hello, World!"

; // JavaScript Test Code:
; const mem = new WebAssembly.Memory({initial: 1});
; const imports = { env: {
;   mem,
;   write: (ptr, len) => {process.stdout.write(new TextDecoder().decode(new Uint8Array(mem.buffer, ptr, len)));}
; }};
; new WebAssembly.Instance(new WebAssembly.Module(require('fs').readFileSync('WAsm.bin')), imports);
