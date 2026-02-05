; Mario Console/Char Image
0100: BE 0144	 ; mov si, Mario
0103: 8A 36 0142 ; mov dh, [Row] ; Start row
0107: 8A 16 0143 ; mov dl, [Col] ; Start column
010B:		 ; next_char:
010B: AC	 ; lodsb
010C: 08 C0	 ; or  al, al
010E: 74 31	 ; jz  end_print (0x31 = 0x0141 - 0x0110)
0110: 3C 0A	 ; cmp al, 10
0112: 74 1F	 ; je  new_line (0x1F = 0x0133 - 0x0114)
0114: 3C 20	 ; cmp al, ' '
0116: 74 17	 ; je  skip_char (0x17 = 0x012F - 0x0118)
0118: 2C 30	 ; sub al, '0'
011A: 74 06	 ; je  print_char (0x06 = 0x0122 - 0x011C)
011C: 3C 09	 ; cmp al, 9
011E: 76 02	 ; jbe print_char (0x02 = 0x0122 - 0x0120)
0120: 2C 07	 ; sub al, 'A' - '0' - 10
0122:		 ; print_char:
0122: B4 09	 ; mov ah, 09h
0124: 88 C3	 ; mov bl, al   ; color
0126: B0 DB	 ; mov al, 0DBh ; Block character
0128: B7 00	 ; mov bh, 0    ; Page 0
012A: B9 0001	 ; mov cx, 1    ; Display once
012D: CD 10	 ; int 10h
012F:		 ; skip_char:
012F: FE C2	 ; inc dl
0131: EB 06	 ; jmp set_cursor (0x06 = 0x0139 - 0x0133)
0133:		 ; new_line:
0133: FE C6	 ; inc dh
0135: 8A 16 0143 ; mov dl, [Col] ; Reset to starting column
0139:		 ; set_cursor:
0139: B4 02	 ; mov ah, 02h   ; Set cursor position
013B: B7 00	 ; mov bh, 0
013D: CD 10	 ; int 10h
013F: EB CA	 ; jmp next_char (0xCA = 0x010B - 0x0141)
0141:		 ; end_print:
0141: C3	 ; ret

0142: 03	 ; Row db 3
0143: 1E	 ; Col db 30

0144:		 ; Mario:
      "    4444444444  " 0A
      "   444444444444 " 0A
      "   6666EEE E    " 0A
      " 66E66EEEE EEEE " 0A
      " 66E666EEEE6EEEE" 0A
      " 666EEEEE666666 " 0A
      "    EEEEEEEE    " 0A
      "   4449449444   " 0A
      " 44444944944444 " 0A
      "444444E99E444444" 0A
      "EEE4999999994EEE" 0A
      "EEEE99999999EEEE" 0A
      "EEE999999999EEE " 0A
      "   9999  9999   " 0A
      "   666    666   " 0A
      " 66666    66666 " 0A
      00
