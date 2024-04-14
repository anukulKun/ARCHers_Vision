use std::coin;

struct NFT {
    id: u64,
    name: string,
    description: string,
    seller: address,
    price: coin::Coin, // Price denominated in Aptos coin
}

struct Marketplace {
    pub owner: address,
    pub listed_nfts: vector<u64>, 
}

public(script) fun initial_market_script() {
    let owner = signer();
    create Marketplace { owner, listed_nfts: vec::empty() };
}

public(friend) fun add_nft(account: &signer, nft: NFT) {
    let marketplace_storage = &mut resource::access::get<Marketplace>(!.marketplace);
    let nft_id = marketplace_storage.listed_nfts.length() as u64;
    marketplace_storage.listed_nfts.push_back(nft_id);
    resource::access::move_to<NFT>(account, nft_id, nft);
}

public(friend) fun buy_nft(account: &signer, nft_id: u64) {
    let marketplace_storage = &mut resource::access::get<Marketplace>(!.marketplace);
    let nft = resource::access::borrow<NFT>(account, nft_id);
    coin::transfer(account, &marketplace_storage.owner, nft.price);
    marketplace_storage.listed_nfts.remove(nft_id as usize);
    resource::access::move_from<NFT>(account, nft_id);
}
