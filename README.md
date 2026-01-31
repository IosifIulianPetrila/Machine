<h1>Machine Language</h1>

<b>Machine Language</b> is the byte-level (or bit-level) representation of data and executable instructions, targeting either real hardware processors or virtual machines.

The next example related to the x86 processor family represents the simplest, complete and most compact possible code of a "Hello, World!" application written in machine language. See <https://figshare.com/articles/preprint/_b_Asm_Augmented_Assembly_Language_b_/31204036>

![Hello, World](Hello.png)

On the left is the machine language which represents descriptions of machine instructions as numerical values ​​distributed over a string of bytes prefixed at the beginning of the line by a label indicating their address/location. The descriptions are implicitly in base 16, big-endian for multibyte descriptions like 0108 (which is equivalent to the little-endian description 08 01), but also in other bases like 256/Ascii (in the case of the string "Hello, World!"), etc. On the right side (in the comments) are the equivalent descriptions in assembly language, the links between the two languages ​​being obvious. The executable application contains the 22 bytes described in the code and displays (when it run) the message "Hello, World!" shown at the bottom side.
