for server_num in range(1,6):
    print(f"Checking health of server {server_num}")
    attempts = 0
    logged_in = False
    while attempts < 3 and not logged_in:
        print("Attempting login...")
        attempts += 1
    print ("Maximum attempts reached.")