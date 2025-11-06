import React from "react";
import Link from "next/link";

export default function Trade() {
  return (
    <main style={{padding: 24}}>
      <h1>Trade P2P</h1>
      <p>Protótipo de fluxo P2P. Implemente criação e aceitação de propostas.</p>
      <ul>
        <li>Criar oferta</li>
        <li>Listar ofertas ativas</li>
        <li>Aceitar oferta</li>
      </ul>
      <Link href="/">Voltar</Link>
    </main>
  );
}
