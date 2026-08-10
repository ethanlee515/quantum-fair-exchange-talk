# Quantum Fair Exchange Presentation — Handoff Summary

## Context

I am preparing a **40-minute theory-group presentation** on our ongoing project, **Quantum Fair Exchange**. The audience includes Aravind and his students, plus researchers from other groups, so not everyone should be assumed to know cryptography.

We are designing the content in Markdown and maintaining a matching
LaTeX/Beamer draft.

Current checkpoint:

`quantum-fair-exchange-slides-v9.md`

The main draft now has 26 numbered frames including the title, followed by two
unnumbered reference pages. It contains a three-slide operational
**impossibility reduction** without the BB84 detour, six one-idea preliminary
slides, and a seven-slide candidate-construction sequence including separate
custody, evaluator/checker, and resource-bank frames. The immediate next task
is a timed rehearsal. The n-party result is no longer promised on the main
path; it can remain future work or backup material.

The title frame is simply **Quantum Fair Exchange**, with authors,
affiliations, and “Ongoing work”; it has no subtitle.

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
If Bob sends the ticket first, Alice can take the ticket and disappear.

This introduces fair exchange without assuming cryptographic background.

The `$100` and `Digital ticket` labels sit below Alice and Bob respectively,
not on the two-way arrow. There is no separate “Goal” banner; the slide simply
poses the problem.

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

The trusted institution can intervene if something goes wrong. The visible
slide ends with two side-by-side prompts:

- **Trusted institutions can intervene:** credit-card disputes, chargebacks,
  and online marketplaces.
- **Cash-like exchange?** Can Alice and Bob exchange directly?

The cryptocurrency/direct-exchange transition and quantum-money preview are
oral. Do not put a cryptocurrency footer or a separate takeaway banner on
this slide.

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

- **Multiparty quantum computation**
  - identifiable abort: identify the cheating party and abort
  - `[ACCHLS21, CHTZ24]`

- **Verifiable quantum fully homomorphic encryption (VQFHE)**
  - a key technical building block
  - `[ADSS17]`

Possible joke / oral transition:

> Aravind probably knows much more of this history than I do, so I'll skip ahead about forty years.

Main multiparty-quantum-computation connection:

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

Important: this is an ongoing project, so retain language like **“we aim to show”** rather than presenting unfinished results as completed theorems.

Do not put the n-party extension on this main-goals slide. A 40-minute talk is
better served by making the two-party construction legible.

---

# 10–12. Operational Impossibility Without the BB84 Detour

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

The three slides are:

1. **Impossibility with a Classical Trusted Party**
   - assume a $T$-round fair-exchange protocol with a classical TTP;
   - show the honest swap equation;
   - use one alert block headed **Reduction to quantum cloning**;
   - state that the protocol duplicates one input with probability
     $\Omega(1/T)$;
   - omit the separate abort sentence and unclonability footer.

2. **Suppose the Assets Change Hands in Round $t$**
   - label this explicitly as intuition: suppose one round completes the
     exchange;
   - draw Alice and Bob with two clean crossing arrows, labelled
     $\ket{\$_A}$ and $\ket{\$_B}$;
   - choose $t^*\leftarrow\{1,\ldots,T\}$ at random and display
     $\Pr[t^*=t]=1/T$;
   - keep same/adjacent stopping-experiment bookkeeping in speaker notes.

3. **Let Only One Direction Through**
   - Alice-to-Bob $\ket{\$_A}$ is delivered;
   - Bob-to-Alice $\ket{\$_B}$ is withheld and crossed out;
   - Bob accepts Alice's asset; if Alice rejects, fairness must restore that
     same asset to her;
   - “no recovery = unfair; recovery = two copies.”

Do not show $q_P(t)$, a telescoping sum, adjacent-cut inequalities, the
two-case probability analysis, or an intersection bound. Those details may
remain in speaker notes only. Ordinary textbook no-cloning is not by itself a
quantitative security game; the direct version assumes operational
uncloneability of the assets. The BB84 game in the manuscript is one concrete
way to instantiate that premise.

