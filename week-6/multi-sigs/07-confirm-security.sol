// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners; // owners of the wallet
    uint256 public required; // number of confirmations required for a transaction

    // Transaction struct - işlem bilgilerini tutar
    struct Transaction {
        address destination; // İşlemin gönderileceği adres
        uint256 value; // Gönderilecek ETH miktarı (wei cinsinden)
        bool executed; // İşlem çalıştırıldı mı?
    }

    // Transaction storage - tüm işlemleri tutar
    Transaction[] public transactions;

    // Confirmations mapping - nested mapping
    // Transaction ID -> Owner Address -> Confirmed (true/false)
    mapping(uint256 => mapping(address => bool)) public confirmations;

    constructor(address[] memory _owners, uint256 _required) {
        // Error Handling 1: Hiç owner yoksa hata ver
        require(_owners.length > 0, "No owner addresses provided");

        // Error Handling 2: Required confirmations sıfır olamaz
        require(
            _required > 0,
            "Required confirmations must be greater than zero"
        );

        // Error Handling 3: Required confirmations owner sayısından fazla olamaz
        require(
            _required <= _owners.length,
            "Required confirmations cannot exceed number of owners"
        );

        owners = _owners; // set the owners
        required = _required; // set the required confirmations
    }

    // Transaction count - toplam işlem sayısını döndürür
    function transactionCount() public view returns (uint256) {
        return transactions.length;
    }

    // Add Transaction - yeni işlem ekler
    function addTransaction(
        address destination,
        uint256 value
    ) public returns (uint256) {
        // Yeni transaction struct oluştur
        Transaction memory newTransaction = Transaction({
            destination: destination,
            value: value,
            executed: false // Varsayılan olarak false
        });

        // Transaction'ı storage'a ekle
        transactions.push(newTransaction);

        // Transaction ID'yi döndür (zero-based: 0, 1, 2, ...)
        return transactions.length - 1;
    }

    // Confirm Transaction - transaction'ı onaylar
    function confirmTransaction(uint256 transactionId) public {
        // 🔒 GÜVENLİK KONTROLÜ: Sadece owner'lar onaylayabilir
        require(isOwner(msg.sender), "Only owners can confirm transactions");

        // Transaction var mı kontrol et
        require(
            transactionId < transactions.length,
            "Transaction does not exist"
        );

        // Daha önce onaylanmamış olmalı
        require(
            !confirmations[transactionId][msg.sender],
            "Transaction already confirmed by this owner"
        );

        // Onayı kaydet
        confirmations[transactionId][msg.sender] = true;
    }

    // Get Confirmations Count - transaction'ın onay sayısını döndürür
    function getConfirmationsCount(
        uint256 transactionId
    ) public view returns (uint256) {
        require(
            transactionId < transactions.length,
            "Transaction does not exist"
        );

        uint256 count = 0;

        // Tüm owner'ları kontrol et
        for (uint256 i = 0; i < owners.length; i++) {
            if (confirmations[transactionId][owners[i]]) {
                count++;
            }
        }

        return count;
    }

    // Helper function - address'in owner olup olmadığını kontrol eder
    function isOwner(address addr) private view returns (bool) {
        for (uint256 i = 0; i < owners.length; i++) {
            if (owners[i] == addr) {
                return true;
            }
        }
        return false;
    }
}
