# in this file are the passwords and solves of OverTheWire levels

## Level 1

ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

## Level 2

263JGJPfgU6LtdEvgfWU1XP5yac29mFx

## Level 3

MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx

## Level 4

2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ

## Level 5

4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw

### Solve

Command used:

```bash
find ~/inhere -type f -size 1033c -not -perm -u+x
```

## Level 6

HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

## Level 7

morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj

## Level 8

dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc

### Solve

Had to use `sort` and `uniq` for this via piping:

- `sort` command sorts the files contents and `uniq -u` return all non **concurrently** repeating lines.

- So here, I had to do:
  
  ```bash
  sort data.txt | uniq -u
  ```

- This will, first sort the text file, then select the non concurrently reoccurring line.

## Level 9

4CKMh1JI91bUIZZPXDqGanal4xvAg0JM

### Solve

For this I used:

```bash
strings data.txt | grep "==="*
```

- The `strings` command extracted all human readable lines

- Then *piped* it to `grep` that fetched only the lines starting with a few (more then 2) `=` (equel signs).

## Level 10

FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey

### Solve

Used command `base64` for decoding:

```bash
base64 -d data.txt
```

## Level 11

dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr

### Solve:

The password was "encrypted" with Rot13

- Here in order to change multiple ranges with other ranges I used `tr` like this

- In bash:
  
  ```bash
  cat data.txt | tr "a-m n-z A-M N-Z" "n-z a-m N-Z A-M"
  ```

## Level 12

7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4

### Solve:

The file was hexdumped and compressed multiple times.

- I used the command `xxd -r` to revert the process of hexdumping back to binary.

- Then using the `file` command (followed by the filename), I figured out what type of compression was used each time.

- Then just a bunch of using `gzip`, `bzip2` and `tar` commands  for repeatedly decompressing file.

Also learned about `mktemp` for temp files and folders (needs flag for type).

- I created the following tmpdir:

- ```bash
  /tmp/matanshalti.pgR
  ```

## Level 13

FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn
