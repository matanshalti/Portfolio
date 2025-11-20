def check_rule (rule):
    if rule["port"] > 1024 and rule["protocol"] != "ICMP":
        return True
    return False

test_rule = {"port": 8080, "protocol": "TCP", "action": "ALLOW"}

if check_rule(test_rule):
    print("Secure rule")
else:
    print("Unsecure rule")