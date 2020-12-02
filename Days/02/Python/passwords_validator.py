import os

def check_character_count(password_entry):
    limits, character, password = password_entry.split()

    min_limit, max_limit = map(int, limits.split("-"))
    character = character[0]

    number_of_occurences = len([c for c in password if c == character])

    return min_limit <= number_of_occurences <= max_limit

def check_character_match(password_entry):
    limits, character, password = password_entry.split()

    index_one, index_two = map(int, limits.split("-"))
    character = character[0]

    character_is_on_first_index = password[index_one - 1] == character
    character_is_on_second_index = password[index_two - 1] == character

    return character_is_on_first_index ^ character_is_on_second_index

dirname = os.path.dirname(__file__)
filename = os.path.join(dirname, '../Input/passwords.txt')
f = open(filename, 'r')

lines = f.readlines()
print(f'Valid passwords according to first policy: {sum(map(check_character_count, lines))}')
print(f'Valid passwords according to second policy: {sum(map(check_character_match, lines))}')