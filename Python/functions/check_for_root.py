# imagine you've pulled a list of active users from a server. You need a simple function to flag any potential security risks.

def check_user (user_list):
    for i in user_list:
        if i == "root":
            return True
    return False
        
users = ["matan", "web_user", "root", "guest"]

if check_user(users):
    print("Security risk detected: A user has root previlages")
else:
    print("No security risks found")