# Quantum Fair Exchange Presentation — Handoff Summary

## Context

I am preparing a **45-minute theory-group presentation** on our ongoing project, **Quantum Fair Exchange**. The audience includes Aravind and his students, plus researchers from other groups, so not everyone should be assumed to know cryptography.

We are designing the content in Markdown and maintaining a matching
LaTeX/Beamer draft.

Current checkpoint:

`quantum-fair-exchange-slides-v9.md`

The presentation is unfinished. We now have the motivation, a four-slide
**impossibility result** that avoids the BB84 basis-guessing detour, two short
preliminary slides, and a four-slide **candidate construction**. The next major
content task is the n-party extension and conclusion; the VQFHE coverage is
deliberately marked for later revision.

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
  - `\cite{alon-et-al-identifiable-abort, chung-et-al-pvia}`

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

# 11–14. Impossibility Without the BB84 Detour

The talk uses a direct reduction from fair exchange to an operational cloning
game. It assumes the exchanged assets are **selectively uncloneable**: given
one valid instance of each input, an efficient algorithm cannot choose one
input and produce two usable versions of that same identified asset, except
with negligible probability.

The quantitative statement must be phrased carefully:

> Honest exchange success $p$ in $T$ rounds gives a cloning attack with success
> $\Omega(p/T)$.

Thus, when $p\approx1$ and $T$ is polynomial, the cloner succeeds with
non-negligible probability. The $1/T$ quantity belongs to the cloning attack,
not directly to the protocol's honest success probability.

The four slides are:

1. **Impossibility with a Classical Trusted Party**
   - state the direct reduction and the $\Omega(p/T)$ cloning probability;
   - keep the theorem informal while the precise model/error parameters remain ongoing.

2. **Intuition: Somewhere, the Exchange Must Happen**
   - use the simple cartoon of guessing a decisive round $\hat t$;
   - deliver Alice's message and drop Bob's;
   - either Alice is left with nothing, violating fairness, or returning her
     asset gives Alice and Bob two versions of the same input.

3. **Formal Reduction: Two Adjacent Cuts**
   - replace the sharp-round cartoon by accept probabilities at adjacent cuts;
   - a telescoping/hybrid argument supplies a gap of order $p/T$;
   - fork only the classical trusted-party state.

4. **Formal Reduction: Let One Message Through**
   - reuse the two-round message diagram and cross out one direction;
   - show one continuation accepting Alice's asset while the other rejects and
     returns Alice's asset;
   - conclude that the reduction produced two usable copies.

Do not put the two-case probability analysis or intersection bound on slides.
Mention in speaker notes that ordinary textbook no-cloning is not by itself a
quantitative security game; the direct version assumes operational
uncloneability of the assets. The BB84 game in the manuscript is one concrete
way to instantiate that premise.

---

# 15–20. Preliminaries and Candidate Construction

The positive direction currently uses six slides.

1. **Preliminaries I: Quantum Error Correction**
   - one logical qubit becomes an
     $[[\ell_{\mathrm{code}},1,d_{\mathrm{code}}]]$ block;
   - supported Clifford gates act coordinate by coordinate;
   - QEC supplies the damage budget needed to stop and replace a cheater.

2. **VQFHE: Compute, Then Verify**
   - deliberately marked `COVERAGE TODO`;
   - shows KeyGen / Enc / Eval / VerDec pictorially;
   - distinguishes honest correctness from verifiability;
   - displays the standard hidden data / $0$-trap / $+$-trap ciphertext pattern;
   - explains why final VQFHE rejection alone cannot recover a unique asset.

3. **Construction I: Input Encoding**
   - the TTP prepares encoded, Pauli-padded EPR halves;
   - Alice returns only a classical Bell-measurement label;
   - the TTP updates its Pauli key and now holds the encoded input.

4. **Construction II: Gate Evaluation**
   - four-message picture
     `TTP → Bob → TTP → Alice → TTP`;
   - Bob receives one hidden data register plus fresh $0/+$ traps;
   - Alice checks returned traps against fresh gate-output traps;
   - repeat over $j\in[\ell_{\mathrm{code}}]$.

5. **Construction III: Circuit Evaluation**
   - for each Clifford instruction, call the checked-gate primitive twice;
   - first Bob evaluates $g_t$ and Alice checks;
   - then Alice evaluates $I$ and Bob checks;
   - the two dashed four-arrow boxes give the intended eight-message visual.

6. **Construction IV: Full Exchange**
   - encode both inputs;
   - run one one-sided verified computation on each asset;
   - if both accept, cross the outputs; otherwise return each input to its
     original owner;
   - state the resource boundary: preprocessing plus online quantum
     storage/routing/SWAP and classical checks/key updates.

Important manuscript-alignment point:

> The TTP's at-rest state is a **Pauli-padded QEC codeword**, not a persistent
> trap-code ciphertext. Fresh, gate-dependent traps are introduced in every
> checked-gate call.

Likewise, the active construction repeats over
$j\in[\ell_{\mathrm{code}}]$, not $j\in[3\lambda]$. Each call contains three
registers—data plus two traps—so an encoded gate has $3\ell_{\mathrm{code}}$
evaluator registers in total.

The visible language should remain **candidate construction** / **construction
idea**. The one-sided coherent-attack proof and some non-Clifford/measurement
details are still unfinished in the manuscript.

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

→ **Impossibility with a classical TTP**

→ a $T$-round exchanger gives an $\Omega(1/T)$-success cloner

→ QEC makes bounded damage repairable

→ VQFHE supplies the compute-then-verify blueprint

→ teleport each asset into **quantum custody**

→ trap-check one coordinate, then compile a verification circuit

→ verify both assets before releasing either one

→ online TTP uses quantum storage/routing/SWAP, not general computation

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

The four-slide impossibility section should take about **6–8 minutes**. The six
new preliminary/construction slides likely need **12–15 minutes**, depending on
how much VQFHE detail survives.

Tentative remaining allocation:

- Impossibility: **6–8 min**
- QEC + VQFHE review: **~4–5 min**
- Protocol construction/security: **8–10 min**
- n-party extension + conclusion: **2–3 min**

Next task:

> **Design the n-party extension and conclusion, then rehearse timing and decide
> how much of the VQFHE placeholder belongs in the 45-minute version.**
