#!/bin/zsh

i=0
while [ $i -le 4 ]
do
  curl https://loripsum.net/api/3/medium/plaintext --output file$i
  i=$(( $i+1 ))
done

# Notes & References
# 
# Tags: lorem ipsum, bash, cli, command line, linux, shellscript programming, zsh
# 
# ^ 2022-03-08T14:54:19-0500\
# % 2022-03-08T23:10:22-0500
# 
# [1]: https://loripsum.net/api
# [2]: https://loripsum.net/api/10/short/headers
# [3]: https://loripsum.net/api/3/medium/plaintext
# [4]: https://browsercheck.nl/ "Browsercheck | Information about your browser"
# [5]: https://boltcms.io/ "The starting point of your new website | Boltcms.io"
# [6]: https://www.cyberciti.biz/faq/bash-while-loop/ "Bash While Loop Examples"
# 
