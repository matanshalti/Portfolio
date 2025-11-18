cpu_load = 0.85

if cpu_load > 0.9:
    print("CRITICAL: CPU load is too high!")
elif cpu_load > 0.7:
    print("WARNING: CPU load is high.")
else:
    print("OK: CPU load is normal.")