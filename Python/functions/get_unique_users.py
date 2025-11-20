def get_unique_users (event_list):
    unique_logins = set()
    for event in event_list:
        unique_logins.add(event["user"])
    return unique_logins

events = [
    {"id": 1, "user": "matan", "action": "login"},
    {"id": 2, "user": "guest", "action": "fail"},
    {"id": 3, "user": "matan", "action": "logout"}, # Duplicate
    {"id": 4, "user": "sysadmin", "action": "update"}
]

print(f"the following users made login:{get_unique_users(events)}")