# Sample MIPS program that writes to a new file.
#   by Kenneth Vollmar and Pete Sanderson
# Karen Mazidi: added file read 

        .data
fout:   .asciiz "testout.txt"      # filename for output
buffer: .asciiz "The quick brown fox jumps over the lazy dog."
	.align	2
read:	.space	100
        .text
  ###############################################################
  # Open (for writing) a file that does not exist
  li   $v0, 13       # system call for open file
  la   $a0, fout     # output file name
  li   $a1, 1        # Open for writing (flags are 0: read, 1: write)
  li   $a2, 0        # mode is ignored
  syscall            # open a file (file descriptor returned in $v0)
  move $s6, $v0      # save the file descriptor 
  ###############################################################
  # Write to file just opened
  li   $v0, 15       # system call for write to file
  move $a0, $s6      # file descriptor 
  la   $a1, buffer   # address of buffer from which to write
  li   $a2, 44       # hardcoded buffer length
  syscall            # write to file
  ###############################################################
  # Close the file 
  li   $v0, 16       # system call for close file
  move $a0, $s6      # file descriptor to close
  syscall            # close file
  ###############################################################
  # Open (for reading) a file that hopefully exists
  li   $v0, 13       # system call for open file
  la   $a0, fout     # input file name
  li   $a1, 0        # Open for reading (flags are 0: read, 1: write)
  li   $a2, 0        # mode is ignored
  syscall            # open a file (file descriptor returned in $v0)
  move $s6, $v0      # save the file descriptor 
  ###############################################################
  # read from file just opened
  li   $v0, 14       # system call for file read
  move $a0, $s6      # file descriptor 
  la   $a1, read     # address of buffer to read into
  li   $a2, 100       # hardcoded buffer length
  syscall            # read from file
  ###############################################################
  # print out string just read
  li   $v0, 4
  la	$a0, read
  syscall
  ###############################################################
  # exit
  li	$v0, 10
  syscall