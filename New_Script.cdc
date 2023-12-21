import MyContract from 0x06

pub fun main(account: Address): MyContract.CustomDataList {
    return MyContract.customDataList[account]!
}
