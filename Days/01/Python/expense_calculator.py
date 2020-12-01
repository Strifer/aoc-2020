import os
dirname = os.path.dirname(__file__)
filename = os.path.join(dirname, '../Input/expenses.txt')
f = open(filename, 'r')

lines = f.readlines()
target_sum = 2020
sums = set()
for line in lines:
    expense = int(line)
    temp = target_sum - expense
    if temp in sums:
        print(f'Found pair {expense} + {temp} = {target_sum}.\n{expense} * {temp} = {expense * temp}')
        break
    sums.add(expense)
    
