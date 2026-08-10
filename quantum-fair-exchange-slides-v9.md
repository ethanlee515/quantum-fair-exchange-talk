# Quantum Fair Exchange — Presentation Draft

> Working Markdown for the 45-minute theory-group presentation.
> We will refine this slide-by-slide. Notes in brackets are production/speaker notes, not necessarily slide text.

# Title

**Quantum Fair Exchange**

[TODO: authors / affiliations / date]

# Fair Exchange: Who Goes First?

[Large visual: Alice on the left, Bob on the right.]

**Alice**                                  **Bob**

$100                 ⇄                 🎫 Digital Ticket

## Who goes first?

- If Alice pays first, Bob can take the money and disappear.
- If Bob sends the ticket first, Alice can take the money and disappear.

**Goal:** Either both get what they want, or neither does.

### Speaker notes

- Start from the intuitive problem, before introducing cryptographic definitions.
- “Digital ticket” can mean a concert ticket, a game activation/serial code, or a gift-card code.
- Since this is a cryptography talk, Alice and Bob do not necessarily trust each other; either may cheat.
- Pause at “Who goes first?” before explaining the two cheating cases.
- This slide should be mostly visual and light on text.

---

# The Obvious Solution: A Trusted Third Party

[Large visual: the ticket goes directly from Bob to Alice; only the payment goes through the trusted institution.]

                              🏦 Bank / Card Network
                               │
                          payment / dispute
                               │
                               ▼

**Alice**  ------------------- $100 ------------------->  **Bob**
   ▲                                                       │
   │                                                       │
   └---------------- 🎫 Digital Ticket --------------------┘

The trusted third party can manage the payment and intervene if the exchange goes wrong.

Examples:
- Credit cards: disputes / chargebacks
- Online marketplaces

But what if we want **cash-like exchange**?

> Can Alice and Bob exchange directly?

This is one motivation for **cryptocurrency**:
transactions need not go through a trusted intermediary.

Later, we will consider another possibility:

> **Quantum money as digital cash.**

**Fair exchange matters when Alice and Bob transact directly.**

### Speaker notes

- The fair-exchange problem has an obvious real-world solution: trust someone else.
- With a credit card, if something goes wrong, a trusted institution can intervene through a dispute / chargeback mechanism.
- Do not dwell on the exact mechanics of the digital-ticket example; the point is that many real-world systems rely on trusted institutions.
- Contrast this with physical cash: when Alice hands Bob a banknote, the central bank does not participate in or approve that particular transaction.
- This motivates forms of digital value that can be transferred without requiring a trusted intermediary to approve every transaction.
- Cryptocurrency is the familiar example: a direct transaction need not go through a trusted intermediary.
- Preview quantum money as another possible form of digital cash. We will explain it on the next slide rather than defining it here.
- This is the setting in which fair exchange becomes interesting for the talk: Alice and Bob transact directly, so there is no trusted mediator available to resolve the exchange.
- Avoid saying that cryptocurrency has “no trusted parties” at all. The narrower claim is that a direct transaction need not be mediated by a trusted intermediary.

---

# Digital Cash: Blockchain vs. Quantum Money

| | Cryptocurrency / Blockchain | Quantum Money |
|---|---|---|
| **Issuance** | Mining / protocol | Bank / issuer |
| **Prevent double spending** | Global ledger / consensus | No-cloning + cryptography |
| **Transfer** | Record the transfer on a global blockchain | Send the quantum state |
| **Fair exchange** | Atomic swaps / smart contracts | **???** |

**Quantum money behaves more like a digital banknote.**

### Speaker notes

- Cryptocurrency and quantum money are two very different approaches to digital cash.
- For cryptocurrency, issuance can be governed by mining or the protocol; for quantum money, think of a bank or issuer minting quantum banknotes.
- The key contrast for this talk is transfer: cryptocurrency records a transfer on global infrastructure, while quantum money can be imagined as sending the money state itself.
- The bank may mint quantum money without mediating every payment.
- For blockchain-based assets, fair exchange can be implemented using mechanisms such as atomic swaps and smart contracts.
- Pause at the final **???**.
- Transition: “What is the analogue for quantum money? That is the question of this project.”
- We are deliberately simplifying the quantum-money column: no-cloning alone is not a construction of secure quantum money.

---

# Classical Fair Exchange

[Large visual: an ideal fair-exchange functionality.]

```text
 Alice                         Bob
   |                            |
  $_A                          $_B
   |                            |
   v                            v
       +------------------+
       |   Fair Exchange  |
       +------------------+
   |                            |
   v                            v
  $_B                          $_A
```

If both inputs are valid, **swap them**.

### Speaker notes

