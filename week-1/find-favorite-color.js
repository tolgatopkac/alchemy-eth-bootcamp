const { sha256 } = require("ethereum-cryptography/sha256");
const { toHex, utf8ToBytes } = require("ethereum-cryptography/utils");

// sha256 :
// Verilen herhangi bir girdinin SHA-256 hash'ini hesaplamak için kullanılır.

// toHex : Byte dizisini (Uint8Array) formatındaki bir hash çıktısını
// daha kolay okunabilir karşılaştıralabilir bir onaltılık (hexadecimal) string'e dönüştürmek için kullanılır.

// utf8ToBytes : UTF-8 karakter dizilerini byte dizilerine dönüştürmek için kullanılır.

const COLORS = ["red", "green", "blue", "yellow", "pink", "orange"];

function findColor(hash) {
  for (const color of COLORS) {
    const colorHash = sha256(utf8ToBytes(color));

    if (colorHash.length === hash.length) {
      let isMatch = true;
      for (let i = 0; i < colorHash.length; i++) {
        if (colorHash[i] !== hash[i]) {
          isMatch = false;
          break;
        }
      }
      if (isMatch) {
        console.log(`Found color: ${color}`);
        return color;
      }
    }
  }
}
