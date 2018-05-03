### Hello World
#### Language: MIPS
#### Author: Karen Mazidi
##### Created: 2018.5.3
##### Last updated: 2018.5.4

**Purpose**: This is a stand-alone program created to experiment with *console I/O* system calls.

#### System Calls Used
* Output string
  * $v0 = 1
  * $a0 = address of string
* Input string
  * $v0 = 4
  * $a0 = address where string should be stored
  * $a1 = max length of string


#### Sample run:

```assembly
What is your name? Karen
Hello Karen
```