- Abstract away the implementation and imagine an ideal fair-exchange box.
- Alice submits her classical asset `$_A`; Bob submits `$_B`.
- If both inputs are valid, the functionality swaps them.
- Keep this slide simple; the cheating / rejection behavior comes next.

---

# Classical Fair Exchange: Rejection

[Use essentially the same visual as the previous slide, but Bob submits garbage.]

```text
 Alice                         Bob
   |                            |
  $_A                        garbage
   |                            |
   v                            v
       +------------------+
       |   Fair Exchange  |
       +------------------+
   |
   v
  Rej
```

If Bob submits an invalid asset, Alice receives **Rej**.

### Speaker notes

- Bob may cheat and submit garbage instead of a valid asset.
- The ideal functionality rejects the exchange and tells Alice `Rej`.
- There is no need to return `$_A` to Alice: this is classical information, so Alice already knows / can retain her own input.
- This apparently trivial point will become important when the asset is quantum.

---

# Quantum Fair Exchange: Rejection?

[Use the same layout as the classical rejection slide. Change only Alice's asset from classical to quantum.]

```text
 Alice                         Bob
   |                            |
 |$_A⟩                      garbage
   |                            |
   v                            v
       +------------------+
       |   Fair Exchange  |
       +------------------+
   |
   v
  Rej
```

## Where is Alice's money?

### Speaker notes

- Change only one thing from the previous slide: Alice's asset is now a quantum state.
- Classically, returning only `Rej` was fine because Alice could retain her classical input.
- But Alice may have sent her only copy of `|$_A⟩` into the protocol.
- If Bob cheats and the protocol simply rejects, Alice may have lost her asset.
- Pause on: “Where is Alice's money?”
- This is the point where the classical ideal functionality is no longer the right notion.

---

# Quantum Fair Exchange: Rejection

[Keep the same diagram, but now return Alice's quantum asset on rejection.]

```text
 Alice                         Bob
   |                            |
 |$_A⟩                      garbage
   |                            |
   v                            v
       +------------------+
       |   Fair Exchange  |
       +------------------+
   |
   v
 |$_A⟩ + Rej
```

If Bob submits an invalid asset, Alice gets her quantum asset back.

### Speaker notes

- For quantum fair exchange, rejection must preserve the honest party's asset.
- If Bob cheats, Alice should not merely learn that the exchange failed; she should recover a usable quantum asset.
- Unlike in the classical case, this requirement is nontrivial because Alice cannot in general keep a backup copy of an unknown quantum state.
- This is the key change in the ideal functionality caused by no-cloning.
- Transition: now formalize what counts as a valid / usable returned quantum asset, especially when verification itself may transform the state.

---

# Literature Survey

- **Classical fair exchange:** studied since the early 1980s
  - A long line of work on contract signing, trusted third parties, etc.

- **Multiparty quantum computation with identifiable abort**
  - Identify the cheating party and abort
  - $\cite{mpqc-swia, mpqc-pv-swia}$

- **Verifiable quantum fully homomorphic encryption (VQFHE)**
  - A key technical building block

### Speaker notes

- Keep the classical literature deliberately brief: fair exchange has been studied since the early 1980s, and there is a long classical literature.
- Light transition if useful: “Aravind probably knows much more of this history than I do, so I'll skip ahead about forty years.”
- The closest quantum line of work for this talk is MPQC with identifiable abort.
- Identifiable abort gives accountability: if someone cheats, we can identify the cheating party and abort.
- For fair exchange, accountability alone does not answer what happens to the honest party's quantum asset.
- Mention VQFHE only as a technical building block here; defer the technical review until after the main goals / theorems.

---

# Main Goals

We propose an ideal functionality for **quantum fair exchange**, adapting classical fair exchange to the limitations imposed by quantum no-cloning.

We aim to show two complementary results:

1. **Impossibility with a classical trusted third party**
   - Quantum fair exchange is impossible in general, even with a classical trusted third party.

2. **Possibility with limited quantum capabilities**
   - Quantum fair exchange can be realized with a trusted third party that has **quantum pre-processing and storage**.
   - During the online phase, the trusted third party performs no quantum computation other than **SWAP gates**.

Finally, we extend the construction to the **$n$-party exchange** setting.

### Speaker notes

- These are goals / ongoing results, so keep the language consistent with the abstract: “we aim to show,” rather than presenting everything as a finished theorem.
- Emphasize the complementarity of the two main results: a fully classical trusted party is insufficient, but surprisingly limited quantum capabilities suffice.
- The important resource question is not simply “trusted party or no trusted party,” but what quantum capabilities the trusted party needs.
- Do not explain the technical reason yet. The next section can start with the impossibility result and its intuition.
- Mention the $n$-party extension briefly; it does not need equal visual weight with the two main goals.

---

# Next slide

[TODO: Impossibility with a classical trusted third party — theorem statement / intuition first, followed by technical details.]
