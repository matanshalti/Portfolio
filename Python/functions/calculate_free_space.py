# calculate precentage left of free disk space
def calculate_free_space(total_space, used_space):
    return (total_space-used_space)/total_space*100

total = 500
used = 350

print(f"free space is {calculate_free_space(total, used)}%")