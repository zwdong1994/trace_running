import os
import sys

add_optstring = {}

line_num = 0
write_num = 0
read_num = 0
suspicious_ransom = 0

read_opt = ''

if len(sys.argv) < 2 :
    print("Wrong parameter!")
    sys.exit()

result_name = sys.argv[1] + ".range"

handle = open(sys.argv[1], "rb")
if os.path.exists(result_name):
    os.remove(result_name)
fd = open(result_name, 'w')

for line in handle:
    line_num = line_num + 1
    list = line.split(',')
    #print(list)
    opt = list[3]

    if opt == 'r':
        read_num += 1

    if line_num == 1000:
        fd.write(str(1.0*read_num/line_num) + '\n')
        read_num = 0
        line_num = 0


fd.close()
handle.close()
