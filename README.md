# NFT P2P Sui — Monorepo

Monorepo para um dApp de **troca P2P de NFTs** na **rede Sui**.
- Frontend: **Next.js + React + TypeScript** (`apps/web`)
- Contratos: **Sui Move** (`packages/contracts`)

## Requisitos
- Node 18+ e pnpm (`npm i -g pnpm`)
- Sui CLI (para testes de contrato): https://docs.sui.io/guides/developer/getting-started/sui-install

## Setup
```bash
pnpm install
```

### Web
```bash
pnpm --filter @app/web dev
```

### Contratos Move
```bash
cd packages/contracts
sui move build
sui move test
```

## Deploys
- Web: recomendado Vercel; conecte o repositório e faça deploy do branch `main`.
- Contratos: use scripts em `packages/contracts/scripts`. Os endereços ficam em `deployments/<network>/...`.

## Pastas
```
apps/web            # Next.js app
packages/contracts  # Sui Move package do escrow P2P
.github             # CI, templates e Dependabot
```

## Segurança
Veja `SECURITY.md`. Não faça commit de chaves privadas.
