# Caeser Cipher
```Python
def encrypt(text, s):
    result = ""
    for i in range(len(text)):
        char = text[i]
        if char.isalpha():
            if char.isupper():
                result += chr((ord(char) + s - 65) % 26 + 65)
            else:
                result += chr((ord(char) + s - 97) % 26 + 97)

        else:
            result += char
    return result  

def decrypt(text, s):


    return encrypt(text, -s)


text = input("Enter the value to be encrypted: ")

shift = int(input("Enter the value of the shift: "))

  

# Encryption

cipher_text = encrypt(text, shift)

print("Encrypted Text: " + cipher_text)

  

# Decryption

decrypted_text = decrypt(cipher_text, shift)

print("Decrypted Text: " + decrypted_text)
```

<hr>
# GUI PROGRAM FOR THE CEASER CIPHER 
```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Caesar Cipher</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }

        #container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
        }

        h1 {
            color: #333;
        }

        input, select, button {
            margin: 10px 0;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        button {
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }

        #result {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div id="container">
    <h1>Caesar Cipher</h1>
    <form id="cipherForm">
        <label for="text">Text:</label>
        <input type="text" id="text" name="text" required>

        <label for="key">Key:</label>
        <input type="number" id="key" name="key" required>

        <label for="operation">Operation:</label>
        <select id="operation" name="operation" required>
            <option value="encrypt">Encryption</option>
            <option value="decrypt">Decryption</option>
        </select>

        <button type="button" onclick="performCipher()">Perform Cipher</button>
    </form>

    <div id="result"></div>
</div>

<script>
    function performCipher() {
        var text = document.getElementById("text").value;
        var key = parseInt(document.getElementById("key").value);
        var operation = document.getElementById("operation").value;

        if (operation === "encrypt") {
            document.getElementById("result").innerText = "Cipher Text: " + caesar(text, key);
        } else if (operation === "decrypt") {
            document.getElementById("result").innerText = "Plain Text: " + decipher(text, key);
        }
    }

    function caesar(string, ckey) {
        var cipher = '';
        for (var i = 0; i < string.length; i++) {
            var char = string[i];
            if (char === ' ') {
                cipher += char;
            } else if (char.match(/[A-Z]/)) {
                cipher += String.fromCharCode((char.charCodeAt(0) + ckey - 65) % 26 + 65);
            } else if (char.match(/[a-z]/)) {
                cipher += String.fromCharCode((char.charCodeAt(0) + ckey - 97) % 26 + 97);
            } else {
                cipher += char;
            }
        }
        return cipher;
    }

    function decipher(string, ckey) {
        var plain = '';
        for (var i = 0; i < string.length; i++) {
            var char = string[i];
            if (char === ' ') {
                plain += char;
            } else if (char.match(/[A-Z]/)) {
                plain += String.fromCharCode((char.charCodeAt(0) - ckey - 65 + 26) % 26 + 65);
            } else if (char.match(/[a-z]/)) {
                plain += String.fromCharCode((char.charCodeAt(0) - ckey - 97 + 26) % 26 + 97);
            } else {
                plain += char;
            }
        }
        return plain;
    }
</script>

</body>
</html>
```

<hr>
# Monoalphabetic Cipher
```python
import random
def generate_key():
    # Generate a random permutation of the alphabet
    alphabet = list("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    random.shuffle(alphabet)
    key = dict(zip("ABCDEFGHIJKLMNOPQRSTUVWXYZ", alphabet))
    return key  
def encrypt(plaintext, key):
    ciphertext = ""
    for char in plaintext:
        if char.isalpha():
            # Preserve the case of the letter
            is_upper = char.isupper()
            char = char.upper()
            # Encrypt the letter using the key
            if char in key:
                encrypted_char = key[char]
                # Restore the original case
                if not is_upper:
                    encrypted_char = encrypted_char.lower()
                ciphertext += encrypted_char
            else:
                # Keep non-alphabetic characters unchanged
                ciphertext += char
        else:
            # Keep non-alphabetic characters unchanged
            ciphertext += char
    return ciphertext  
def decrypt(ciphertext, key):
    # Create a reverse key for decryption
    reverse_key = {v: k for k, v in key.items()}
    plaintext = ""
    for char in ciphertext:
        if char.isalpha():
            # Preserve the case of the letter
            is_upper = char.isupper()
            char = char.upper()
            # Decrypt the letter using the reverse key
            if char in reverse_key:
                decrypted_char = reverse_key[char]
                # Restore the original case
                if not is_upper:
                    decrypted_char = decrypted_char.lower()
                plaintext += decrypted_char
            else:
                # Keep non-alphabetic characters unchanged
               plaintext += char
        else:
            # Keep non-alphabetic characters unchanged
            plaintext += char
    return plaintext  
# Main fucntion here >>>>>>>>>>>>>>>>>>>>>>>
key = generate_key()
plaintext = "Hello, World!"
print(key)
encrypted_text = encrypt(plaintext, key)
decrypted_text = decrypt(encrypted_text, key) 
print("Original Text:", plaintext)
print("Encrypted Text:", encrypted_text)
print("Decrypted Text:", decrypted_text)
```