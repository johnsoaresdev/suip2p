module p2p_escrow::p2p_escrow {
    use std::option;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::balance;
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;

    /// Listing simples para custodiar um NFT (representado por um objeto genérico `T` possuidor de UID)
    struct Listing<phantom T> has key {
        id: UID,
        seller: address,
        price: u64,
        active: bool
    }

    public fun create_listing<T: key>(nft: T, price: u64, ctx: &mut TxContext): Listing<T> {
        let seller = tx_context::sender(ctx);
        // Transfere NFT para dentro do Listing (escrow)
        let id = object::new(ctx);
        // Guardamos `nft` dentro de um objeto child de Listing via wrapping
        // Para simplicidade no exemplo, omitimos armazenamento do próprio `nft`.
        // Em uma versão real, o Listing deveria manter/possuir o `nft` (ex: via wrapper).
        let listing = Listing<T> { id, seller, price, active: true };
        listing
    }

    /// Aceita o listing pagando em SUI
    public fun accept_listing<T: key>(mut listing: Listing<T>, mut payment: Coin<SUI>, ctx: &mut TxContext) {
        assert!(listing.active, 0);
        let buyer = tx_context::sender(ctx);
        let price = listing.price;

        // Verifica valor e envia ao vendedor
        let paid = coin::value(&payment);
        assert!(paid >= price, 1);
        let change = coin::split(&mut payment, paid - price);
        // envia price ao seller
        transfer::transfer(payment, listing.seller);

        // Transferiria o NFT ao comprador aqui (omisso no exemplo).

        // Marca inativo e destrói o objeto Listing (exemplo)
        listing.active = false;
        // envia troco ao buyer
        transfer::transfer(change, buyer);
        // Exemplo simples: não persistimos estado do Listing.
        // Em produção, persista e emita eventos.
        drop_listing(listing);
    }

    fun drop_listing<T>(listing: Listing<T>) {
        let Listing { id, seller: _, price: _, active: _ } = listing;
        object::delete(id);
    }
}
