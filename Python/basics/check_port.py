port = 22
username = "root"

if port == 80:
    print("This is an HTTP web server.")
elif port == 443:
    print("This is an HTTPS web server.")
elif port == 22 and username == "root":
    print("WARNING: Root login detected on SSH port!")
elif port == 22:
    print("This is an SSH port.")
else:
    print(f"This is an unknown port: {port}")