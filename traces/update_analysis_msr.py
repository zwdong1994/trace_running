#import os
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
handle = open(sys.argv[1], "rb")

for line in handle:
    line_num = line_num + 1
    list = line.split(',')
    #print(list)
    add = list[1]
    opt = list[3]
    if add in add_optstring:
        if opt == 'w':
            read_opt = 'w'
            write_num = write_num + 1
            add_optstring[add] = add_optstring[add] + read_opt
        else:
            read_opt = 'r'
            read_num = read_num + 1
            add_optstring[add] = add_optstring[add] + read_opt
    else:
         if opt == 'w':
            read_opt = 'w'
            write_num = write_num + 1
            add_optstring[add] = read_opt
         else:
            read_opt = 'r'
            read_num = read_num + 1
            add_optstring[add] = read_opt

for key in add_optstring:
    suspicious_ransom = suspicious_ransom + add_optstring[key].count('rw')

print 'Trace number is: ', line_num
print 'Read number is: ', read_num, 'Read ratio is: ', 100.0 * read_num / line_num, '%'
print 'Write number is: ', write_num, 'Write ratio is: ', 100.0 * write_num / line_num, '%'
print 'Update rate is: ', (100 * (1.0 * suspicious_ransom) / line_num),'%'
print '******************************************************************'


handle.close()
