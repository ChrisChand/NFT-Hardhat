require('dotenv').config()



const APP = {
    PORT: process.env.PORT
}

const CONTRACTS = {
    ADDRESS:{
        BORED_NFT: process.env.BORED_NFT_TOKEN,
    }
}

const BLOCKCHAIN = {
    RPC_URL: process.env.RPC_URL,
    PRIVATE_KEY: process.env.PRIVATE_KEY,
    ADMIN_ADDRESS:process.env.ADMIN_ADDRESS
}

module.exports = {
    APP,
    BLOCKCHAIN,
    CONTRACTS
}