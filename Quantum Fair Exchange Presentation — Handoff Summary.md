# Quantum Fair Exchange Presentation — Handoff Summary

## Context

I am preparing a **40-minute theory-group presentation** on our ongoing project, **Quantum Fair Exchange**. The audience includes Aravind and his students, plus researchers from other groups, so not everyone should be assumed to know cryptography.

We are designing the content in Markdown and maintaining a matching
LaTeX/Beamer draft.

Current checkpoint:

- `quantum-fair-exchange-slides-v9.tex`
- `quantum-fair-exchange-slides-v9.md`

The main draft now has **29 numbered frames including the title**, followed by
two unnumbered reference pages. It contains a three-slide operational
**impossibility reduction** without the BB84 detour, a property-security
transition, seven `Background:` slides, one conceptual bridge, six protocol
construction slides, and a closing resource/result slide. The immediate next
task is a timed rehearsal. The n-party result is no longer promised on the
main path; it can remain future work or backup material.

---

# Current Story

## 1. Title frame

The title is simply **Quantum Fair Exchange**, with no subtitle. The author
line is

> Hao Chung \quad <u>Yi Lee</u> \quad Justin Raizes<br>
> Sri AravindaKrishnan Thyagarajan

Yi Lee is underlined to identify the speaker. Below the authors is one compact
row of four affiliation wordmarks, in author order:

1. LayerZero Labs;
2. University of Maryland;
3. NTT Research;
4. University of Sydney.

The image files live under `assets/affiliations/`. The frame ends with
**Ongoing work**.

---

## 2. Motivation: ordinary fair exchange

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

## 3. The obvious solution: trusted third party

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

## 4. Digital Cash: Blockchain vs. Quantum Money

Current table:

| | Cryptocurrency / Blockchain | Quantum Money |
|---|---|---|
| **Issuance** | Network rules | Bank / issuer |
| **Prevent double spending** | Shared transaction record | No-cloning + cryptography |
| **Transfer** | Record the transfer on a global blockchain | Send the quantum state |
| **Fair exchange** | Programmed all-or-nothing exchange | **???** |

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

## 5. Classical Fair Exchange

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

## 6. Classical Fair Exchange: Rejection

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

## 7. Quantum Fair Exchange: Rejection?

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

## 8. Quantum Fair Exchange: Rejection

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

# 9. Literature Survey

Keep this intentionally short.

Current structure:

- **Classical fair exchange:** studied since the early 1980s

- **Multiparty quantum computation**
  - identifiable abort: identify the cheating party and abort
  - `[ACCHLS21, CHTZ24]`

- **Verifiable quantum homomorphic encryption**
  - a key technical building block
  - `[ADSS17]`

Possible joke / oral transition:

> Aravind probably knows much more of this history than I do, so I'll skip ahead about forty years.

Main multiparty-quantum-computation connection:

Identifiable abort gives **accountability**, but fair exchange additionally cares about what happens to the honest party's quantum asset.

The audience-facing conclusion is deliberately plain:

> Identifying the cheater does not return the honest party's quantum asset.

VQFHE should only be mentioned here. Its technical review comes later.

Use mnemonic alphabetic citations throughout, with one surname initial per
author. In particular, the six-author 2021 paper must render as `ACCHLS21`, not
the truncated BibTeX-alpha form `ACH+21`.

---

# 10. Main Goals

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

We define **quantum fair exchange** for quantum states that cannot be copied.

We aim to show two complementary results:

1. **Impossibility with a classical trusted third party**
   - Quantum fair exchange is impossible in general, even with a classical trusted third party.

2. **Possibility with limited quantum capabilities**
   - A trusted party may use **quantum states prepared before the exchange**,
     plus storage.
   - During the exchange, its only quantum operation is a **SWAP gate** to
     move stored states.

Important: this is an ongoing project, so retain language like **“we aim to show”** rather than presenting unfinished results as completed theorems.

Do not put the n-party extension on this main-goals slide. A 40-minute talk is
better served by making the two-party construction legible.

---

# 11–13. Operational Impossibility Without the BB84 Detour

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

# 14. Transition: Property Security and Open Work

**What We Show---and What Remains** is the bridge from the classical-TTP
impossibility result to the quantum-TTP construction.

