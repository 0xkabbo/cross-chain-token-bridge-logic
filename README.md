# Cross-Chain Token Bridge (Lock & Mint)

This repository provides a high-quality, professional-grade implementation of the "Lock and Mint" bridge architecture. It is designed for developers building interoperability solutions between EVM-compatible blockchains.

## Architecture
1. **Source Chain:** User calls `lock()`. The bridge contract holds the original tokens.
2. **Off-chain Relayer:** Listens for the `Locked` event (logic not included, but interface provided).
3. **Destination Chain:** An authorized `Minter` role calls `mint()` to create "Wrapped" tokens for the user.
4. **Redemption:** The process is reversed to unlock original assets.

## Security Considerations
* **Access Control:** The `mint` and `unlock` functions are strictly restricted to a trusted `BridgeAuthority` or Multi-sig.
* **Reentrancy:** All state-changing functions utilize non-reentrant patterns to prevent drainage.

## License
MIT
