module p2p_escrow::tests {
    use p2p_escrow::p2p_escrow;
    use sui::tx_context::TxContext;

    #[test]
    fun create_listing_works(ctx: &mut TxContext) {
        // Placeholder apenas valida compilação
        // p2p_escrow::create_listing<T>(..., 100, ctx);
        // Sem tipo T real no exemplo.
    }
}