The left side states the current **property-based security** target:

- **Correctness:** if both parties are honest, they accept and receive each
  other's states.
- **Asset preservation (soundness):** an honest party leaves with a valid
  state. On acceptance this is the other party's asset; on rejection it is the
  honest party's own asset.

The right side says only:

> **Still in progress:** composable security.

The speaker notes retain the qualifications: these guarantees are meant to
hold except with negligible probability, the manuscript currently has a proof
sketch rather than a finished proof, and no particular composable framework is
claimed yet. Allowing the TTP to retain quantum states is what removes the
copyable-classical-state step used by the impossibility reduction.

---

# 15–29. Background, Core Idea, Candidate Construction, and Result

## 15–21. Background

The background review is seven separate one-idea slides, all with the simpler
`Background:` title convention.

1. **Background: Quantum Error Correction**
   - one logical qubit becomes an entangled block of $n$ physical qubits, not
     $n$ copies;
   - show an attack channel $\mathcal A$ in red;
   - use $\lambda$ as the visible correctable-error budget rather than
     introducing code distance;
   - use pure-state notation $\ket\psi$ throughout the visible equation;
   - omit the former bottom slogan “Bounded damage is repairable.”

2. **Background: Transversal CNOT**
   - visibly qualify this as “for the code we use,” then draw two encoded
     blocks and apply a physical CNOT between every pair of matching positions;
   - put the four-row CNOT table at the right:
     $00\mapsto00$, $01\mapsto01$, $10\mapsto11$, and $11\mapsto10$;
   - show
     $$
     \mathsf{CNOT}^{\otimes n}\mathsf{QEnc}^{\otimes2}
       \ket{\psi,\phi}
       =\mathsf{QEnc}^{\otimes2}\mathsf{CNOT}\ket{\psi,\phi};
     $$
   - the first qubit is the control, and the logical outputs may be entangled;
   - caveat in the notes that this transversal identity is the chosen
     self-dual-CSS/Steane-family example, not a claim that every gate is this
     simple;
   - omit the former bottom slogan about errors not spreading.

