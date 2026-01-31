0100: B4 09               ; mov ah, 9
0102: BA 0108             ; mov dx, M ; M = 0x0108
0105: CD 21               ; int 0x21
0107: C3                  ; ret
0108: "Hello, World!" 24  ; M db "Hello, World!", 0x24