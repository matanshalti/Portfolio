# creating dictionary
user_accounts = {"username": "sysadmin_matan", "access_level": "high", "is_active": False, "login_count": 0}

# modify to active
user_accounts["is_active"] = True

# add last login ip
user_accounts["last_login_ip"] = "192.168.1.101"

# after changes, access level stays the same: high
print(f"access level for {user_accounts['username']} is: {user_accounts['access_level']}")