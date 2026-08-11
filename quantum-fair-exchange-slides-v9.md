# Quantum Fair Exchange — Presentation Draft

> Working Markdown for the 40-minute theory-group presentation.
> We will refine this slide-by-slide. Notes in brackets are production/speaker notes, not necessarily slide text.

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
between them. Put each party's asset directly below that party rather than on
the arrow.]

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

                              🏦 Bank / Card Network
                               │
                          payment / dispute
                               │
                               ▼

**Alice**  ------------------- $100 ------------------->  **Bob**
   ▲                                                       │
   │                                                       │
   └---------------- 🎫 Digital Ticket --------------------┘

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

---

# Digital Cash: Blockchain vs. Quantum Money

| | Cryptocurrency / Blockchain | Quantum Money |
|---|---|---|
| **Issuance** | Network rules | Bank / issuer |
| **Prevent double spending** | Shared transaction record | No-cloning + cryptography |
| **Transfer** | Record the transfer on a global blockchain | Send the quantum state |
| **Fair exchange** | Programmed all-or-nothing exchange | **???** |

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

[Large visual: one tall central fair-exchange box. All assets are labels on
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
- Alice submits her classical asset `$_A`; Bob submits `$_B`.
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

If Bob submits an invalid asset, Alice receives **Rej**.

### Speaker notes

- Bob may cheat and submit garbage instead of a valid asset.
- The ideal functionality rejects the exchange and tells Alice `Rej`.
- There is no need to return `$_A` to Alice: this is classical information, so Alice already knows / can retain her own input.
- This apparently trivial point will become important when the asset is quantum.

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

- Change only one thing from the previous slide: Alice's asset is now a quantum state.
- Classically, returning only `Rej` was fine because Alice could retain her classical input.
- But Alice may have sent her only copy of `|$_A⟩` into the protocol.
- If Bob cheats and the protocol simply rejects, Alice may have lost her asset.
- Pause on: “Where is Alice's money?”
- This is the point where the classical ideal functionality is no longer the right notion.

---

# Quantum Fair Exchange: Rejection

[Keep the exact same diagram, but change Alice's output to return her quantum
asset on rejection.]

```text
 Alice                 +------------------+                 Bob
 |$_A⟩ --------------->|                  |<------------- garbage
                       |   Fair Exchange  |
 |$_A⟩ + Rej <---------|                  |
                       +------------------+
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

- **Multiparty quantum computation**
  - Identifiable abort: identify the cheating party and abort
  - `[ACCHLS21, CHTZ24]`

- **Verifiable quantum homomorphic encryption**
  - A key technical building block
  - `[ADSS17]`

> Identifying the cheater does not return the honest party's quantum asset.

### Speaker notes

- Keep the classical literature deliberately brief: fair exchange has been studied since the early 1980s, and there is a long classical literature.
- Light transition if useful: “Aravind probably knows much more of this history than I do, so I'll skip ahead about forty years.”
- The closest quantum line of work for this talk is multiparty quantum
  computation with identifiable abort.
- Identifiable abort gives accountability: if someone cheats, we can identify the cheating party and abort.
- For fair exchange, accountability alone does not answer what happens to the honest party's quantum asset.
- Mention VQFHE only as a technical building block here; defer the technical review until after the main goals / theorems.
- Use mnemonic alphabetic labels, with one author initial per surname, rather
  than numeric references. This makes `[ACCHLS21, CHTZ24]` and `[ADSS17]`
  readable as names while presenting.

---

# Main Goals

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

# Impossibility with a Classical Trusted Party

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
- Operational unclonability means that, from one identified asset, producing
  two usable versions of that same asset has negligible probability.
- Textbook deterministic no-cloning alone is not a quantitative security game; the operational unclonability premise is what makes the direct reduction sound.
- Alice and Bob may exchange quantum messages. The restriction is that the trusted party has no quantum state that must remain uncopyable.
- BB84 is one concrete witness used by the longer manuscript proof; omit it
  from the talk.
- Keep the result informal while the precise model and error parameters are
  still being finalized.

---

# Suppose the Assets Change Hands in Round $t$

For the intuition, suppose one round completes the exchange.

[Draw Alice and Bob with two clean crossing arrows. The upper Alice-to-Bob
arrow is teal and labelled $\ket{\$_A}$; the lower Bob-to-Alice arrow is gold
and labelled $\ket{\$_B}$. Put `round $t$` above the crossing arrows.]

Choose $t^*\leftarrow\{1,\ldots,T\}$ at random.

$$
\Pr[t^*=t]=1/T.
$$

### Speaker notes

- This is explicitly an intuition slide. A general protocol need not send raw
  asset registers or have one sharp exchange round.
- In the sharp cartoon, choosing the exchange round costs probability $1/T$.
- Formally, the proof uses same/adjacent stopping experiments and obtains a
  mismatch of order $1/T$ by averaging. Do not charge a second random-guess
  loss on top of that.
- Keep all of that bookkeeping out of the audience-facing story.

---

# Let Only One Direction Through

At round $t^*$, deliver Alice's state to Bob and withhold Bob's state from
Alice.

[Draw Alice and Bob. The upper Alice-to-Bob arrow is solid teal and labelled
$\ket{\$_A}$ delivered. The lower Bob-to-Alice arrow is dashed red, crossed
out, and labelled $\ket{\$_B}$ withheld.]

- If Alice rejects, fairness must restore $\ket{\$_A}$.
- Bob accepts $\ket{\$_A}$.

> **No recovery** $\Rightarrow$ unfair. **Recovery** $\Rightarrow$ two copies
> of $\ket{\$_A}$.

### Speaker notes

- This is an operational cartoon. The arrows need not literally be raw asset
  registers.
- Because the TTP holds only bits, the reduction can copy those bits before
  round $t^*$ and let the two stopping experiments finish separately.
- If Bob accepts, he has Alice's identified asset. If Alice rejects,
  asset-preserving fairness must return that same identified asset to her.
- If Alice receives nothing, fairness is already broken. If she receives her
  asset, the two outputs constitute a clone.
- Formally, same-cut and adjacent-cut cases show that one of the $T$ locations
  produces this mismatch with probability $\Omega(1/T)$.
- No quantum register is copied as an intermediate step; the contradiction is
  at the two final outputs.

---

# What We Show---and What Remains

| **Property-based security** | **Still in progress** |
|---|---|
| **Correctness:** If both parties are honest, they accept and receive each other's states. | Composable security. |
| **Asset preservation (soundness):** An honest party leaves with a valid state:<br><br>$\mathsf{Acc}\Longrightarrow$ the other party's asset;<br>$\mathsf{Rej}\Longrightarrow$ its own asset. | |

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

# Background: Transversal CNOT

[Show two encoded blocks, one above the other. Apply a physical CNOT between
every pair of matching positions. Put the CNOT truth table to the right.]

**For the code we use, apply CNOT between matching positions.**

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

 Rej or |psi_out> <- VerDec_k(|psi-tilde'>)
```

$$
\text{accept}\quad\Longrightarrow\quad
\ket{\psi_{\mathrm{out}}}\approx\ket\psi.
$$

The attacker may always force rejection.

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
2. Measure the $0$-traps in $Z$ and the $+$-traps in $X$.
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

**VQFHE = verifiable quantum fully homomorphic encryption.**

[Use plain client/server lanes and no boxes around local operations.]

```text
 Client                                                Server

 (pk,sk,evk) <- KeyGen
 ct <- Enc_pk(|x>)

          (ct,evk,C) --------------------------------->
                        (ct-tilde,log) <- Eval_evk(C,ct)
          (ct-tilde,log) <-----------------------------

 Rej or |y> <- VerDec_sk(C,ct-tilde,log)
```

$$
\text{honest server: }\ket y=C\ket x,
\qquad
\text{malicious server: }\mathsf{Rej}\text{ or }\ket y\approx C\ket x.
$$

### Speaker notes

- This is the security interface, separated from the concrete CNOT mechanism
  on the next slide.
- The visible pure-state equation is the unitary cartoon. For a general
  circuit, write $\rho_{\mathrm{out}}\approx\Phi_C(\rho)$ and preserve
  entanglement with an external reference.
- A malicious server may always force rejection. Acceptance certifies the
  requested computation, up to negligible error.
- Privacy is a separate part of the definition: the evaluator should not
  learn the plaintext.

---

# Background: Homomorphic CNOT

Two trap-code ciphertexts use the **same hidden shuffle** $\pi$, but
**independent one-time pads**.

[Show the two shuffled $3n$-position ciphertext blocks one above the other.
Use the same hidden color pattern in both blocks only as an explanatory view,
and apply one physical CNOT between every pair of corresponding positions. A
brace below says “apply $\mathsf{CNOT}^{\otimes 3n}$”.]

$$
\bigl(\widetilde\sigma'_{\psi},\widetilde\sigma'_{\phi}\bigr)
\leftarrow
\mathsf{CNOT}^{\otimes 3n}
\bigl(\widetilde\sigma_{\psi},\widetilde\sigma_{\phi}\bigr).
$$

Encrypted pad keys are updated by XOR:

$$
(\widehat x_1,\widehat z_1,\widehat x_2,\widehat z_2)
\longmapsto
(\widehat x_1,
 \widehat z_1\mathbin\oplus\widehat z_2,
 \widehat x_1\mathbin\oplus\widehat x_2,
 \widehat z_2).
$$

### Speaker notes

- This construction visually echoes the transversal-CNOT slide: apply one
  physical CNOT between every pair of corresponding encrypted positions.
- The identical color pattern is only an explanatory view. The evaluator does
  not know which positions are encoded data, $0$-tests, or $+$-tests.
- Both ciphertext blocks share the same secret permutation $\pi$ so that
  corresponding types line up, but their Pauli pads are sampled independently.
- Hats denote classical homomorphic encryptions of the pad keys. The evaluator
  computes the four XOR expressions under the classical encryption scheme.
- For the first block as control, the exact Pauli-key rule is
  $(x_1,z_1,x_2,z_2)\mapsto
  (x_1,z_1\oplus z_2,x_1\oplus x_2,z_2)$.

---

# Background: Why Homomorphic CNOT Works

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

Let $U_r:=\mathsf{CNOT}^{\otimes r}$. Then:

$$
\begin{aligned}
U_{3n}(\pi\otimes\pi)
  &=(\pi\otimes\pi)U_{3n}
  &&\text{same positions},\\
U_{3n}(Q_1\otimes Q_2)
  &=(Q'_1\otimes Q'_2)U_{3n}
  &&\text{new pad keys},\\
U_n\,\mathsf{QEnc}^{\otimes2}
  &=\mathsf{QEnc}^{\otimes2}\mathsf{CNOT}
  &&\text{logical CNOT},\\
\mathsf{CNOT}\ket{00}=\ket{00},\qquad
\mathsf{CNOT}\ket{++}=\ket{++}
  &&&\text{tests unchanged}.
\end{aligned}
$$

Universality requires a substantially more involved construction `[ADSS17]`.

### Speaker notes

- This slide is the analysis of the preceding construction. Read it from top
  to bottom: shuffle, pad, data, tests.
- $Q'_1\otimes Q'_2$ is defined by conjugating the original two-block Pauli
  through $U_{3n}$, so the second identity is exact up to the irrelevant Pauli
  phase.
- The first identity is why the two trap-code ciphertexts must share a
  permutation. Independent permutations would pair data positions with
  unknown trap types.
- CNOT is a clean example, but universality in the cited VQFHE construction is
  the technically difficult part.

---

# Core Idea: Verify Before Release

The quantum TTP keeps the encoded asset while its verification circuit runs.

**1. Input encoding**

```text
Alice: |$_A>  -- teleport; QEC + pad -->  Quantum TTP
                                             holds Q QEnc(|$_A>)
```

**2. Evaluate $\mathsf{Ver}_A=g_T\cdots g_1$ one step at a time.**

```text
    g_1  -->  check  -->  g_2  -->  check  -->  ...  -->  g_T  -->  check
             \_________________________________________________________/
                       fresh hidden tests after every step
```

**If a test fails, stop while QEC can still repair the damage.**

### Speaker notes

- At ten thousand feet, the construction is VQFHE-shaped: encode the state,
  evaluate its public verifier without releasing the asset, and verify the
  computation.
- The notation $Q\,\mathsf{QEnc}(\ket{\$_A})$ is intentional. At this stage
  the TTP holds a QEC-encoded, one-time-padded state, not a persistent standard
  trap-code ciphertext.
- For Alice's asset, Bob performs the public verification computation and
  Alice cross-checks him; the roles reverse for Bob's asset.
- The important change from one final check is that fresh hidden tests
  accompany every gate and measurement. The intended guarantee is to detect
  an attack while accumulated errors remain within the QEC correction budget.
- The following slides zoom into the two ingredients shown here: input
  encoding, then checked gate-by-gate evaluation.
- Only after both verification computations finish does the TTP decide whether
  to exchange or return the assets.

---

# Construction I: Teleport to the TTP

[Use two plain, unboxed vertical lanes, Alice and the quantum TTP. Put a
right-hand brace `}` around the full exchange, labelled “repeat for each input
qubit $i$”. Keep this slide to the construction only.]

1. The TTP prepares an entangled pair $(L_i,D_i)$, encodes and pads $D_i$, and
   keeps it.
2. The TTP sends one half, $L_i$, to Alice.
3. Alice Bell-measures $\ket{\psi_i}$ together with $L_i$ and sends the
   classical Bell outcome $P_i$ to the TTP.
4. The TTP stores $[\ket{\widetilde\psi_i}\mid Q_i^0]$, where

$$
Q_i^0=Q_i^{\mathrm{init}}\overline{P_i}.
$$

### Speaker notes

- The manuscript calls this input commitment; for the talk, simply say that
  Alice teleports the state to the TTP. It is not a bit-commitment primitive.
- This frame is only the construction. Save the interpretation of the final
  TTP-held state for the next frame.
- Encoded EPR resources can be prepared before the exchange. During the
  exchange, the TTP routes $L_i$
  and updates a classical Pauli key after receiving $P_i$.
- Teleportation preserves entanglement with an external reference system.

---

# Construction I: What the TTP Holds

The quantum TTP stores

$$
\bigl(\ket{\widetilde\psi},Q^0\bigr),
\qquad
\ket{\widetilde\psi}
=Q^0\,\mathsf{QEnc}(\ket\psi).
$$

- The TTP holds the **encoded state and its one-time-pad key**.
- Alice retains **no backup copy** of the teleported input.
- This is QEC plus a quantum one-time pad. **Fresh hidden tests** are inserted
  only when a gate is evaluated.

### Speaker notes

- This is the interpretation separated from the preceding construction
  diagram.
- Operationally, the TTP ends with a fixed encrypted codeword that Alice can
  no longer modify or duplicate.
- Alice did not send a register carrying $\ket\psi$ directly to the TTP.
  Teleportation placed the state in the already encoded and padded retained
  half of the entangled pair.
- The stored state is not a persistent standard trap-code ciphertext and is
  not yet authenticated by traps. Integrity comes from fresh checks during
  each operation.

---

# Construction II: Bob Applies a Gate

[Use unboxed Quantum-TTP and Bob lanes, with a right-hand brace `}` labelled
$j=1,\ldots,n$.]

For position $j$, let $G:=g^{(j)}$ and let $\ket{D_j}$ be the encrypted data.
The TTP prepares

$$
\ket{E_0}=X^e\ket{0^w},
\qquad
\ket{E_+}=Z^f\ket{+^w},
$$

and secretly shuffles these three states and chooses new pad keys
$Q',P'_0,P'_+$.

1. TTP $\rightarrow$ Bob:
   - quantum: $\pi_E(\ket{D_j},\ket{E_0},\ket{E_+})$;
   - classical: $\pi_E(Q',P'_0,P'_+)$.
2. Bob $\rightarrow$ TTP:

   $$
   \pi_E\!\left(
     Q'G\ket{D_j},
     P'_0G\ket{E_0},
     P'_+G\ket{E_+}
   \right).
   $$

**The hidden shuffle forces Bob to treat data and both tests alike.**

### Speaker notes

- Pure-state notation is a talk-level purification shorthand; $D_j$ may be
  entangled with the other columns and an external reference.
- Here $w$ is the width of one column and $e,f\in\{0,1\}^w$. The three fresh
  Paulis lie in $\mathcal P^{\otimes w}$.
- Bob receives the three Pauli instructions in the same secret order as the
  data and tests. He therefore applies $Q'G$, $P'_0G$, and $P'_+G$ to the
  correct anonymous registers without learning which is data.
- The active manuscript repeats over $j\in[\ell_{\mathrm{code}}]$, not
  $j\in[3\lambda]$. There are three evaluator registers per position.

---

# Construction II: Alice Checks the Result

[Use unboxed Alice and Quantum-TTP lanes. Separate the two arrows enough for
both two-line labels to fit cleanly between them. Put a right-hand brace `}`
at the right, labelled $j=1,\ldots,n$.]

The TTP undoes its shuffle, keeps $Q'G\ket{D_j}$, and prepares new tests with
known outcomes:

$$
\ket{V_0}=GX^u\ket{0^w},
\qquad
\ket{V_+}=GZ^v\ket{+^w}.
$$

1. TTP $\rightarrow$ Alice:

   $$
   \begin{aligned}
   \ket{T_0}&=\pi_0(P'_0G\ket{E_0},\ket{V_0}),\\
   \ket{T_+}&=\pi_+(P'_+G\ket{E_+},\ket{V_+}).
   \end{aligned}
   $$

2. Alice $\rightarrow$ TTP:

   $$
   \begin{aligned}
   o_0&\leftarrow\mathsf{Meas}_Z((G^\dagger)^{\otimes2}\ket{T_0}),\\
   o_+&\leftarrow\mathsf{Meas}_X((G^\dagger)^{\otimes2}\ket{T_+}).
   \end{aligned}
   $$

The TTP accepts only the expected test results. If they match, it updates the
one-time-pad key to $Q_{\mathrm{new}}=Q'GQG^\dagger$.

### Speaker notes

- Here $u,v\in\{0,1\}^w$ and the two fresh pair permutations satisfy
  $\pi_0,\pi_+\in S_2$.
- Alice receives each returned test mixed with a fresh known output test.
- If $G^\dagger P'_0G=X^{a_0}Z^{b_0}$ and
  $G^\dagger P'_+G=X^{a_+}Z^{b_+}$, the exact checks are
  $\pi_0^{-1}(o_0)=(a_0\oplus e,u)$ and
  $\pi_+^{-1}(o_+)=(b_+\oplus f,v)$.
- The fresh outputs catch a lying checker; discrepancies in the returned tests
  count against Bob. QEC is intended to absorb the bounded number of corrupted
  positions before Bob is replaced.
- This remains a candidate construction while the full coherent-attack and
  culprit-attribution arguments are finalized.

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

- For Alice's asset, Alice is the sender and Bob is the verifier. In the actual-gate call Bob evaluates and Alice checks. In the identity call the roles reverse.
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

[Across the top, use three boxes: `Input encoding` with “both inputs go to the
TTP”,
$\pi_{\mathsf{circuit}}(\$_A)$, and
$\pi_{\mathsf{circuit}}(\$_B)$. Below them, the TTP waits for both verification
results before branching.]

1. **Input encoding:** Alice and Bob teleport their assets into separate
   Pauli-padded QEC blocks held by the TTP.
2. **Verify Alice's asset:** Bob evaluates Alice's verification circuit; Alice
   cross-checks him.
3. **Verify Bob's asset:** Alice evaluates Bob's verification circuit; Bob
   cross-checks her.

Then the TTP makes one release decision:

```text
 both accept                               otherwise

 |$_B>  ---> Alice                        |$_A>  ---> Alice
 |$_A>  ---> Bob                          |$_B>  ---> Bob

     EXCHANGE                             RETURN TO OWNERS
```

**Release neither asset until both checks finish.**

### Speaker notes

- The two one-sided circuit evaluations leave the processed encrypted assets
  and their updated pad keys at the TTP until both verification results are
  known.
- On success the outputs cross. On failure each updated asset returns to its original owner.
- Keep the verifier labels semantically clear: Bob runs the public circuit that validates Alice's asset; Alice runs the one that validates Bob's asset. The active rewrite has some subscript naming still being cleaned up.
- The fairness lever is delayed release: neither party receives the other's unique asset until both checks have completed.
- The quantum resources can be prepared in advance. During the exchange, the
  TTP's quantum behavior is intended to reduce to storage, communication, and hidden
  shuffles implemented with routing/SWAP; checks and key updates are
  classical.
- This removes the copyable-classical-state step from the impossibility
  argument: the trusted party now holds irreplaceable quantum states.
- Say “construction idea” or “candidate construction” while the security proof and a few circuit details remain in progress.

---

# Result: Feasibility with a Quantum TTP

**All quantum resources are input-independent.**

**Before either input is known, the TTP prepares:**

- encoded, one-time-padded halves of entangled pairs;
- encoded, one-time-padded $\ket 0$ and $\ket T$ blocks;
- gate-dependent hidden $0$- and $+$-test states;
- hidden test states for measurements.

Here $\ket T:=T\ket+$ is a one-use resource for implementing a $T$ gate.

During the exchange, the TTP only stores and moves quantum states. Resource
selection, test checks, and key updates are classical.

### Speaker notes

- This restates the feasibility result as a resource theorem after the
  audience has seen the full protocol.
- All listed quantum resources are input-independent and can be prepared
  before Alice or Bob supplies an asset.
- The input resources are encoded, padded retained halves of entangled pairs.
  Teleportation moves the inputs into them.
- The $\ket0$ and $\ket T$ blocks are work states. A standard injection
  consumes $\ket T$ using an entangling gate, a measurement, and
  outcome-dependent corrections.
- Gate calls use gate-dependent $0$- and $+$-test states; measurement calls use
  their own test states. The exact count depends on the circuit and on whether
  it is chosen adaptively.
- The TTP also keeps classical one-time-pad keys, secret shuffles, and expected
  test outcomes.
- Say “candidate theorem”: the current manuscript has the construction and a
  proof sketch, while the complete security proof and some circuit details
  remain in progress.
