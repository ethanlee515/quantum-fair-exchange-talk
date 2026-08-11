# Quantum Fair Exchange — Presentation Draft

> Working Markdown for the 40-minute theory-group presentation.
> We will refine this slide-by-slide. Notes in brackets are production/speaker notes, not necessarily slide text.
>
> Current build: **30 numbered frames** and **45 physical PDF pages**:
> 13 overlay-continuation pages plus two unnumbered reference pages.

# Title

**Quantum Fair Exchange**

Hao Chung \quad <u>Yi Lee</u> \quad Justin Raizes<br>
Sri AravindaKrishnan Thyagarajan

[One compact row of four affiliation wordmarks, in author order:]

| LayerZero Labs | University of Maryland | NTT Research | University of Sydney |
|---|---|---|---|
| ![LayerZero Labs](assets/affiliations/layerzero-title.png) | ![University of Maryland](assets/affiliations/umd-title.png) | ![NTT Research](assets/affiliations/ntt-title.png) | ![University of Sydney](assets/affiliations/sydney-title.png) |

**Ongoing work**

# Fair Exchange: Who Goes First?

[Large visual: Alice on the left, Bob on the right, with a plain two-way arrow
between them. Put `$100` and `Digital ticket` directly below the corresponding
party rather than on the arrow.]

```text
        Alice                       Bob
        $100           <-->         Digital ticket
```

## Who goes first?

- If Alice pays first, Bob can take the money and disappear.
- If Bob sends the ticket first, Alice can take the ticket and disappear.

### Speaker notes

- Start from the intuitive problem, before introducing cryptographic definitions.
- “Digital ticket” can mean a concert ticket, a game activation/serial code, or a gift-card code.
- Since this is a cryptography talk, Alice and Bob do not necessarily trust each other; either may cheat.
- Pause at “Who goes first?” before explaining the two cheating cases.
- This slide should be mostly visual and light on text.

---

# The Obvious Solution: A Trusted Third Party

[Large visual: the ticket goes directly from Bob to Alice; only the payment goes through the trusted institution.]

                         🏦 Bank / card network
                         ↗                   ↘
                     $100                     payment
                       /                         \
                **Alice**                     **Bob**
                    ▲                            │
                    └──── 🎫 Digital ticket ─────┘

| Trusted institutions can intervene | Cash-like exchange? |
|---|---|
| Credit-card disputes and chargebacks; online marketplaces. | Can Alice and Bob exchange directly? |

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
- The ticket travels directly from Bob to Alice; only the payment path uses the trusted institution.

---

# Digital Cash: Blockchain vs. Quantum Money

| | Cryptocurrency / Blockchain | Quantum Money |
|---|---|---|
| **Minting** | Network rules (e.g. mining) | Bank |
| **Security** | Blockchain consensus | No-cloning |
| **Transfer** | New block | Send the quantum state |
| **Fair exchange** | Atomic swap, smart contract, etc. | **???** |

### Speaker notes

- Cryptocurrency and quantum money are two very different approaches to digital cash.
- For cryptocurrency, minting follows network rules---for example,
  proof-of-work mining. Do not imply that every cryptocurrency uses mining.
- The security row compresses two different threats: blockchain consensus
  prevents double spending, while quantum-money security prevents
  counterfeiting.
- The transfer row is a cartoon: a cryptocurrency transfer is included and
  confirmed in a new block, whereas quantum money transfers the state itself.
- The bank may mint quantum money without mediating every payment.
- Atomic swaps and smart contracts are familiar mechanisms for fair exchange
  on blockchains.
- Pause at the final **???**.
- Transition: “What is the analogue for quantum money? That is the question of this project.”
- We are deliberately simplifying the quantum-money column: no-cloning alone is not a construction of secure quantum money.

---

# Classical Fair Exchange

[Large visual: one tall central fair-exchange box. All inputs are labels on
plain horizontal arrows; use exactly the same coordinates on the next three
slides.]

```text
 Alice                 +------------------+                 Bob
 $_A ----------------->|                  |<----------------- $_B
                       |   Fair Exchange  |
 $_B <-----------------|                  |-----------------> $_A
                       +------------------+
```

If both inputs are valid, **swap them**.

### Speaker notes

- Abstract away the implementation and imagine an ideal fair-exchange box.
- Alice submits her classical input `$_A`; Bob submits `$_B`.
- If both inputs are valid, the functionality swaps them.
- Keep this slide simple; the cheating / rejection behavior comes next.

---

# Classical Fair Exchange: Rejection

