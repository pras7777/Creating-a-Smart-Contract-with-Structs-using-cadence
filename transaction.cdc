import MyContract from 0x06

transaction(shopName: String, addressName: String, phone: Int, account: Address) {

    prepare(signer: AuthAccount) {}

    execute {
        MyContract.addcustomDataList(shopName: shopName, addressName: addressName, phone: phone, account: account)
        log("Transcation Complete!")
    }
}
