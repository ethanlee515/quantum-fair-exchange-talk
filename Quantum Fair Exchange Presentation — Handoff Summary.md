# Quantum Fair Exchange Presentation — Handoff Summary

## Context

I am preparing a **45-minute theory-group presentation** on our ongoing project, **Quantum Fair Exchange**. The audience includes Aravind and his students, plus researchers from other groups, so not everyone should be assumed to know cryptography.

We are designing the content first in Markdown. Later I plan to use Codex to turn it into LaTeX/Beamer.

Current checkpoint:

`quantum-fair-exchange-slides-v9.md`

The presentation is unfinished. We have designed the motivation through the **Main Goals** slide. Next we should work on the **impossibility result**.

---

# Current Story

## 1. Motivation: ordinary fair exchange

Start with an intuitive **digital ticket** example.

Alice wants to pay Bob `$100`; Bob wants to give Alice a digital ticket.

The ticket could orally be described as:
- a concert ticket,
- a game serial number,
- a gift-card code, etc.

Main question:

> **Who goes first?**

If Alice pays first, Bob can disappear.  
If Bob sends the ticket first, Alice can disappear.

This introduces fair exchange without assuming cryptographic background.

---

## 2. The obvious solution: trusted third party

Next acknowledge the obvious real-world solution.

Examples:
- credit-card disputes / chargebacks,
- online marketplaces.

Important diagram detail:

- Bob sends the **ticket directly to Alice**.
- Alice's **payment goes through the bank/card network to Bob**.
- The bank does NOT receive the ticket.

The trusted institution can intervene if something goes wrong.

Then ask:

> **But what if we want cash-like exchange?**

Important conceptual claim:

> A transaction need not always be mediated by a trusted intermediary.

Cryptocurrency is introduced as a familiar example.

Quantum money is briefly previewed as another possible form of digital cash.

Key sentence:

> **Fair exchange matters when Alice and Bob transact directly.**

Do NOT claim that cryptocurrency literally has no trusted parties. The narrower point is that no trusted intermediary needs to approve each transaction.

---

## 3. Digital Cash: Blockchain vs. Quantum Money

Current table:

| | Cryptocurrency / Blockchain | Quantum Money |
|---|---|---|
| **Issuance** | Mining / protocol | Bank / issuer |
| **Prevent double spending** | Global ledger / consensus | No-cloning + cryptography |
| **Transfer** | Record the transfer on a global blockchain | Send the quantum state |
| **Fair exchange** | Atomic swaps / smart contracts | **???** |

Bottom:

> **Quantum money behaves more like a digital banknote.**

Important intuition:

A quantum-money bank may mint the money without mediating every payment.

The final `???` is deliberate. Pause there and say something like:

> What is the analogue for quantum money? That's the question of this project.

---

# Fair Exchange Functionality Sequence

This is designed as several visually almost-identical slides, changing only one thing at a time.

## 4. Classical Fair Exchange

Alice inputs `$_A`; Bob inputs `$_B`.

Ideal box swaps them:

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

If both inputs are valid: **swap them**.

---

## 5. Classical Fair Exchange: Rejection

Bob now cheats:

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

Alice only gets `Rej`.

Important: **do NOT return `$_A`** in the classical ideal functionality. That would be pointless because Alice's input is classical information; she can already retain/know it.

This becomes the setup for the quantum problem.

---

## 6. Quantum Fair Exchange: Rejection?

Change exactly one thing:

`$_A` → `|$_A⟩`.

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

Then put prominently:

> **Where is Alice's money?**

This is intended to be the main conceptual “aha” moment.

Classically, `Rej` was enough. But Alice may have sent her only copy of the quantum state into the protocol.

Do NOT get into technical details about verification/recoverability here. Those come after the main theorem slides.

---

## 7. Quantum Fair Exchange: Rejection

Now modify the output:

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

If Bob cheats, Alice gets her quantum asset back.

This motivates adapting classical fair exchange around **no-cloning**.

Again, leave precise technical issues about what “getting the asset back” means until later.

---

# 8. Literature Survey

Keep this intentionally short.

Current structure:

- **Classical fair exchange:** studied since the early 1980s
  - long literature on contract signing, trusted third parties, etc.

- **Multiparty quantum computation with identifiable abort**
  - identify the cheating party and abort
  - `\cite{mpqc-swia, mpqc-pv-swia}`

- **Verifiable quantum fully homomorphic encryption (VQFHE)**
  - a key technical building block

Possible joke / oral transition:

> Aravind probably knows much more of this history than I do, so I'll skip ahead about forty years.

Main MPQC connection:

Identifiable abort gives **accountability**, but fair exchange additionally cares about what happens to the honest party's quantum asset.

VQFHE should only be mentioned here. Its technical review comes later.

---

# 9. Main Goals

Based closely on the project abstract.

Abstract:

> We present our ongoing project on quantum fair exchange.
> We propose an ideal functionality by adapting classical fair exchange around the quantum no-cloning limitations.
> From there, we aim to show two complementary results:
>
> 1. Quantum fair exchange is impossible in general, even with a classical trusted third party.
> 2. Quantum fair exchange can be realized if we allow a trusted third party with quantum pre-processing and storage. The trusted third party needs not perform quantum computations (other than SWAP gates) during the online phase.
>
> Finally, we extend our construction to the n-party exchange setting.

Current slide:

### Main Goals

We propose an ideal functionality for **quantum fair exchange**, adapting classical fair exchange to the limitations imposed by quantum no-cloning.

We aim to show two complementary results:

1. **Impossibility with a classical trusted third party**
   - Quantum fair exchange is impossible in general, even with a classical trusted third party.

2. **Possibility with limited quantum capabilities**
   - Quantum fair exchange can be realized with a trusted third party that has **quantum pre-processing and storage**.
   - During the online phase, the trusted third party performs no quantum computation other than **SWAP gates**.

Finally, extend to **n-party exchange**.

Important: this is an ongoing project, so retain language like **“we aim to show”** rather than presenting unfinished results as completed theorems.

---

# Overall Story

The intended narrative is:

**Who goes first?**

→ obvious solution: **trusted intermediary**

→ but digital cash motivates **direct exchange**

→ blockchain has **atomic swaps / smart contracts**

→ quantum money: **???**

→ classical fair exchange ideal functionality

→ classical rejection only needs `Rej`

→ replace classical asset with quantum state

→ **Where is Alice's money?**

→ quantum fair exchange must preserve the honest party's quantum asset

→ related work

→ **Main Goals**

→ next: **Impossibility with a classical TTP**

The current judgment is that this story works well and does not need major restructuring.

---

# Timing

Estimated time through Main Goals:

**about 13–16 minutes**, with ~14 minutes as a good rehearsal target.

Roughly:

- Intro + initial fair-exchange problem: ~2 min
- Trusted third party: ~2–2.5 min
- Blockchain vs quantum money: ~2–2.5 min
- Classical functionality slides: ~2 min
- Quantum functionality slides: ~2–3 min
- Literature survey: ~1–1.5 min
- Main Goals: ~1.5–2 min

For a 45-minute theory talk, that leaves about 30 minutes.

Tentative remaining allocation:

- Impossibility: **8–10 min**
- Construction intuition: **~5 min**
- VQFHE review: **~5 min**
- Protocol construction/security: **8–10 min**
- n-party extension + conclusion: **2–3 min**

Next task:

> **Design the Impossibility section, starting with intuition before technical details.**