[Reuse the exact same tall-box geometry. Bob submits garbage; suppress only
Bob's output arrow.]

```text
 Alice                 +------------------+                 Bob
 $_A ----------------->|                  |<------------- garbage
                       |   Fair Exchange  |
 Rej <-----------------|                  |
                       +------------------+
```

If Bob cheats, Alice receives **Rej**.

### Speaker notes

- Bob may cheat and submit garbage instead of a valid input.
- The ideal functionality rejects the exchange and tells Alice `Rej`.
- There is no need to return `$_A` to Alice: this is classical information, so Alice already knows / can retain her own input.
- This apparently trivial point becomes important when the input is a quantum
  state.

---

# Quantum Fair Exchange: Rejection?

[Reuse the exact same tall-box geometry. Change only Alice's input from
classical to quantum.]

```text
 Alice                 +------------------+                 Bob
 |$_A⟩ --------------->|                  |<------------- garbage
                       |   Fair Exchange  |
 Rej <-----------------|                  |
                       +------------------+
```

## Where is Alice's money?

### Speaker notes

- Change only one thing from the previous slide: Alice's input is now a
  quantum state.
- Classically, returning only `Rej` was fine because Alice could retain her classical input.
- But Alice may have sent her only copy of `|$_A⟩` into the protocol.
- If Bob cheats and the protocol simply rejects, Alice may have lost her input
  state.
- Pause on: “Where is Alice's money?”
- This is the point where the classical ideal functionality is no longer the right notion.

---

# Quantum Fair Exchange: Rejection

[Keep the exact same diagram, but change Alice's output to return her quantum
input on rejection.]

```text
 Alice                 +------------------+                 Bob
 |$_A⟩ --------------->|                  |<------------- garbage
                       |   Fair Exchange  |
 |$_A⟩ + Rej <---------|                  |
                       +------------------+
```

If Bob cheats, Alice gets her quantum input back.

### Speaker notes

- Rejection must preserve the honest party's input.
- If Bob cheats, Alice should recover a usable version of her quantum input,
  not merely learn that the exchange failed.
- Unlike in the classical case, this requirement is nontrivial because Alice cannot in general keep a backup copy of an unknown quantum state.
- This is the key change in the ideal functionality caused by no-cloning.
- Next, formalize what counts as a valid or usable returned input state,
  especially when verification can transform the state.

---

# Literature Survey

[Reveal this slide in four overlays: first classical fair exchange, then
multiparty quantum computation, then VQFHE, and finally the conclusion box.]

- **Classical fair exchange:** studied since the early 1980s

- **Multiparty quantum computation**
  - Identifiable abort: identify the cheating party and abort
  - `[ACCHLS21, CHTZ24]`

- **Verifiable quantum homomorphic encryption**
  - A key technical building block
  - `[ADSS17]`

> Identifying the cheater does not return the honest party's quantum input.

### Speaker notes

- Keep the classical literature deliberately brief: fair exchange has been studied since the early 1980s, and there is a long classical literature.
- Light transition if useful: “Aravind probably knows much more of this history than I do, so I'll skip ahead about forty years.”
- The closest quantum line of work for this talk is multiparty quantum
  computation with identifiable abort.
- Identifiable abort gives accountability: if someone cheats, we can identify the cheating party and abort.
- For fair exchange, accountability alone does not answer what happens to the
  honest party's quantum input.
- Mention VQFHE only as a technical building block here; defer the technical review until after the main goals / theorems.
- Use mnemonic alphabetic labels, with one author initial per surname, rather
  than numeric references. This makes `[ACCHLS21, CHTZ24]` and `[ADSS17]`
  readable as names while presenting.

---

# Main Goals

[Reveal this slide in three overlays. Overlay 1 stops after “We aim to show two
complementary results:”. Overlay 2 adds the classical-TTP impossibility result;
overlay 3 adds the limited-quantum-capabilities result.]

We define **quantum fair exchange** for quantum states that cannot be copied.

We aim to show two complementary results:

1. **Impossibility with a classical trusted third party**
   - Quantum fair exchange is impossible in general, even with a classical trusted third party.

2. **Possibility with limited quantum capabilities**
   - A trusted party may use **quantum states prepared before the exchange**,
     plus storage.
   - During the exchange, its only quantum operation is a **SWAP gate** to
     move stored states.

### Speaker notes

- These are goals / ongoing results, so keep the language consistent with the abstract: “we aim to show,” rather than presenting everything as a finished theorem.
- Emphasize the complementarity of the two main results: a fully classical trusted party is insufficient, but surprisingly limited quantum capabilities suffice.
- The important resource question is not simply “trusted party or no trusted party,” but what quantum capabilities the trusted party needs.
- Do not explain the technical reason yet. The next section can start with the impossibility result and its intuition.
- Do not promise the $n$-party extension on the main path. If it comes up,
  treat it as future work or a backup-slide topic.

---

# Our Impossibility Result

[Main-result slide. Hard-code perfect honest correctness for the talk.]

Assume a $T$-round fair-exchange protocol $\Pi$ with a **classical TTP**:

$$
\bigl(\ket{\$_A},\ket{\$_B}\bigr)
  \xrightarrow{\quad\Pi\quad}
\bigl(\ket{\$_B},\ket{\$_A}\bigr).
$$

> **Reduction to quantum cloning:** $\Pi$ duplicates one of the two inputs
> with probability $\Omega(1/T)$.

### Speaker notes

- Hard-code $p=1$ in the visible statement. The general form replaces
  $1/(2T)$ by $p/(2T)$, up to fairness and correctness errors.
- The $1/T$ quantity is the scale of the **cloning attack's success**, not an
  upper bound on honest protocol success.
- Operational unclonability means that, from one identified input state,
  producing two usable versions of that same input state has negligible
  probability.
- Textbook deterministic no-cloning alone is not a quantitative security game; the operational unclonability premise is what makes the direct reduction sound.
- Alice and Bob may exchange quantum messages. The restriction is that the trusted party has no quantum state that must remain uncopyable.
- BB84 is one concrete witness used by the longer manuscript proof; omit it
  from the talk.
- Keep the result informal while the precise model and error parameters are
  still being finalized.

---

# Reduction Intuition

Suppose the exchange happens in round $t$.

[Draw Alice and Bob with two clean crossing arrows. The upper Alice-to-Bob
arrow is teal and labelled $\ket{\$_A}$; the lower Bob-to-Alice arrow is gold
and labelled $\ket{\$_B}$. Put `round $t$` above the crossing arrows.]

Choose $t^*\leftarrow\{1,\ldots,T\}$ at random.

$$
\Pr[t^*=t]=1/T.
$$

### Speaker notes

- This is explicitly an intuition slide. A general protocol need not send raw
  input registers or have one sharp exchange round.
- In the sharp cartoon, choosing the exchange round costs probability $1/T$.
- Formally, the proof uses same/adjacent stopping experiments and obtains a
  mismatch of order $1/T$ by averaging. Do not charge a second random-guess
  loss on top of that.
- Keep all of that bookkeeping out of the audience-facing story.

---

# The Reduction

At round $t^*$, deliver Alice's message to Bob and withhold Bob's message from
Alice.

[Draw Alice and Bob. The upper Alice-to-Bob arrow is solid teal and labelled
$\ket{\$_A}$ delivered. The lower Bob-to-Alice arrow is dashed red, crossed
out, and labelled $\ket{\$_B}$ withheld.]

- If Alice rejects, fairness must restore $\ket{\$_A}$.
- Bob accepts $\ket{\$_A}$.

> **No recovery** $\Rightarrow$ unfair. **Recovery** $\Rightarrow$ two copies
> of $\ket{\$_A}$.

### Speaker notes

- This is an operational cartoon. The arrows need not literally be raw input
  registers.
- Because the TTP holds only bits, the reduction can copy those bits before
  round $t^*$ and let the two stopping experiments finish separately.
- If Bob accepts, he has Alice's identified input. If Alice rejects,
  input-preserving fairness must return that same identified input to her.
- If Alice receives nothing, fairness is already broken. If she receives her
  input back, the two outputs constitute a clone.
- Formally, same-cut and adjacent-cut cases show that one of the $T$ locations
  produces this mismatch with probability $\Omega(1/T)$.
- No quantum register is copied as an intermediate step; the contradiction is
  at the two final outputs.

---

# Feasibility: What We Show

[Reveal this slide in three overlays: correctness, then input-state preservation,
then the composable-security work item.]

| **Property-based security** | **Still in progress** |
|---|---|
| **Correctness:** If both parties are honest, they accept and receive each other's states. | Composable security. |
| **Input-state preservation (soundness):** An honest party leaves with a valid state:<br><br>$\mathsf{Acc}\Longrightarrow$ the other party's input;<br>$\mathsf{Rej}\Longrightarrow$ its own input. | |

### Speaker notes

- This is the bridge from the impossibility result to the candidate
  construction: allowing the TTP to hold quantum states removes the
  copyable-classical-state step.
- Formally, both guarantees hold except with negligible probability. On
  accept, the honest party's output is accepted by the other party's
  verifier; on reject, it is accepted by its own verifier.
- The active manuscript currently contains a proof sketch for these
  property-based guarantees. Several protocol details and the full proof are
  still being finalized.
- Simulation-based security that composes is future work. Do not claim a
  particular composable framework yet.
- Transition: what changes when the trusted party can actually hold quantum
  information? Show the whole construction in two pictures before unpacking
  the machinery.

---

# Protocol Sketch I: Input Encoding

```text
 Alice                  Input Encoding                  Quantum TTP

 |$_A>  --------------------->
                              ----------------------> TEnc(|$_A>)
```

### Speaker notes

- This is a roadmap, not notation the audience is expected to know yet. For
  now, read $\mathsf{TEnc}$ as “protected encoding”; the next background
  slides unpack it.
- The symbol is deliberately schematic. In the concrete protocol, the TTP
  holds a QEC-encoded, one-time-padded state; fresh hidden tests are inserted
  during evaluation rather than stored permanently with it.
- Alice has teleported her unique input into that register and keeps no backup
  copy.
- The next cartoon asks how Bob can verify that input without ever receiving
  it unprotected.

---

# Protocol Sketch II: Verified Evaluation

[Draw plain Quantum-TTP and Bob lanes. The TTP holds
$\mathsf{TEnc}(\ket{\$_A})$. Draw four unlabelled alternating arrows and put a
right-hand brace around them labelled $\mathsf{Ver\text{-}Eval}$.]

**Catch a cheating Bob before the encoded state is damaged beyond repair.**

### Speaker notes

- $\mathsf{Ver\text{-}Eval}$ is only a name for the repeated protected
  interaction in this roadmap; it is not a standard primitive, and the four
  arrows are not yet the exact messages.
- The intended effect is to evaluate Alice's public verifier while
  interleaving checks, so a cheating Bob is caught before accumulated damage
  exceeds the correction budget.
- The two-party picture is only intuition. The actual checked-gate protocol is
  three-party: Alice checks Bob's work, and the roles reverse for Bob's input.
- Transition: the sketch asks for error correction, hidden tests, and
  computation that preserves those tests. Build those ingredients next.

---

# Background: Quantum Error Correction

[Draw $\ket\psi\to\mathsf{QEnc}$, a row of $n$ physical qubits with a few
damaged positions, then
$\mathsf{QDec}\to\ket\psi$.]

**One entangled block---not $n$ copies of $\ket\psi$.**

$$
\mathsf{QDec}\!\left(
  \textcolor{red}{\mathcal A}\bigl(\mathsf{QEnc}(\ket\psi)\bigr)
\right)=\ket\psi
\quad\text{if $\mathcal A$ damages at most $\lambda$ positions.}
$$

### Speaker notes

- This is the first promised ingredient: it makes “damaged beyond repair”
  precise by giving each encoded block a correction budget.
- Keep this at the one-idea level: encode one logical qubit into an entangled
  block of $n$ physical qubits. In the manuscript,
  $n=\ell_{\mathrm{code}}$.
- This is not cloning. No physical position contains its own copy of the
  unknown input.
- Suppress code distance on the audience slide and call the required
  correction budget $\lambda$. The active draft asks for a code correcting a
  constant multiple of the security parameter.
- $\mathcal A$ is the attack/noise channel; the equation applies when its
  effect is supported on at most $\lambda$ physical positions.
- Authentication will detect adversarial tampering; QEC repairs bounded
  residual damage.

---

# Transversal operations

[Show two encoded blocks, one above the other. Apply a physical CNOT between
every pair of matching positions. Put the CNOT truth table to the right.]

| input | output |
|---|---|
| $\ket{00}$ | $\ket{00}$ |
| $\ket{01}$ | $\ket{01}$ |
| $\ket{10}$ | $\ket{11}$ |
| $\ket{11}$ | $\ket{10}$ |

$$
\mathsf{CNOT}^{\otimes n}
\mathsf{QEnc}^{\otimes 2}\ket{\psi,\phi}
=\mathsf{QEnc}^{\otimes 2}
\mathsf{CNOT}\ket{\psi,\phi}.
$$

### Speaker notes

- The first bit/qubit is the control. CNOT flips the target precisely when the
  control is one.
- For the self-dual CSS/Steane-family example, applying one physical CNOT
  between every matching pair implements one logical CNOT between the encoded
  blocks.
- The two logical outputs may be entangled, so do not describe this as two
  independent output states.
- This is a concrete transversal operation. Not every gate is available this
  simply.

---

# Background: Quantum Authentication

[Use plain client/server lanes, with no circuit input and no boxes around
either party's local operations. Keep the two message arrows short enough not
to collide with those operations.]

```text
 Client                                                Server

 k <- KeyGen
 |psi-tilde> <- Auth_k(|psi>)

       protected state |psi-tilde> -------------------->
                                             untrusted A
       returned state |psi-tilde'> <-------------------

 VerDec_k(|psi-tilde'>)  ↦  |psi_out> or Rej
```

$$
\text{accept}\quad\Longrightarrow\quad
\ket{\psi_{\mathrm{out}}}\approx\ket\psi.
$$

### Speaker notes

- This is the integrity game. The visible slide uses pure states throughout
  for the audience; a full definition also preserves entanglement with an
  external reference system.
- The attacker can always destroy the authenticated state and force
  rejection. Authentication prevents an undetected change.
- The authenticating key also commonly hides the plaintext, but privacy is not
  the conceptual point of this slide.
- Transition: the trap code is a concrete way to implement this game.

---

# Background: The Trap Code

Let $n$ be the number of physical qubits in one encoded block.

**Key generation**

$$
\pi\gets_{\$}S_{3n},
\qquad
x,z\gets_{\$}\{0,1\}^{3n}.
$$

**Encryption**

$$
\mathsf{Enc}_{\pi,x,z}(\ket\psi)
=X^xZ^z\,\pi\!\left(
  \mathsf{QEnc}\ket\psi\otimes\ket{0^n}\otimes\ket{+^n}
\right).
$$

**Verified decryption**

1. Undo $X^xZ^z$, then $\pi$.
2. Measure and check the $\ket{0^n}$ and $\ket{+^n}$ traps.
3. If any test fails: $\mathsf{Rej}$.
4. Otherwise return $\mathsf{QDec}(\text{data})$.

### Speaker notes

- $S_{3n}$ is the symmetric group and $X^xZ^z$ is a uniformly random
  $3n$-qubit Pauli pad. For several plaintext qubits, reuse $\pi$ and sample an
  independent Pauli pad per block.
- More precisely, $0$-traps detect $X/Y$ components and $+$-traps detect $Z/Y$
  components.
- Use $n$, rather than $\lambda$, because the physical block length may be
  polynomially larger than the number of errors it corrects.
- The current manuscript does not keep a persistent standard trap-code
  ciphertext at the TTP. It inserts fresh tests in every checked operation;
  keep this distinction in the notes rather than forcing it onto this
  introductory slide.

---

# Background: VQFHE

[Use plain client/server lanes and no boxes around local operations.]

```text
 Client                                                Server

 (pk,sk) <- KeyGen
 |phi-tilde> <- Enc_pk(|phi>)

          (|phi-tilde>,C) ---------------------------->
                     |psi-tilde> <- Eval_pk(C,|phi-tilde>)
          |psi-tilde> <--------------------------------

 VerDec_sk(|psi-tilde>)  ↦  |psi> or Rej
```

$$
\mathsf{Accept}\quad\Longrightarrow\quad
\ket\psi\approx C\ket\phi.
$$

### Speaker notes

- This is the abstraction behind the $\mathsf{Ver\text{-}Eval}$ roadmap label:
  compute on a protected state and accept only a certified result.
- This is a deliberately simplified public-key interface, separated from the
  concrete CNOT mechanism on the next slide.
- In the full VQFHE syntax, an evaluation key and a computation log may appear
  separately. Here the evaluation key is folded into $\mathsf{pk}$, and the
  log into the returned $\ket{\widetilde\psi}$.
- The visible pure-state equation is the unitary cartoon. For a general
  circuit, write $\rho_{\mathrm{out}}\approx\Phi_C(\rho)$ and preserve
  entanglement with an external reference.
- A malicious server may always force rejection. Acceptance certifies the
  requested computation, up to negligible error.
- Privacy is a separate part of the definition: the evaluator should not
  learn the plaintext.

---

# Background: Homomorphic CNOT

Both ciphertexts use the **same hidden permutation** $\pi$ and
**independent one-time pads**.

[Show the two permuted $3n$-position ciphertext blocks one above the other.
Use the same two-color hidden pattern in both blocks only as an explanatory
view, and apply one physical CNOT between every pair of corresponding
positions. A brace below says “apply $\mathsf{CNOT}^{\otimes 3n}$”.]

$$
\bigl(\ket{\widetilde\psi'},\ket{\widetilde\phi'}\bigr)
\leftarrow
\mathsf{CNOT}^{\otimes 3n}
\bigl(\ket{\widetilde\psi},\ket{\widetilde\phi}\bigr).
$$

### Speaker notes

- This construction visually echoes the transversal-CNOT slide: apply one
  physical CNOT between every pair of corresponding encrypted positions.
- The identical color pattern is only an explanatory view. The evaluator does
  not know which positions are encoded data, $0$-tests, or $+$-tests.
- Both ciphertext blocks share the same secret permutation $\pi$ so that
  corresponding types line up, but their Pauli pads are sampled independently.
- For the first block as control, the exact Pauli-key rule is
  $(x_1,z_1,x_2,z_2)\mapsto
  (x_1,z_1\oplus z_2,x_1\oplus x_2,z_2)$. Keep this analysis off the visible
  construction slide.

---

# Background: Homomorphic CNOT Analysis

[Reveal this slide in six overlays. Overlay 1 shows the two encryption
equations and the common-$\pi$/independent-pad reminder. Overlays 2--5 reveal,
in order, the new-pad-keys, same-permutation, logical-CNOT, and tests-unchanged
rows. Overlay 6 reveals the `[ADSS17]` universality remark.]

$$
\begin{aligned}
\mathsf{TEnc}_{\pi,Q_1}(\ket\psi)
  &=Q_1\,\pi\!\left(
    \mathsf{QEnc}\ket\psi\otimes\ket{0^n}\otimes\ket{+^n}
  \right),\\[-0.05em]
\mathsf{TEnc}_{\pi,Q_2}(\ket\phi)
  &=Q_2\,\pi\!\left(
    \mathsf{QEnc}\ket\phi\otimes\ket{0^n}\otimes\ket{+^n}
  \right).
\end{aligned}
$$

Same $\pi$; independently random $Q_1,Q_2$.

| | Why the operation works |
|---|---|
| **new pad keys** | $\mathsf{CNOT}^{\otimes3n}(Q_1\otimes Q_2)=(Q'_1\otimes Q'_2)\mathsf{CNOT}^{\otimes3n}$ |
| **same permutation** | $\mathsf{CNOT}^{\otimes3n}(\pi\otimes\pi)=(\pi\otimes\pi)\mathsf{CNOT}^{\otimes3n}$ |
| **logical CNOT** | $\mathsf{CNOT}^{\otimes n}\mathsf{QEnc}^{\otimes2}=\mathsf{QEnc}^{\otimes2}\mathsf{CNOT}$ |
| **tests unchanged** | $\mathsf{CNOT}\ket{00}=\ket{00}$, $\mathsf{CNOT}\ket{++}=\ket{++}$ |

Universality gets tricky `[ADSS17]`.

### Speaker notes

- This slide is the analysis of the preceding construction. Read it from top
  to bottom in the same order as $Q\pi(\cdot)$: pad, permutation, data, tests.
- $Q'_1\otimes Q'_2$ is defined by conjugating the original two-block Pauli
  through $\mathsf{CNOT}^{\otimes3n}$, so the first identity is exact up to
  the irrelevant Pauli phase.
- The second identity is why the two trap-code ciphertexts must share a
  permutation. Independent permutations would pair data positions with
  unknown trap types.
- CNOT is a clean example, but universality in the cited VQFHE construction is
  the technically difficult part.
- Transition: that was the toolkit. Now instantiate the two idealized protocol
  pictures, beginning with teleporting the input to the TTP.

---

# Construction I: Teleport to the TTP

[Use two plain, unboxed vertical lanes, Alice and the quantum TTP.]

1. The TTP prepares
   $(I\otimes\mathsf{TEnc})\ket{\mathrm{EPR}}$.
2. TTP $\rightarrow$ Alice: one half of the entangled pair.
3. Alice teleports $\ket{\$_A}$ into that half and returns the classical
   teleportation outcome.
4. The TTP now holds $\mathsf{TEnc}(\ket{\$_A})$.

### Speaker notes

- Back from the background: this realizes Protocol Sketch I.
- The manuscript calls this input commitment; for the talk, simply say that
  Alice teleports the state to the TTP. It is not a bit-commitment primitive.
- The visible $\mathsf{TEnc}$ notation intentionally suppresses the classical
  teleportation correction and the at-rest QEC-plus-pad distinction.
- More precisely, for each teleported input qubit, if the correction is $P_i$,
  the retained QEC block has pad key
  $Q_i^0=Q_i^{\mathrm{init}}\overline P_i$. There is no trap permutation in
  the at-rest state.
- Encoded entangled pairs can be prepared before the exchange. During the
  exchange, the TTP sends one half and updates only a classical one-time-pad
  key after Alice's teleportation measurement.
- Teleportation preserves entanglement with an external reference system.
- Next: realize $\mathsf{Ver\text{-}Eval}$ one checked gate at a time.

---

# Construction II: One Checked Gate

For one physical position, define

$$
G:=g^{(j)},\qquad
\ket W:=\pi_E\bigl(\ket{D_j},X^e\ket{0^w},Z^f\ket{+^w}\bigr).
$$

[There is no visible “without re-encryption” line. Use the same fixed-coordinate
diagram as the next frame: Alice–TTP–Bob lanes, with the middle heading
shortened to **TTP**, extra Alice–TTP separation, generous vertical spacing
between all four arrows, and a right-hand brace labelled “repeat for
$j=1,\ldots,n$”. Reserve the second preamble line invisibly so the two
diagrams stay page-registered, and stop the TTP's dotted lane above the local
check equation.]

1. TTP $\rightarrow$ Bob: $\ket W$.
2. Bob $\rightarrow$ TTP: $G^{\otimes3}\ket W$.
3. TTP $\rightarrow$ Alice:

   $$
   \begin{aligned}
   \ket{T_0}&=\pi_0(G X^e\ket{0^w},\,G X^u\ket{0^w}),\\
   \ket{T_+}&=\pi_+(G Z^f\ket{+^w},\,G Z^v\ket{+^w}).
   \end{aligned}
   $$

4. Alice $\rightarrow$ TTP:

   $$
   \begin{aligned}
   o_0&\leftarrow\mathsf{Meas}_Z((G^\dagger)^{\otimes2}\ket{T_0}),\\
   o_+&\leftarrow\mathsf{Meas}_X((G^\dagger)^{\otimes2}\ket{T_+}).
   \end{aligned}
   $$

At the TTP:

$$
\text{check the trap outcomes }o_0,o_+;
\qquad
\text{keep }G\ket{D_j}.
$$

### Speaker notes

- This is the warm-up version with no fresh re-encryption. It isolates the
  four-message check; the next frame adds the missing security layer without
  moving anything.
- This is one complete per-coordinate interaction. The TTP checks Alice's
  reported outcomes before advancing to $j+1$; Bob never touches all
  coordinates before a check occurs.
- The visible pure-state notation is a talk-level purification shorthand. The
  data column $D_j$ may be entangled with the other columns and an external
  reference.
- Here $u,v\in\{0,1\}^w$ and the two fresh pair permutations satisfy
  $\pi_0,\pi_+\in S_2$; also $e,f\in\{0,1\}^w$.
- Alice receives each returned test mixed with a fresh known output test.
- In an honest execution, undoing $G$ makes the old and fresh traps yield
  exactly $(e,u)$ and $(f,v)$. Under attack, $G\ket{D_j}$ denotes the honest
  value of the first register retained after the TTP undoes $\pi_E$.
- If the current data pad is $Q$, the corresponding warm-up update is
  $Q_{\mathrm{new}}=GQG^\dagger$.
- This warm-up alone is not the final secure construction: without fresh
  Pauli re-encryption, correlations can persist between calls.

---

# Construction II: Add Re-encryption

For the same physical position, add

$$
\begin{gathered}
G:=g^{(j)},\qquad
\ket W:=\pi_E\bigl(\ket{D_j},X^e\ket{0^w},Z^f\ket{+^w}\bigr),\\
R\leftarrow\text{fresh Pauli}.
\end{gathered}
$$

[Duplicate the preceding frame's geometry exactly. Render every newly added
$R$, $R_D$, $R_0$, and $R_+$ in coral so this frame is a visual diff. Keep the
short middle heading **TTP**, the expanded lane/message spacing, and the same
right-hand repetition brace. The two-line preamble occupies the same height as
the warm-up preamble, and the TTP lane again ends before the local check.]

1. TTP $\rightarrow$ Bob: $\bigl(\ket W,R\bigr)$.
2. Bob $\rightarrow$ TTP: $R\,G^{\otimes3}\ket W$.
3. TTP $\rightarrow$ Alice:

   $$
   \begin{aligned}
   \ket{T_0}&=\pi_0(R_0G X^e\ket{0^w},\,G X^u\ket{0^w}),\\
   \ket{T_+}&=\pi_+(R_+G Z^f\ket{+^w},\,G Z^v\ket{+^w}).
   \end{aligned}
   $$

4. Alice $\rightarrow$ TTP:

   $$
   \begin{aligned}
   o_0&\leftarrow\mathsf{Meas}_Z((G^\dagger)^{\otimes2}\ket{T_0}),\\
   o_+&\leftarrow\mathsf{Meas}_X((G^\dagger)^{\otimes2}\ket{T_+}).
   \end{aligned}
   $$

At the TTP:

$$
\text{check the trap outcomes }o_0,o_+;
\qquad
\text{keep }R_DG\ket{D_j}.
$$

### Speaker notes

- This is the same interaction as the preceding frame. The coral symbols are
  the only additions: a fresh Pauli re-encryption and its induced corrections.
- $R$ is a uniformly random Pauli on the permuted three-register block, sent
  to Bob as a classical description. Bob applies $G^{\otimes3}$ first and then
  $R$.
- Conjugating into the hidden register order gives
  $\pi_E^{-1}R\pi_E=R_D\otimes R_0\otimes R_+$. Bob knows $R$ in permuted coordinates but does
  not know which factor acts on data, $0$-traps, or $+$-traps.
- In the manuscript notation, $R$ is $P'_{\pi_E}$ and
  $(R_D,R_0,R_+)=(Q',P'_0,P'_+)$. The talk renames the operators so $R$ reads
  as re-encryption.
- Since the directly supported gate normalizes Paulis, write
  $G^\dagger R_sG=X^{a_s}Z^{b_s}$. After applying $\pi_0^{-1}$ and
  $\pi_+^{-1}$, the
  expected strings are $(a_0\oplus e,u)$ and $(b_+\oplus f,v)$.
- On acceptance the TTP retains $R_DG\ket{D_j}$ and updates the data pad to
  $Q_{\mathrm{new}}=R_DGQG^\dagger$.
- A tensor product of three independent $w$-qubit Paulis is equivalently
  uniform in $\mathcal P_{3w}$; global Pauli phases are irrelevant.
- This is still a candidate construction. The complete coherent-attack and
  culprit-attribution arguments are being finalized.

---

# Construction III: Circuit Evaluation

[Reuse the Alice–TTP–Bob lanes. Draw eight unlabelled arrows: a dashed box
around the first four labelled $\pi_{\mathsf{gate}}(g_t)$, and another dashed
box around the other four labelled $\pi_{\mathsf{gate}}(I)$. Do not add
micro-labels such as “hidden triple”, “apply”, “trap pairs”, or “outcomes”. Put
a right-hand brace `}` on the right labelled $t=1,\ldots,T$. Leave generous
padding below the lowest arrow in each dashed region.]

The first four-arrow region is labelled only
$\pi_{\mathsf{gate}}(g_t)$; the second is labelled only
$\pi_{\mathsf{gate}}(I)$. Each region is the primitive from the previous slide
and internally repeats over $j\in[n]$.

**For every circuit gate, run $\pi_{\mathsf{gate}}$ twice, with Alice and Bob
exchanging roles.**

### Speaker notes

- For Alice's input, Alice is the sender and Bob is the verifier. In the
  actual-gate call Bob evaluates and Alice checks. In the identity call the
  roles reverse.
- Show all eight arrows with no arrow-level labels; the repeated geometry and
  the two $\pi_{\mathsf{gate}}$ labels are enough.
- A circuit is not literally eight messages total: this pair of calls repeats
  for every instruction, and every call repeats over all physical code
  coordinates.
- Technically, directly supported gates use this primitive. Measurements use a
  separate trap-checked primitive, and the remaining gate is compiled using a
  magic state. Keep those details oral or on the advance-preparation slide.
- This is a candidate construction and its load-bearing coherent-attack argument is still being finalized. Do not present the security statement as a finished theorem.

---

# Construction IV: Full Exchange

[Show the complete flow at once. Keep input encoding centered on the top row
with a larger vertical gap before the verification row. Put steps 2 and 3 side
by side, connected by an arrow labelled **then**. From step 2, curve downward
and inward to the right into the left side of the wait box; from step 3, curve
downward and inward to the left into its right side. Enlarge both outcome
panels so their TTP circles and state arrows sit fully inside. The side-by-side
placement is only a layout choice: the two circuit evaluations are sequential,
and the slide makes no parallel-composition-security claim.]

1. **Input encoding:** Alice and Bob teleport their inputs into separate
   encrypted blocks held by the TTP.
2. **Verify Alice's input:** Bob evaluates Alice's verification circuit; Alice
   checks.
3. **Verify Bob's input:** Alice evaluates Bob's verification circuit; Bob
   checks.
4. **Release:** the TTP waits for both verification results, then makes one
   decision:

```text
 both accept                               otherwise

 |$_B>  ---> Alice                        |$_A>  ---> Alice
 |$_A>  ---> Bob                          |$_B>  ---> Bob

     EXCHANGE                             RETURN TO OWNERS
```

### Speaker notes

- The two one-sided circuit evaluations leave the processed encrypted input states
  and their updated pad keys at the TTP until both verification results are
  known.
- On success the outputs cross. On failure each updated input state returns to
  its original owner.
- Bob runs the public circuit that validates Alice's input; Alice runs the
  circuit that validates Bob's input.
- Steps 2 and 3 are side by side only to save vertical space. The **then**
  arrow specifies a sequential schedule; no parallel-composition claim is
  being made.
- The fairness lever is delayed release: neither party receives the other's
  unique input until both checks have completed.
- The quantum resources can be prepared in advance. During the exchange, the
  TTP's quantum behavior is intended to reduce to storage, communication, and hidden
  permutations implemented with routing/SWAP; checks and key updates are
  classical.
- This removes the copyable-classical-state step from the impossibility
  argument: the trusted party now holds irreplaceable quantum states.
- Say “construction idea” or “candidate construction” while the security proof and a few circuit details remain in progress.

---

# Result: Feasibility with a Quantum TTP

**All quantum resources are input-independent.**

**Before either input is known, the TTP prepares:**

- $(I\otimes\mathsf{TEnc})\ket{\mathrm{EPR}}$ for input encoding;
- $Q_0\,\mathsf{QEnc}(\ket0)$ and $Q_T\,\mathsf{QEnc}(\ket T)$ in the VQFHE
  evaluation key, where $\ket T:=T\ket+$;
- $X^x\ket0$ and $Z^z\ket+$ traps for gate evaluation;
- $G X^x\ket0$ and $G Z^z\ket+$ traps measured during gate verification.

[Reveal this frame in two states. The heading and complete offline resource
list appear first; pause after the list, then reveal the `Online:` capability
boundary.]

**Online:** quantum storage and routing only; checks and key updates are
classical.

### Speaker notes

- This restates the feasibility result as a resource theorem after the
  audience has seen the full protocol.
- All listed quantum resources are input-independent and can be prepared
  before Alice or Bob supplies an input.
- The visible $\mathsf{TEnc}$ in the first bullet is the same schematic
  shorthand used earlier. The actual retained halves are QEC encoded and
  one-time padded; teleportation moves the inputs into them.
- The visible “VQFHE evaluation key” wording groups the encoded, padded
  $\ket0$ and $\ket T$ resources under their familiar role. The manuscript's
  preprocessed resource pool is more explicit than this shorthand.
- A standard injection consumes $\ket T$ using an entangling gate, a
  measurement, and outcome-dependent corrections.
- The third and fourth bullets are the two pairs in a checked-gate call:
  evaluator traps and fresh known-output traps for the verifier's
  measurements. Their pad strings are independently random; the repeated
  $x,z$ notation is schematic.
- The separate checked computational-basis measurement primitive uses a fresh
  $X^r\ket0$ trap. The exact resource count depends on the circuit and on
  whether it is chosen adaptively.
- The TTP also keeps classical one-time-pad keys, secret permutations, and expected
  test outcomes.
- Say “candidate theorem”: the current manuscript has the construction and a
  proof sketch, while the complete security proof and some circuit details
  remain in progress.

---

# Thank You

## Questions?

[Disable the frame-title progress bar before this closing frame; leave it off
on the two reference pages as well.]

### Speaker notes

- Stop here for questions. The two reference pages that follow are unnumbered
  backup pages.
