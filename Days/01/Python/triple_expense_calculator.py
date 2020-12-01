import os, sys
dirname = os.path.dirname(__file__)
filename = os.path.join(dirname, '../Input/expenses.txt')
f = open(filename, 'r')

lines = f.readlines()
target_sum = 2020
sums = set()
for i in range(len(lines)):
    expense_i = int(lines[i])
    for j in range(len(lines)):
        if j == len(lines) - 1:
            break
        expense_j = int(lines[j+1])
        temp = target_sum - expense_i - expense_j
        if temp in sums:
            print(f'Found triple {expense_i} + {expense_j} + {temp} = {target_sum}.\n{expense_i} * {expense_j} * {temp} = {expense_i * expense_j * temp}')
            quit()
        sums.add(expense_j)    
