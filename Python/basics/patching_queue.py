# challange starting state:
patch_queue = ["web-01", "db-01", "fw-01", "dns-01"]

#adding app-02 to end of list
patch_queue.append("app-02")
# firewall should be tested second
patch_queue.remove("fw-01")
patch_queue.insert(1, "fw-01")

#third item will be: db-01
print(f"the third item is {patch_queue[2]}")