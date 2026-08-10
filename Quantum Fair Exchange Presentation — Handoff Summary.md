# Quantum Fair Exchange Presentation — Handoff Summary

## Context

I am preparing a **45-minute theory-group presentation** on our ongoing project, **Quantum Fair Exchange**. The audience includes Aravind and his students, plus researchers from other groups, so not everyone should be assumed to know cryptography.

We are designing the content in Markdown and maintaining a matching
LaTeX/Beamer draft.

Current checkpoint:

`quantum-fair-exchange-slides-v9.md`

The presentation is unfinished. We now have the motivation, a four-slide
operational **impossibility reduction** without the BB84 detour, six one-idea
preliminary slides, and a candidate construction ending in a separate
preprocessing/resource-bank summary. The next major content task is the
n-party extension and conclusion; the VQFHE coverage is deliberately marked
for later revision.

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

This is designed as several visually identical slides, changing only one thing
at a time. Each slide has exactly one tall, rounded `Fair Exchange` box. Assets
and outcomes are plain labels on horizontal arrows; there are no surrounding
asset boxes.

## 4. Classical Fair Exchange

Alice inputs `$_A`; Bob inputs `$_B`.

Ideal box swaps them:

```text
 Alice                 +------------------+                 Bob
 $_A ----------------->|                  |<----------------- $_B
                       |   Fair Exchange  |
 $_B <-----------------|                  |-----------------> $_A
                       +------------------+
```

If both inputs are valid: **swap them**.

---

## 5. Classical Fair Exchange: Rejection

Bob now cheats:

```text
 Alice                 +------------------+                 Bob
 $_A ----------------->|                  |<------------- garbage
                       |   Fair Exchange  |
 Rej <-----------------|                  |
                       +------------------+
```

Alice only gets `Rej`.

Important: **do NOT return `$_A`** in the classical ideal functionality. That would be pointless because Alice's input is classical information; she can already retain/know it.

This becomes the setup for the quantum problem.

---

## 6. Quantum Fair Exchange: Rejection?

Change exactly one thing:

`$_A` → `|$_A⟩`.

