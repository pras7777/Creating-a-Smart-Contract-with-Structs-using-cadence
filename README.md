# Creating-a-Smart-Contract-with-Structs-using-cadence
![image](https://github.com/pras7777/Creating-a-Smart-Contract-with-Structs-using-cadence/assets/150328549/0f0500a8-f563-4fa5-9303-ef95b7ecc620)

Overview
This repository contains the source code for a smart contract written in Cadence, a resource-oriented programming language designed for smart contracts on the Flow blockchain. The contract includes a struct, CustomDataList, to store custom data associated with unique addresses. Additionally, it provides a transaction and script to interact with the contract.

## Smart Contract: MyContract
### Struct: CustomDataList
The CustomDataList struct is defined with the following fields:

shopName (String): The name of the shop.
addressName (String): The address of the shop.
phone (Int): The phone number associated with the shop.
account (Address): The address linked to the data.

```
pub struct CustomDataList {
    pub let shopName: String
    pub let addressName: String
    pub let phone: Int
    pub let account: Address

    init(_shopName: String, _addressName: String, _phone: Int, _account: Address) {
        self.shopName = _shopName
        self.addressName = _addressName
        self.phone = _phone
        self.account = _account
    }
}
```
### Public Variable: customDataList
The contract includes a public variable, customDataList, which is a dictionary mapping addresses to their corresponding CustomDataList.
```
pub var customDataList: {Address: CustomDataList}
```
### Public Function: addcustomDataList
The addcustomDataList function allows users to add custom data to the contract by providing the shop name, address, phone number, and their account address.
```
pub fun addcustomDataList(shopName: String, addressName: String, phone: Int, account: Address) {
    self.customDataList[account] = CustomDataList(
        _shopName: shopName,
        _addressName: addressName,
        _phone: phone,
        _account: account
    )
}
```
### Initialization: init
The init function initializes the customDataList dictionary when the contract is deployed.
```
init() {
    self.customDataList = {}
}
```
Transaction
Purpose
The transaction is designed to interact with the smart contract by calling the addcustomDataList function. It takes parameters such as shopName, addressName, phone, and account.
```
import MyContract from 0x06

transaction(shopName: String, addressName: String, phone: Int, account: Address) {
    prepare(signer: AuthAccount) {}

    execute {
        MyContract.addcustomDataList(shopName: shopName, addressName: addressName, phone: phone, account: account)
        log("Transaction Complete!")
    }
}
```
### Script
Purpose
The script allows users to query and read the custom data stored in the smart contract. It takes an account address as a parameter and returns the associated CustomDataList.
```
import MyContract from 0x06

pub fun getCustomData(account: Address): MyContract.CustomDataList? {
    let myContractRef = getAccount(0x06)!
        .getCapability<&MyContract{MyContract.Public}>(/public/myContractPath)
        .borrow()

    if let contract = myContractRef {
        return contract.customDataList[account]
    } else {
        return nil
    }
}
```
### Usage
To deploy and interact with this smart contract, follow these steps:

1.Deploy the smart contract to the Flow blockchain.
2.Execute the provided transaction to add custom data.
3.Use the script to read and retrieve custom data associated with a specific account.
### 
Feel free to explore and modify the code to suit your specific requirements. For additional guidance on deploying and interacting with Cadence smart contracts, refer to the Flow documentation.
