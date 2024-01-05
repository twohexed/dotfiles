# Railfence Cipher
```python
s = input("Enter your string:- ")
k = int(input("Enter your key:- "))
enc = [[" " for i in range(len(s))] for j in range(k)] 
flag = 0
row = 0  
for i in range(len(s)):
    enc[row][i] = s[i]
    if row == 0:
        flag = 0
    elif row == k - 1:
        flag = 1
    if flag == 0:
        row += 1
    else:
        row -= 1  
for i in range(k):
    print(" ".join(enc[i]))  
ct = []
for i in range(k):
    for j in range(len(s)):
        if enc[i][j] != ' ':
            ct.append(enc[i][j]) 
cipher = "".join(ct)
print("Cipher text:-", cipher)



#Decryption starts here
dec = [[" " for i in range(len(cipher))] for j in range(k)]
flag = 0
row = 0
for i in range(len(cipher)):
    dec[row][i] = '*'
    if row == 0:
        flag = 0
    elif row == k - 1:
        flag = 1
    if flag == 0:
        row += 1
    else:
        row -= 1

index = 0
for i in range(k):
    for j in range(len(cipher)):
        if dec[i][j] == '*' and index < len(cipher):
            dec[i][j] = cipher[index]
            index += 1

  

result = []
row, col = 0, 0
for i in range(len(cipher)):
    if dec[row][col] != '*':
        result.append(dec[row][col])
        col += 1
    if row == 0:
        flag = 0
    elif row == k - 1:
        flag = 1
    if flag == 0:
        row += 1
    else:
        row -= 1  

plaintext = "".join(result)

print("Decrypted text:", plaintext)
```

<hr>
# Polyalphabetic cipher

## Type -1
```Python
def encrypt(plaintext, key):
    ciphertext = ""
    key = key.upper()
    key_index = 0  
    for char in plaintext:
        if char.isalpha():
            shift = ord(key[key_index % len(key)]) - ord('A')  
            if char.isupper():
                encrypted_char = chr((ord(char) + shift - ord('A')) % 26 + ord('A'))
            else:

                encrypted_char = chr((ord(char) + shift - ord('a')) % 26 + ord('a'))  
            ciphertext += encrypted_char    
            key_index += 1
        else:
            ciphertext += char
    return ciphertext  

def decrypt(ciphertext, key):
    plaintext = ""
    key = key.upper()
    key_index = 0  
    for char in ciphertext:
        if char.isalpha():
            shift = ord(key[key_index % len(key)]) - ord('A')
            if char.isupper():
                decrypted_char = chr((ord(char) - shift - ord('A') + 26) % 26 + ord('A'))
            else:
                decrypted_char = chr((ord(char) - shift - ord('a') + 26) % 26 + ord('a'))
            plaintext += decrypted_char
            key_index += 1
        else:
            plaintext += char
    return plaintex    

plaintext = input("Enter the plaintext: ").upper()
key = input("Enter the key: ").upper() 
ciphertext = encrypt(plaintext, key)
print("Encrypted:", ciphertext)
decrypted_text = decrypt(ciphertext, key)
print("Decrypted:", decrypted_text)
```
## Type -2 (vigenere) 
```Python
def encrypt_vigenere(plaintext, key):
    ciphertext = ""
    key = key.upper()
    key_index = 0  
    for char in plaintext:
        if char.isalpha():
            shift = ord(key[key_index % len(key)]) - ord('A')
            key_index += 1
              if char.isupper():
                encrypted_char = chr((ord(char) + shift - ord('A')) % 26 + ord('A'))
            else:
                encrypted_char = chr((ord(char) + shift - ord('a')) % 26 + ord('a'))
            ciphertext += encrypted_char
        else:
            ciphertext += char
      return ciphertext  
def decrypt_vigenere(ciphertext, key):
    plaintext = ""
    key = key.upper()
    key_index = 0  
    for char in ciphertext:
        if char.isalpha():
            shift = ord(key[key_index % len(key)]) - ord('A')
            key_index += 1  
            if char.isupper():
                decrypted_char = chr((ord(char) - shift - ord('A') + 26) % 26 + ord('A'))
            else:
                decrypted_char = chr((ord(char) - shift - ord('a') + 26) % 26 + ord('a'))  
            plaintext += decrypted_char
        else:
            plaintext += char  

    return plaintext
  
plaintext = input("Enter the plaintext: ").upper()
key = input("Enter the key: ").upper()
ciphertext = encrypt_vigenere(plaintext, key)
print("Encrypted:", ciphertext) 
decrypted_text = decrypt_vigenere(ciphertext, key)
print("Decrypted:", decrypted_text)
```