```text
 Alice                 +------------------+                 Bob
 |$_A⟩ --------------->|                  |<------------- garbage
                       |   Fair Exchange  |
 Rej <-----------------|                  |
                       +------------------+
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
 Alice                 +------------------+                 Bob
 |$_A⟩ --------------->|                  |<------------- garbage
                       |   Fair Exchange  |
 |$_A⟩ + Rej <---------|                  |
                       +------------------+
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
  - `[ACCHLS21, CHTZ24]`

- **Verifiable quantum fully homomorphic encryption (VQFHE)**
  - a key technical building block
  - `[ADSS17]`

Possible joke / oral transition:

> Aravind probably knows much more of this history than I do, so I'll skip ahead about forty years.

Main MPQC connection:

Identifiable abort gives **accountability**, but fair exchange additionally cares about what happens to the honest party's quantum asset.

VQFHE should only be mentioned here. Its technical review comes later.

Use mnemonic alphabetic citations throughout, with one surname initial per
author. In particular, the six-author 2021 paper must render as `ACCHLS21`, not
the truncated BibTeX-alpha form `ACH+21`.

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

# 10–13. Operational Impossibility Without the BB84 Detour

The talk uses a direct reduction from fair exchange to an operational cloning
game. It assumes the exchanged assets are **selectively uncloneable**: given
one valid instance of each input, an efficient algorithm cannot choose one
input and produce two usable versions of that same identified asset, except
with negligible probability.

For the talk, hard-code perfect honest correctness rather than introducing a
parameter $p$:

> A $T$-round fair exchanger with a classical TTP yields a procedure that
> duplicates one of the two inputs with probability $\Omega(1/T)$.

The general speaker-note version replaces this by $p/(2T)$, up to correctness
and fairness errors. The $1/T$ scale belongs to the cloning attack, not to the
honest protocol's success probability.

The four slides are:

1. **Impossibility with a Classical Trusted Party**
   - assume a $T$-round fair-exchange protocol with a classical TTP;
   - show honest swapping and asset-preserving abort in one line each;
   - state the $\Omega(1/T)$ cloning procedure;
   - reduce unclonability to the short footer “one identified asset cannot
     become two usable copies.”

2. **Somewhere, the Exchange Must Happen**
   - use only the endpoint timeline and one useful boundary $t^*$;
   - some neighboring pair of cuts witnesses the handoff;
   - there are $T$ possible locations, explaining the $1/T$ cost.

3. **Reduction: Fork the Classical World**
   - show the crossing messages at rounds $t^*$ and $t^*+1$;
   - run the honest prefix and copy only the classical TTP state;
   - form two locally consistent continuations;
   - show no cut probabilities or hybrid formulas.

4. **Reduction: Let One Message Through**
   - reuse the two-round message diagram and cross out one direction;
   - show one continuation accepting Alice's asset while the other rejects and
     returns Alice's asset;
   - conclude that the reduction produced two usable copies.

Do not show $q_P(t)$, a telescoping sum, adjacent-cut inequalities, the
two-case probability analysis, or an intersection bound. Those details may
remain in speaker notes only. Ordinary textbook no-cloning is not by itself a
quantitative security game; the direct version assumes operational
uncloneability of the assets. The BB84 game in the manuscript is one concrete
way to instantiate that premise.

---

# 14–24. Preliminaries and Candidate Construction

The former two-slide preliminary review is now six separate one-idea slides.

1. **QEC: Spread One Qubit Across a Block**
   - one logical qubit becomes an entangled
     $[[\ell_{\mathrm{code}},1,d_{\mathrm{code}}]]$ block, not many copies;
   - bounded physical damage is correctable.

2. **Transversal Operations: Compute Coordinatewise**
   - use $X_L=X^{\otimes n}$ as the entire visible example;
   - coordinatewise computation keeps local damage local;
   - caveat orally that the example is code-dependent.

3. **Quantum Authentication: Detect Tampering**
   - show `KeyGen / Auth / attacker / VerDec` as a security game;
   - acceptance implies that the output is essentially the original state;
   - an attacker may force rejection but cannot alter the state undetected.

4. **The Trap Code: Hide Data Among Tests**
   - show encoded data, $0$-traps, and $+$-traps under a secret permutation and
     Pauli pad;
   - explain the two complementary tests;
   - retain the caveat that our TTP stores only QEC plus a pad and introduces
     fresh operation-dependent traps during evaluation.

5. **VQFHE: Compute, Then Verify**
   - deliberately marked `COVERAGE TODO`;
   - show KeyGen / Enc / Eval / VerDec pictorially;
   - distinguish honest correctness from “correct output or reject” against a
     malicious server;
   - motivate Bob running Alice's verifier without receiving unprotected
     money;
   - explain orally that VQFHE rejection alone does not restore a consumed
     unique asset.

6. **Homomorphic Evaluation: Act Without Finding the Data**
   - secretly shuffle one data register with a $0$-test and a $+$-test;
   - apply $G^{\otimes3}$ to all three;
   - because the evaluator cannot locate the data, it must treat data and tests
     identically.

The construction then uses five slides.

7. **Construction I: Input Encoding**
   - the TTP prepares encoded, Pauli-padded EPR halves;
   - Alice returns only a classical Bell-measurement label;
   - the TTP updates its Pauli key and now holds the encoded input.

8. **Construction II: Gate Evaluation**
   - four-message picture
     `TTP → Bob → TTP → Alice → TTP`;
   - Bob receives one hidden data register plus fresh $0/+$ traps;
   - Alice checks returned traps against fresh expected-output traps;
   - repeat over $j\in[\ell_{\mathrm{code}}]$.

9. **Construction III: Circuit Evaluation**
   - for every circuit instruction, call the checked-gate primitive twice;
   - first Bob evaluates $g_t$ and Alice checks;
   - then Alice evaluates $I$ and Bob checks;
   - draw eight **unlabelled** arrows inside two dashed boxes; the box labels
     $\pi_{\mathsf{gate}}(g_t)$ and $\pi_{\mathsf{gate}}(I)$ are sufficient;
   - keep gate-family jargon and measurement details out of the visible slide.

10. **Preprocessing: The Quantum Resource Bank**
    - collect encoded EPR halves, padded encoded $\ket0$ and $\ket T=T\ket+$
      blocks, measurement traps, and expected-output traps for every
      slot/coordinate/candidate operation;
    - show the classical ledger of Pauli keys, secret permutations, and
      expected trap outcomes;
    - one oral sentence: consuming $\ket T$ in a checked gadget implements a
      $T$ gate;
    - after preprocessing, quantum work is storage, communication, and
      routing/SWAP; selection, checks, and key updates are classical.

11. **Construction IV: Full Exchange**
    - encode both inputs;
    - run one one-sided verified computation on each asset;
    - if both accept, cross the outputs; otherwise return each input to its
      original owner;
    - focus the slide on delayed release rather than repeating the full
      resource list.

For Construction I–III, any repetition brace placed at the right edge must be
mirrored so that it faces left toward the message sequence.

Important manuscript-alignment point:

> The TTP's at-rest state is a **Pauli-padded QEC codeword**, not a persistent
> trap-code ciphertext. Fresh, gate-dependent traps are introduced in every
> checked-gate call.

Likewise, the active construction repeats over
$j\in[\ell_{\mathrm{code}}]$, not $j\in[3\lambda]$. Each call contains three
registers—data plus two traps—so an encoded gate has $3\ell_{\mathrm{code}}$
evaluator registers in total.

The visible language should remain **candidate construction** / **construction
idea**. The one-sided coherent-attack proof and some universal-gate and
measurement details are still unfinished in the manuscript. Avoid the word
“Clifford” in visible slide text; the manuscript-specific caveat may remain in
speaker notes.

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

→ coordinatewise operations keep damage local

→ quantum authentication detects undetected tampering

→ the trap code hides data among complementary tests

→ VQFHE supplies the compute-then-verify blueprint

→ teleport each asset into **quantum custody**

→ trap-check one coordinate, then compile a verification circuit

→ preprocess a quantum **resource bank**, including encoded EPRs, traps,
workspace, and magic states

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
preliminary slides likely need **7–10 minutes**, and the five construction/
resource slides another **8–11 minutes**. This makes the 45-minute budget tight
once the n-party extension and conclusion are added; rehearsal should decide
which preliminary slides become quick visual beats or backup material.

Tentative remaining allocation:

- Impossibility: **6–8 min**
- QEC + authentication + trap-code + VQFHE review: **~7–10 min**
- Protocol construction/resource boundary: **8–11 min**
- n-party extension + conclusion: **2–3 min**

Next task:

> **Design the n-party extension and conclusion, then rehearse timing and decide
> which of the six preliminary slides stay in the 45-minute main path.**