3. **Background: Quantum Authentication**
   - use plain client/server lanes with `KeyGen / Auth / attacker / VerDec`;
   - do not box either party's local operations, and keep arrows clear of the
     local labels;
   - use pure states: the client protects $\ket\psi$, receives
     $\ket{\widetilde\psi'}$, and locally computes
     $\mathsf{Rej}$ or $\ket{\psi_{\mathrm{out}}}$ with $\mathsf{VerDec}$;
   - do not draw a message arrow for that local output;
   - acceptance implies $\ket{\psi_{\mathrm{out}}}\approx\ket\psi$;
   - an attacker may force rejection but cannot alter the state undetected;
     the full definition must also preserve entanglement with a reference.

4. **Background: The Trap Code**
   - show the actual KeyGen and Enc formulas with $\pi\gets S_{3n}$,
     $x,z\gets_{\$}\{0,1\}^{3n}$, and pad $X^xZ^z$;
   - give the four-step verified-decryption pseudocode;
   - omit the former “data + traps” caption under the encryption formula;
   - for multiple ciphertext blocks, reuse the same secret permutation but
     sample an independent Pauli pad for each block;
   - keep the TTP's at-rest-state caveat in speaker notes, not as a dense
     audience-facing footer.

5. **Background: VQFHE**
   - show the general client/server security interface for an arbitrary
     circuit $C$;
   - KeyGen returns $(\mathsf{pk},\mathsf{sk},\mathsf{evk})$;
   - the client sends $(\mathsf{ct},\mathsf{evk},C)$ and receives an evaluated
     ciphertext plus a log;
   - the client locally computes rejection or the certified output with
     verified decryption; do not draw that local result as a message arrow;
   - honest evaluation gives $\ket y=C\ket x$, while malicious evaluation can
     only reject or produce $\ket y\approx C\ket x$ upon acceptance;
   - keep both parties' local operations unboxed, and treat privacy as a
     separate part of the formal definition.

6. **Background: Homomorphic CNOT**
   - show two trap-code ciphertext blocks using the **same hidden shuffle**
     $\pi$ but **independent one-time pads**;
   - visually echo the transversal-CNOT frame by applying
     $\mathsf{CNOT}^{\otimes3n}$ between corresponding encrypted positions;
   - the repeated color pattern is explanatory only: the evaluator does not
     learn which positions are data, $0$-tests, or $+$-tests;
   - update the homomorphically encrypted Pauli keys by
     $$
       (\widehat x_1,\widehat z_1,\widehat x_2,\widehat z_2)
       \longmapsto
       (\widehat x_1,
        \widehat z_1\oplus\widehat z_2,
        \widehat x_1\oplus\widehat x_2,
        \widehat z_2).
     $$

7. **Background: Why Homomorphic CNOT Works**
   - repeat two trap-code encryptions
     $\mathsf{TEnc}_{\pi,Q_1}(\ket\psi)$ and
     $\mathsf{TEnc}_{\pi,Q_2}(\ket\phi)$ so the audience can see the common
     $\pi$ and independent $Q_1,Q_2$;
   - with $U_r=\mathsf{CNOT}^{\otimes r}$, explain the construction through
     four exact facts:
     $$
     \begin{aligned}
       U_{3n}(\pi\otimes\pi)&=(\pi\otimes\pi)U_{3n},\\
       U_{3n}(Q_1\otimes Q_2)&=(Q'_1\otimes Q'_2)U_{3n},\\
       U_n\mathsf{QEnc}^{\otimes2}
         &=\mathsf{QEnc}^{\otimes2}\mathsf{CNOT},\\
       \mathsf{CNOT}\ket{00}&=\ket{00},\qquad
       \mathsf{CNOT}\ket{++}=\ket{++};
     \end{aligned}
     $$
   - the common permutation lines up like positions, conjugation produces new
     pad keys (up to irrelevant Pauli phase), transversality implements the
     data gate, and the two kinds of tests stay fixed;
   - conclude that universality requires a substantially more involved construction,
     citing `[ADSS17]`.

## 22. Conceptual bridge

**Core Idea: Verify Before Release** gives the whole construction idea before
the protocol details:

- the quantum TTP keeps the encoded asset while its verification circuit runs;
- first teleport the asset into a QEC-encoded, one-time-padded state at the
  TTP;
- then evaluate $\mathsf{Ver}_A=g_T\cdots g_1$ one step at a time;
- show a fresh hidden check after every step;
- if a test fails, stop while QEC can still repair the damage;
- preserve the technical caveat in the notes: this at-rest state is not a
  persistent standard trap-code ciphertext.

## 23–28. Candidate construction

The protocol construction uses six slides.

1. **Construction I: Teleport to the TTP**
   - the TTP prepares encoded, Pauli-padded halves of entangled pairs;
   - Alice returns only a classical Bell-measurement outcome;
   - keep both parties' local operations unboxed and this frame to the
     construction itself.

2. **Construction I: What the TTP Holds**
   - the TTP stores $(\ket{\widetilde\psi},Q^0)$;
   - Alice has no backup copy;
   - distinguish the at-rest QEC+pad state from fresh per-gate tests.

3. **Construction II: Bob Applies a Gate**
   - show the exact pure-state triple and matching shuffled pad instructions;
   - show Bob's exact returned triple after applying $G$ and new pads;
   - the hidden shuffle forces identical treatment of data and tests.

4. **Construction II: Alice Checks the Result**
   - the TTP mixes each returned test with a new test whose result it knows;
   - Alice undoes $G$, measures in $Z/X$, and returns outcomes;
   - if the results match, the TTP updates the one-time-pad key to
     $Q_{\mathrm{new}}=Q'GQG^\dagger$;
   - space the two arrows far enough apart for both two-line labels.

5. **Construction III: Circuit Evaluation**
   - for every circuit gate, run $\pi_{\mathsf{gate}}$ twice, with Alice and
     Bob exchanging roles;
   - first Bob applies $g_t$ and Alice checks;
   - then Alice applies $I$ and Bob checks;
   - draw eight unlabelled arrows inside two dashed boxes; the box labels
     $\pi_{\mathsf{gate}}(g_t)$ and $\pi_{\mathsf{gate}}(I)$ are sufficient;
   - leave comfortable padding below each dashed region's bottom arrow;
   - keep gate-family terminology and measurement details out of the visible
     slide.

6. **Construction IV: Full Exchange**
   - encode both inputs, which go to the TTP;
   - run one one-sided verified computation on each asset;
   - label the top stages simply `Input encoding`,
     $\pi_{\mathsf{circuit}}(\$_A)$, and
     $\pi_{\mathsf{circuit}}(\$_B)$;
   - the TTP waits for both verification results before making one release
     decision;
   - if both accept, exchange the outputs; otherwise return each input to its
     original owner;
   - focus the slide on delayed release rather than repeating the resource
     list.

For Construction I–III, any repetition brace placed at the right edge is a
right-hand brace `}` opening toward the message sequence.

## 29. Closing resource/result slide

**Result: Feasibility with a Quantum TTP** now comes *after* the full-exchange
diagram and restates the candidate result as a compact resource theorem.

All quantum resources are input-independent. Before either input is known, the
TTP prepares:

- encoded, one-time-padded halves of entangled pairs;
- encoded, one-time-padded $\ket0$ and $\ket T$ blocks;
- gate-dependent hidden $0$- and $+$-test states;
- hidden test states for measurements.

Here $\ket T:=T\ket+$ is a one-use resource for implementing a $T$ gate. The
TTP also keeps classical one-time-pad keys, secret shuffles, and expected test
outcomes. During the exchange, it only stores and moves quantum states;
resource selection, test checks, and key updates are classical. Exact resource
counts depend on the verification circuits and on whether gate choices are
adaptive.

Important manuscript-alignment point:

> The TTP's at-rest state is a **Pauli-padded QEC codeword**, not a persistent
> trap-code ciphertext. Fresh, gate-dependent traps are introduced in every
> checked-gate call.

Use $n$ as the canonical physical block length throughout the talk. The active
construction repeats over $j\in[n]$, not $j\in[3\lambda]$. Each call contains
three registers—data plus two tests—so an encoded gate has $3n$ evaluator
registers in total. The separate symbol $\lambda$ remains the visible
correctable-error budget on the QEC slide.

The visible language should remain **candidate construction**, **construction
idea**, or **candidate theorem**. The manuscript currently has a construction
and proof sketch; the one-sided coherent-attack proof, some universal-gate and
measurement details, and composable security remain unfinished. Avoid the word
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

→ state the current property guarantees: correctness and asset preservation

→ mark simulation-based/composable security as work in progress

→ QEC makes bounded damage repairable

→ transversal CNOT applies one physical CNOT between every matching pair

→ use the CNOT truth table to give the non-quantum audience a concrete gate

→ quantum authentication detects undetected tampering

→ the trap code hides data among complementary tests

→ VQFHE first states the arbitrary-circuit compute-then-verify security game

→ homomorphic CNOT applies coordinatewise to two trap-code ciphertexts that
share a secret permutation but use independent Pauli pads

→ explain why the shuffle, pad, encoded data, and traps all transform
correctly; universality is the hard part

→ explain the core idea: verify before release, with a fresh hidden check
after every step

→ teleport each asset to the **quantum TTP**

→ check one physical position, then compile a verification circuit

→ verify both assets before releasing either one

→ close by restating the input-independent entangled-pair, workspace,
magic-state, and hidden-test resources prepared in advance

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
property-security transition adds roughly **1 minute**. The seven background
slides likely need **10–12 minutes**, and the core-idea plus seven
construction/result slides another **11–13 minutes**. With transitions and a
short close, the gut estimate is now **39–43 minutes**. The deck is therefore
at the upper edge of a 40-minute slot; the rehearsal target should still be
about **35–36 minutes** so there is room to slow down or take one question.

Tentative remaining allocation:

- Motivation, functionality, literature, goals: **8–10 min**
- Impossibility: **4–5 min**
- Property-security transition: **about 1 min**
- QEC + CNOT + authentication + trap-code + VQFHE review: **10–12 min**
- Core idea + protocol construction + resource result: **11–13 min**
- Other transitions and close: **3–4 min**

Next task:

> **Do a timed run. Keep the n-party extension out of the main path unless the
> rehearsal finishes comfortably below 35 minutes; otherwise mention it only
> in questions or on a backup slide.**
