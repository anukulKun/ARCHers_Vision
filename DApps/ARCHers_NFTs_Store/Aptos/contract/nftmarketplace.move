module hello_market::marketplace {
    use std::signer;
    use std::string::String;
    use aptos_framework::guid; // Globally Unique Identifier
    use aptos_framework::coin;
    use aptos_framework::account;
    use aptos_framework::timestamp;
    use aptos_std::event::{Self as Event, EventHandling};
    use aptos_std::table::{Self as Table, Table};
    use aptos_token::token;
    use aptos_token::token_coin_swap::{list_token_for_swap, exchange_coin_for_tok};

    const SELLER_CAN_NOT_BE_BUYER: u64 = 1;
    const FEE_DENOMINATOR: u64 = 10000;

    struct MarketId has store, drop, copy {
        market_name: String,
        market_address: address,
    }

    struct Market has key {
        market_id: MarketId,
        fee_numerator: u64, // unsigned 64 bit integer
        fee_payee: address, // fixed typo
        signer_cap: account::SignerCapability,
    }

    struct OfferStore has key {
        offers: Table<token::TokenId, Offer>, // data structure: key value pair
    }

    struct Offer has drop, store {
        market_id: MarketId,
        seller: address,
        price: u64, // fixed hard-coded value
    }

    struct CreateMarketEvent has drop, store {
        market_id: MarketId,
        fee_numerator: u64, // fixed hard-coded value
        fee_payee: address,
    }

    struct ListTokenEvent has drop, store {
        market_id: MarketId,
        token_id: token::TokenId,
        seller: address,
        price: u64, // fixed hard-coded value
        timestamp: u64, // fixed hard-coded value
        offer_id: u64,
    }

    struct BuyTokenEvent has drop, store {
        market_id: MarketId,
        token_id: token::TokenId,
        seller: address,
        buyer: address,
        price: u64, // fixed hard-coded value
        timestamp: u64,
        offer_id: u64,
    }

    fun get_resource_account_cap(market_address: address): signer acquires Market {
        let market = borrow_global<Market>(market_address);
        account::create_signer_with_capability(&market.signer_cap)
    }

    fun get_royalty_fee_rate(token_id: token::TokenId): u64 {
        let royalty = token::get_royalty(token_id);
        let royalty_denominator = token::get_royalty_denominator(&royalty);
        let royalty_fee_rate = if royalty_denominator == 0 {
            0
        } else {
            token::get_royalty_numerator(&royalty) / royalty_denominator
        };
        royalty_fee_rate
    }

    public entry fun create_market<CoinType>(
        sender: &signer,
        market_name: string,
        fee_numerator: u64,
        fee_payee: address,
        initial_fund: u64
    ) acquires MarketEvents, Market {
        let sender_addr = signer::address_of(sender);
        let market_id = MarketId { market_name, market_address: sender_addr };
        // Additional logic for creating a market and handling initial funds
    
    if (!exists<MarketEvents>(sender_addr)) {
    move_to(sender, MarketEvents {
        create_market_event: account::new_event_handle<CreateMarketEvent>(sender),
        list_token_events: account::new_event_handle<ListTokenEvent>(sender),
        buy_token_event: account::new_event_handle<BuyTokenEvent>(sender)
    });
};
    if(!exists<OfferStore>(sender_addr)) {
    move to (sender, offerStore {
    offers: table::new()
    });
    };
    if (exists<Market>(sender_addr)) {
        let (resource_signer, signer_cap) = account::create_resource_account(sender, x"01");
        token::initialize_token_store(&resource_signer);
        let market_id = MarketId { market_name: "Market Name", market_address: sender_addr }; // Provide a name for the market or use some identifier
        let fee_numerator = 464; // You can define this value based on your requirements
        let fee_payee = sender_addr; // You can set this to a specific address or adjust as needed
        move_to(sender, Market {
            market_id: market_id,
            fee_numerator: fee_numerator,
            fee_payee: fee_payee,
            signer_cap: signer_cap
        });
        let market_events = borrow_global_mut<MarketEvents>(sender_addr);
        event::emit_event(&mut market_events.create_market_event, CreateMarketEvent {
            market_id: market_id,
            fee_numerator: fee_numerator,
            fee_payee: fee_payee
        });
};
let resource_signer = get_resource_account_cap(sender_addr);
if (!coin::is_account_registered<CoinType>(signer::address_of(&resource_signer))) {
    coin::register<CoinType>(&resource_signer);
};
if (initial_fund > 0) {
    coin::transfer<CoinType>(sender, signer::address_of(&resource_signer), initial_fund);
}



}
public entry fun list_token<CoinType> (
sender: &signer,
market_address: address,
market_name: string,
creator: address,
collection: String,
name: String,
propery version: u64,
price: u64
) acquires Market Events, Market, OfferStore {
let market_id = MarketId{ market_name, market_address};
let resource_signer = get_resource_account_cap (market_address);
let seller_addr = signer::address_of(seller);
let token_id = token::create_token_id_raw(creator, collection, name, propery_version);
let token = token: :withdraw_token (seller, token_id, 1);

token :: deposit_token(&resource_signer,token)
list_token_events<CoinType>(&resource_signer,creator,collection,name, propery_version,1,price,0);
let offer_Store = borrow_global_mut<offer_Store>(market_address);
table::add(&mut offer_Store.offers, token_id, Offer{
    market_id, seller:seller_addr, price

}) ;
let guid = account:: create_guild(&resource_signer);
let market_events = borrow_global_mut<MarketEvents>(market_address)


event::emit_event(&mut market_events.list_token_events, ListTokenEvent{
    market_id,
    token_id,
    seller : seller_addr,
    price,
    timestamp,
    offer_id: guid::creation_num(&guid)

});

}
public entry fun buy_token<CoinType>(
    buyer : &signer,
    market_address : address,
    market_name:string,
    creator: string,
    collection : name,
    name: string,
    propery_version:u64,
    price : u64,
    offer_id : u64
    )acquires market_events, market, offer_Store{
        let market_id = MarketId{
            market_name, market_address
        };
        let token_id = token :: create_token_id_raw(creator,collection,name,propery_version);
        let offer_Store = borrow_global_mut<offer_Store>(market_address);
        let seller = table::borrow (&offer_Store.offers, token_id).seller;
        let buyer_addr = signer::address_of(buyer)
        assert!(seller!= buyer)


        let resorces_signer = get_resource_account_cap(market_address);
        exchange_coin_for_token <CoinType>(buyer,price, signer::address_of(&resource_signer), creator, collection_name, propery_version,1)

        let royalty_fee = price*get_royalty_fee_rate(token_id);
        let marker = borrow_global<Market>(market_address);
        let market_fee = price
        let amount = price - market - royalty_fee;



        coin:: transfer <CoinType>(&resource_signer,seller, amount);
        table:: remove (&mut offer_Store.offers, token_id);
        let market_events = borrow_global_mut<market_events>(market_address);

        event::emit_event(&mut market_events.buy_token_event, BuyTokenEvent{
            market_id,
            token_id,
            seller,
            buyer:buyer_addr,
            price,
            timestamp:timestamp::new_microseconds(),
            offer_id

        })

    }

}