The second slide is only the sharp-round cartoon. A general protocol need not
send raw asset registers or switch in one literal round. In the formal proof,
the $\Omega(1/T)$ mismatch comes from averaging over same/adjacent stopping
experiments; do not combine that with another random-guess loss and claim
$1/T^2$.

---

# 14–26. Preliminaries and Candidate Construction

The preliminary review is six separate one-idea slides.

1. **QEC: Spread One Qubit Across a Block**
   - one logical qubit becomes an entangled block, not many copies;
   - show an attack channel $\mathcal A$ in red;
   - use $\lambda$ as the visible correctable-error budget rather than
     introducing code distance.

2. **Transversal Operations: Compute Coordinatewise**
   - use $X_L=X^{\otimes n}$ as the entire visible example;
   - coordinatewise computation keeps local damage local;
   - caveat orally that the example is code-dependent.

3. **Quantum Authentication: Detect Tampering**
   - use plain client/server lanes with `KeyGen / Auth / attacker / VerDec`;
   - do not box either party's local operations, and keep arrows clear of the
     local labels;
   - acceptance implies that the output is essentially the original state;
   - an attacker may force rejection but cannot alter the state undetected.

4. **The Trap Code: Hide Data Among Tests**
   - show the actual KeyGen and Enc formulas with $\pi\gets S_{3n}$,
     $x,z\gets_{\$}\{0,1\}^{3n}$, and pad $X^xZ^z$;
   - give the four-step verified-decryption pseudocode;
   - keep the TTP's at-rest-state caveat in speaker notes, not as a dense
     audience-facing footer.

5. **VQFHE: Compute, Then Verify**
   - show the general client/server security interface for an arbitrary
     circuit $C$;
   - KeyGen returns $(\mathsf{pk},\mathsf{sk},\mathsf{evk})$;
   - the client sends $(\mathsf{ct},\mathsf{evk},C)$ and receives an evaluated
     ciphertext plus a log;
   - verified decryption returns rejection or the certified output;
   - honest evaluation gives $\ket y=C\ket x$, while malicious evaluation can
     only reject or produce $\ket y\approx C\ket x$ upon acceptance;
   - keep both parties' local operations unboxed.

6. **VQFHE by Example: $\mathsf{Eval}_X$**
   - write the ciphertext as
     $(\widetilde\sigma,\widehat x,\widehat z)$ and place
     $\widehat\pi$ in $\mathsf{evk}$;
   - homomorphically derive the encrypted hidden-data mask
     $\widehat{s_\pi}$ from $\widehat\pi$;
   - update the encrypted pad key
     $\widehat x'\leftarrow\widehat x\oplus\widehat{s_\pi}$ while leaving the
     quantum register unchanged;
   - the evaluation log records the homomorphic permutation and XOR
     computations, not merely the gate label $X$;
   - emphasize that supporting all other gates needs the nontrivial gadgets
     of `[ADSS17]`.

The construction then uses seven slides.

7. **Construction I: Teleport into Custody**
   - the TTP prepares encoded, Pauli-padded EPR halves;
   - Alice returns only a classical Bell-measurement label;
   - keep both parties' local operations unboxed and this frame to the
     construction itself.

8. **Construction I: State Now in Custody**
   - the TTP stores $(\widetilde\rho,Q^0)$;
   - Alice has no backup copy;
   - distinguish the at-rest QEC+pad state from fresh per-gate tests.

9. **Construction II: Evaluator Pass**
   - show the exact pure-state triple and matching shuffled Pauli instructions;
   - show Bob's exact returned triple after applying $G$ and rerandomization;
   - the hidden shuffle forces identical treatment of data and tests.

