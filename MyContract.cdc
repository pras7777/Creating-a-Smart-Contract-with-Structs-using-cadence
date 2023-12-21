pub contract MyContract {

    pub var customDataList: {Address: CustomDataList}
    
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

    
    pub fun addcustomDataList(shopName: String, addressName: String, phone: Int , account: Address) {
        self.customDataList[account] = CustomDataList(
            _shopName: shopName,
            _addressName: addressName,
            _phone: phone,
            _account: account
        )
    }

    init() {
        self.customDataList = {}
    }
}