10. **Construction II: Checker Pass**
   - the TTP mixes each returned test with a fresh known gate-output test;
   - Alice undoes $G$, measures in $Z/X$, and returns outcomes;
   - on acceptance the TTP records $Q_{\mathrm{new}}=Q'GQG^\dagger$;
   - space the two arrows far enough apart for both two-line labels.

11. **Construction III: Circuit Evaluation**
   - for every circuit instruction, call the checked-gate primitive twice;
   - first Bob evaluates $g_t$ and Alice checks;
   - then Alice evaluates $I$ and Bob checks;
   - draw eight **unlabelled** arrows inside two dashed boxes; the box labels
     $\pi_{\mathsf{gate}}(g_t)$ and $\pi_{\mathsf{gate}}(I)$ are sufficient;
   - leave comfortable padding below each dashed region's bottom arrow;
   - keep gate-family jargon and measurement details out of the visible slide.

12. **Preprocessing: The Quantum Resource Bank**
    - collect encoded EPR halves, padded encoded $\ket0$ and $\ket T=T\ket+$
      blocks, measurement traps, and expected-output traps for every
      slot/coordinate/candidate operation;
    - show the classical ledger of Pauli keys, secret permutations, and
      expected trap outcomes;
    - one oral sentence: consuming $\ket T$ in a checked gadget implements a
      $T$ gate;
    - after preprocessing, quantum work is storage, communication, and
      routing/SWAP; selection, checks, and key updates are classical.

13. **Construction IV: Full Exchange**
   - encode both inputs;
   - run one one-sided verified computation on each asset;
   - label the top stages simply `Input encoding`,
     $\pi_{\mathsf{circuit}}(\$_A)$, and
     $\pi_{\mathsf{circuit}}(\$_B)$;
   - the TTP waits for both flags before making one release decision;
   - if both accept, cross the outputs; otherwise return each input to its
     original owner;
    - focus the slide on delayed release rather than repeating the full
      resource list.

For Construction I–III, any repetition brace placed at the right edge is a
right-hand brace `}` opening toward the message sequence.

Important manuscript-alignment point:

> The TTP's at-rest state is a **Pauli-padded QEC codeword**, not a persistent
> trap-code ciphertext. Fresh, gate-dependent traps are introduced in every
> checked-gate call.

Use $n$ as the canonical physical block length throughout the talk. The active
construction repeats over $j\in[n]$, not $j\in[3\lambda]$. Each call contains
three registers—data plus two tests—so an encoded gate has $3n$ evaluator
registers in total. The separate symbol $\lambda$ remains the visible
correctable-error budget on the QEC slide.

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

→ VQFHE first states the arbitrary-circuit compute-then-verify security game

→ the concrete $\mathsf{Eval}_X$ example updates an encrypted pad key while
leaving the quantum register untouched

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

**about 8–10 minutes**. The four functionality frames are a quick visual
flipbook rather than four full explanations.

Roughly:

- Intro + initial fair-exchange problem: ~1.5 min
- Trusted third party + blockchain/quantum-money pivot: ~2.5 min
- Four functionality slides: ~2 min
- Literature survey + Main Goals: ~2.5–3 min

The three-slide impossibility section should take about **4–5 minutes**. The
six preliminary slides likely need **8–9 minutes**, and the seven
construction/resource slides another **10–12 minutes**. With transitions and a
short close, the gut estimate is **36–39 minutes**. That is viable for a
40-minute talk, but the rehearsal target should be about **35–36 minutes** so
there is room to slow down or take one question.

Tentative remaining allocation:

- Motivation, functionality, literature, goals: **8–10 min**
- Impossibility: **4–5 min**
- QEC + authentication + trap-code + VQFHE review: **8–9 min**
- Protocol construction/resource boundary: **10–12 min**
- Transitions and close: **3–4 min**

Next task:

> **Do a timed run. Keep the n-party extension out of the main path unless the
> rehearsal finishes comfortably below 35 minutes; otherwise mention it only
> in questions or on a backup slide.**
