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
  - A long line of work on contract signing, trusted third parties, etc.

- **Multiparty quantum computation with identifiable abort**
  - Identify the cheating party and abort
  - `[ACCHLS21, CHTZ24]`

- **Verifiable quantum fully homomorphic encryption (VQFHE)**
  - A key technical building block
  - `[ADSS17]`

### Speaker notes

- Keep the classical literature deliberately brief: fair exchange has been studied since the early 1980s, and there is a long classical literature.
- Light transition if useful: “Aravind probably knows much more of this history than I do, so I'll skip ahead about forty years.”
- The closest quantum line of work for this talk is MPQC with identifiable abort.
- Identifiable abort gives accountability: if someone cheats, we can identify the cheating party and abort.
- For fair exchange, accountability alone does not answer what happens to the honest party's quantum asset.
- Mention VQFHE only as a technical building block here; defer the technical review until after the main goals / theorems.
- Use mnemonic alphabetic labels, with one author initial per surname, rather
  than numeric references. This makes `[ACCHLS21, CHTZ24]` and `[ADSS17]`
  readable as names while presenting.

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

# Impossibility with a Classical Trusted Party

[Main-result slide. Hard-code perfect honest correctness for the talk and keep
the unclonability premise to one line.]

Assume a $T$-round fair-exchange protocol $\Pi$ with a **classical TTP**:

$$
\bigl(\ket{\$_A},\ket{\$_B}\bigr)
  \xrightarrow{\quad\Pi\quad}
\bigl(\ket{\$_B},\ket{\$_A}\bigr).
$$

On abort, an honest party keeps its own asset.

> **$\Pi$ becomes a cloning procedure:** it duplicates one of the two inputs
> with probability $\Omega(1/T)$.

**One identified asset $\not\longmapsto$ two usable copies.**

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

# Somewhere, the Exchange Must Happen

[Use a horizontal timeline from the beginning to the end, with one useful
boundary $t^*$ highlighted.]

```text
 cut 0                      useful boundary t*                   cut T

 Alice keeps $_A                 ...                  Alice gets $_B
 Bob keeps $_B                   ...                  Bob gets $_A
```

Some neighboring pair of cuts must witness the handoff.

> With $T$ possible boundaries, the reduction loses one factor of $T$.

### Speaker notes

- Keep this operational. Do not define cut-acceptance probabilities or show a
  telescoping calculation.
- Initially, stopping leaves each party with its own asset. At honest
  completion, the assets have swapped.
- Formally, if the parties already disagree at one cut, use that cut.
  Otherwise, some party's outcome changes across neighboring cuts.
- One of the $T$ locations is therefore useful. The reduction may hard-wire
  it; the random-guess cartoon is only intuition for the $1/T$ scale.
- The next two slides show what the reduction does at that location.

---

# Reduction: Fork the Classical World

[Time runs downward. Alice and Bob are vertical lanes. Draw both crossing
arrows at rounds $t^*$ and $t^*+1$. Beside the picture, show only the two
operational steps below.]

1. Run the honest prefix. The referee holds classical state $c_{t^*}$.
2. Fork that state with two arrows and form two locally consistent
   continuations:

$$
c_{t^*}\longmapsto
\bigl(c_{t^*}^{A},c_{t^*}^{B}\bigr).
$$

> Only the **classical referee state** is copied---not either quantum asset.

### Speaker notes

- Run Alice and Bob honestly on the challenge assets up to the selected boundary.
- The reduction simulates the trusted party and copies only its classical internal state, creating two locally consistent continuations.
- The intact crossing arrows depict the neighboring-round alternatives used
  by the proof; they are not an invitation to present a hybrid calculation.
- The current manuscript may hard-wire the useful boundary non-uniformly; an
  alternative is to estimate it when the model gives suitable sampling access.
- The fork is precisely the step that is unavailable when the trusted party holds quantum state.

---

# Reduction: Let One Message Through

[Reuse the previous two-round diagram. At round $t^*$, leave the Alice-to-Bob
arrow intact and cross out the Bob-to-Alice arrow. Bob's continuation can now
finish. At round $t^*+1$, suppress the next Bob-to-Alice message so that Alice
stops one round later.]

The two continuations can produce:

```text
 Alice's view                           Bob's view

 Bob stopped                            Alice's message arrived
 Rej + |$_A>                            Acc + |$_A>
```

Thus the reduction has produced two usable versions of Alice's input:

$$
\underbrace{
  \ket{\$_A}^{(A)}
  \qquad
  \ket{\$_A}^{(B)}
}_{\text{two usable copies from one input}}.
$$

### Speaker notes

- Alice and Bob are now continued against different copies of the classical trusted-party state.
- In the orientation drawn, Bob has crossed the pivotal boundary and Alice has not.
- If Bob accepts, he must have a usable version of Alice's asset.
- If Alice rejects, asset-preserving abort requires her to recover a usable version of her own asset.
- Both outputs must be versions of Alice's same identified asset, or pass the same instance-specific verifier; merely passing a broad type verifier is not enough.
- If the flags are reversed, the reduction duplicates Bob's input instead.
- If the rejecting party gets no asset, fairness has already failed, so either outcome contradicts a required property.
- The full proof has simultaneous-cut and staggered-cut cases. The omitted
  stopping-probability analysis establishes that one of the $T$ locations
  works with the claimed $1/T$ scale.
- Do not show an intersection bound or any $q_P(t)$ notation.
- Transition: quantum custody prevents this classical fork, which points toward the positive construction.

---

# QEC: Spread One Qubit Across a Block

[Draw $\ket\psi\to\mathsf{QEnc}$, a row of $n=\ell_{\mathrm{code}}$
physical qubits with a few damaged positions, then
$\mathsf{QDec}\to\ket\psi$.]

**One entangled block---not $n$ copies of $\ket\psi$.**

For an $[[\ell_{\mathrm{code}},1,d_{\mathrm{code}}]]$ code,

$$
\mathsf{QDec}\!\left(E\,\mathsf{QEnc}(\rho)E^\dagger\right)=\rho
\quad\text{when}\quad
\mathsf{wt}(E)\leq
r=\left\lfloor\frac{d_{\mathrm{code}}-1}{2}\right\rfloor.
$$

> Quantum error correction makes **bounded damage repairable**.

### Speaker notes

- Keep this at the one-idea level: an encoder spreads one logical qubit across
  an entangled block of physical qubits.
- This is not cloning. No physical position contains its own copy of the
  unknown input.
- Authentication will detect adversarial tampering; QEC repairs bounded
  residual damage.
- The construction must identify and replace a malicious evaluator before
  accumulated damage exceeds the correction radius.

---

# Transversal Operations: Compute Coordinatewise

[Show one encoded block as a row of physical positions. Put one $X$ box on
each vertical wire, yielding the encoded output below.]

$$
X_L=X^{\otimes n},
\qquad
X^{\otimes n}\mathsf{QEnc}\ket\psi
=\mathsf{QEnc}X\ket\psi.
$$

> Apply the same small operation at each coordinate: **local damage stays
> local**.

### Speaker notes

- $X_L=X^{\otimes n}$ is an intuitive example for the concrete code family
  under consideration; it is not a claim about every quantum code.
- More generally, a directly supported logical operation $g$ is represented
  by coordinate operations $g^{(1)},\ldots,g^{(n)}$, which need not all be
  identical.
- Not every operation is directly available this way. The resource-bank slide
  later explains how the remaining operation is supplied with a magic state.
- Coordinatewise evaluation is why the construction can test one physical
  position at a time.

---

# Quantum Authentication: Detect Tampering

[Draw the authentication game from left to right.]

```text
 k <- KeyGen

 rho --> Auth_k --> sigma --> attacker --> sigma-tilde --> VerDec_k
                                                              |
                                                     rho_out  or  Rej
```

$$
\text{accept}\quad\Longrightarrow\quad
\rho_{\mathrm{out}}\approx\rho.
$$

> An attacker may force rejection, but cannot **change the state and still be
> accepted**.

### Speaker notes

- This is the integrity game. A full definition also preserves entanglement
  with an external reference system.
- The attacker can always destroy the authenticated state and force rejection.
  Authentication prevents an undetected change.
- Authentication may also hide the plaintext, but privacy is not the point of
  this slide.
- The trap code on the next slide is one concrete implementation blueprint.

---

# The Trap Code: Hide Data Among Tests

[Show three adjacent blocks---encoded data, $0$-traps, and $+$-traps---entering
a secret permutation and quantum one-time pad.]

$$
\widetilde\psi=X^aZ^b\,\pi\!\left(
  \mathsf{QEnc}\ket\psi\otimes\ket0^{\otimes n}
  \otimes\ket+^{\otimes n}
\right).
$$

- $0$-traps catch bit-flip errors.
- $+$-traps catch phase-flip errors.

> Undo the pad and permutation, test every trap, then decode the data.

**Our protocol:** store QEC $+$ a hidden pad; add fresh tests at every gate.

### Speaker notes

- The standard blueprint appends computational-basis and Hadamard-basis test
  registers, secretly permutes the three blocks, and applies a quantum
  one-time pad.
- More precisely, $0$-traps detect $X/Y$ components and $+$-traps detect $Z/Y$
  components.
- The final line is important: the current manuscript does not keep a
  persistent standard trap-code ciphertext at the TTP. It inserts fresh tests
  in every checked operation.

---

# VQFHE: Compute, Then Verify — coverage TODO

**Verifiable quantum fully homomorphic encryption**

[Draw the client/server game pictorially.]

```text
 Client                                              Server

 (sk, evk) <- KeyGen
 sigma <- Enc_sk(|x>)

       ( sigma, evk, C )  --------------------------> Eval(C)

       ( evaluated ciphertext, log ) <---------------

 VerDec_sk(C, ·)  ---------------->  Rej   or   |y>
```

**Correctness:** $\ket y=C\ket x$.

**Verifiability:** acceptance implies the correct output.

> Bob evaluates Alice's money verifier without receiving unprotected money.
> **Custody and incremental checks** make this asset-preserving.

### Speaker notes

- Cite Alagic–Dulek–Schaffner–Speelman `[ADSS17]`. Their natural interface is
  symmetric-key, with a secret key and quantum evaluation material; public-key
  variants can add a public key.
- A formal return contains an evaluated ciphertext and log, not a plaintext
  $\ket{\widetilde y}$.
- $\ket y=C\ket x$ is a pure/unitary correctness cartoon. Generally the honest
  output is $\rho_{\mathrm{out}}\approx\Phi_C(\rho)$, including a reference
  system.
- A malicious server may always force rejection. Generic VQFHE alone does not
  restore a consumed unique input.
- The extra asset-preserving ingredients are TTP custody, an immediate check
  after each delegated step, and QEC repair.

---

# Homomorphic Evaluation: Act Without Finding the Data

[Show a secretly shuffled triple containing hidden data, a $0$-test, and a
$+$-test. Apply $G^{\otimes3}$ to the whole triple; keep the transformed data
and undo/test the two traps.]

$$
\pi_E(\widetilde\rho_j,T_0,T_+)
\xrightarrow{\quad G^{\otimes3}\quad}
\pi_E(G\widetilde\rho_j,GT_0,GT_+).
$$

> The evaluator cannot locate the data, so it must treat the data and both
> tests **in exactly the same way**.

### Speaker notes

- This is the fresh-trap variant used by the manuscript, not a claim that the
  at-rest ciphertext is a standard trap-code ciphertext.
- Pads and rerandomization are suppressed in the visible formula. The actual
  evaluator also applies a fresh Pauli rerandomizer.
- $G$ is a directly supported physical coordinate operation. The TTP prepares
  the corresponding expected output tests in advance.
- After unshuffling, keep the transformed data. Pair the returned tests with
  fresh known tests so a dishonest checker can also be detected.
- The next slide sequence expands this operation into the interactive
  construction.

---

# Construction I: Input Encoding

[Use two vertical lanes, Alice and the TTP. Put a right-side, mirrored brace
around the full exchange so that it faces left, labelled “repeat for every
logical input qubit $i$”.]

1. The TTP prepares an EPR pair $(L_i,D_i)$, QEC-encodes and Pauli-pads $D_i$,
   and keeps that encoded half.
2. The TTP sends $L_i$ to Alice.
3. Alice Bell-measures her input qubit together with $L_i$ and sends the
   classical teleportation label $P_i$ to the TTP.
4. The TTP updates only its secret Pauli key:

$$
Q_i^0=Q_i^{\mathrm{init}}\overline{P_i}.
$$

The TTP now holds

$$
\widetilde\rho
=
Q^0\,\mathsf{QEnc}(\rho)\,(Q^0)^\dagger.
$$

> No quantum register carrying $\rho$ travels from Alice to the TTP: the state
> is teleported into the already encoded half.

### Speaker notes

- This subprotocol is called “input commitment” in the manuscript, but “input encoding” or “teleport into custody” is clearer for the talk.
- It is not a bit commitment. Operationally, the TTP ends with a fixed encrypted codeword that Alice can no longer modify.
- The stored state is a Pauli-padded QECC codeword, **not** a persistent trap-code ciphertext. Integrity will come from fresh trap-checked evaluation.
- Encoded EPR pairs can be prepared in the preprocessing phase. Online, the TTP routes its logical EPR half and later updates a classical Pauli key.
- Teleportation preserves entanglement with an external reference system.

---

# Construction II: Gate Evaluation

[Three vertical lanes: Alice is the checker, the TTP is in the middle, and Bob
is the evaluator. Time runs downward. Put one brace around all four messages,
labelled $j=1,\ldots,\ell_{\mathrm{code}}$. The right-side brace must be
mirrored so that it faces left toward the arrows.]

For one physical coordinate $j$:

1. TTP $\rightarrow$ Bob:

   $$
   \pi_{E,j}\!\left(
     \widetilde\rho_j\otimes\ket{x'_j}\otimes H\ket{z'_j}
   \right)
   \quad\text{and a fresh Pauli rerandomizer.}
   $$

2. Bob $\rightarrow$ TTP: apply the rerandomizer and
   $(g^{(j)})^{\otimes 3}$, then return the triple.
3. TTP $\rightarrow$ Alice: two independently shuffled pairs, each containing
   a returned trap and a fresh gate-output trap.
4. Alice $\rightarrow$ TTP: undo $g^{(j)}$, measure one pair in $Z$ and the
   other in $X$, and return the outcomes.

The TTP checks Alice against the fresh traps, checks Bob against the returned
traps, then keeps the transformed data and updates its Pauli key.

> Repeat over $j\in[\ell_{\mathrm{code}}]$: each coordinate call hides
> **one data register among two traps**.

### Speaker notes

- The user's mnemonic `OTP(|psi_j> |0> |+>)` is right at a high level. The exact call also has a secret permutation, independent trap pads, and a Pauli rerandomizer.
- The evaluator applies $(g^{(j)})^{\otimes 3}$ because it cannot tell data, $0$-trap, and $+$-trap apart.
- The checker receives fresh known gate-output traps mixed with the evaluator's returned traps. This lets the TTP distinguish a lying checker from a bad evaluator.
- The active manuscript repeats the call over $j\in[\ell_{\mathrm{code}}]$, not $j\in[3\lambda]$. There are three registers per call, hence $3\ell_{\mathrm{code}}$ evaluator registers over one encoded gate.
- After enough detected inconsistencies, replace the evaluator. QEC is intended to absorb the bounded number of corrupted coordinates accumulated before replacement.

---

# Construction III: Circuit Evaluation

[Reuse the Alice–TTP–Bob lanes. Draw eight **unlabelled** arrows: a dashed box
around the first four labelled $\pi_{\mathsf{gate}}(g_t)$, and another dashed
box around the other four labelled $\pi_{\mathsf{gate}}(I)$. Do not add
micro-labels such as “hidden triple”, “apply”, “trap pairs”, or “outcomes”. Put
a mirrored, left-facing brace on the right labelled $t=1,\ldots,T$.]

The first four-arrow region is labelled only
$\pi_{\mathsf{gate}}(g_t)$; the second is labelled only
$\pi_{\mathsf{gate}}(I)$. Each region is the primitive from the previous slide
and internally repeats over $j\in[\ell_{\mathrm{code}}]$.

> For each **circuit step**: one party evaluates and the other checks; then
> reverse roles and refresh.

### Speaker notes

- For Alice's asset, Alice is the sender and Bob is the verifier. In the actual-gate call Bob evaluates and Alice checks. In the identity call the roles reverse.
- Show all eight arrows with no arrow-level labels; the repeated geometry and
  the two $\pi_{\mathsf{gate}}$ labels are enough.
- A circuit is not literally eight messages total: this pair of calls repeats
  for every instruction, and every call repeats over all physical code
  coordinates.
- Technically, directly supported gates use this primitive. Measurements use a
  separate trap-checked primitive, and the remaining gate is compiled using a
  magic state. Keep those details oral or on the resource-bank slide.
- This is a candidate construction and its load-bearing coherent-attack argument is still being finalized. Do not present the security statement as a finished theorem.

---

# Preprocessing: The Quantum Resource Bank

[Collect the offline resources into three columns, then show the classical
ledger and the one-use magic-state explanation below.]

1. **Input custody:** encoded EPR halves.
2. **Workspace:** padded encoded $\ket0$ and $\ket T$ blocks, where
   $\ket T:=T\ket+$.
3. **Checks:** measurement traps and fresh output traps for every instruction
   slot, physical coordinate, and candidate operation, including the identity
   pass.

The **classical ledger** stores Pauli keys, secret permutations, and expected
trap outcomes.

> **One-use quantum fuel:** consuming one $\ket T=T\ket+$ state in a checked
> gadget implements a $T$ gate.

The actual adaptive circuit selects the needed candidates; unused resources
are discarded.

> After preprocessing, the TTP's quantum work is **storage, communication, and
> routing/SWAP**. Resource selection, trap checks, and Pauli-key updates are
> classical.

### Speaker notes

- Spend one sentence on the magic state: $\ket T=T\ket+$ is a special
  pre-prepared state that supplies the one operation not available through the
  simple coordinatewise interface; consuming it reduces that operation to
  simpler gates, a measurement, and a classical correction.
- The circuit need not be fixed at preprocessing time. Public level bounds let
  the TTP prepare a bank containing a candidate for every allowed operation at
  each slot and discard unselected candidates.
- The universal candidate bank is polynomially larger. If the circuit is
  already known, prepare only the candidates it needs.
- This optimization assumes trusted preparation and intact delivery of the
  bank. Outsourcing preparation needs an additional authentication or
  verifiable-delivery mechanism.

---

# Construction IV: Full Exchange

[Across the top, use three boxes: `input encoding`,
$\pi_{\mathsf{circuit}}(\$_A;\mathsf{Ver}_A)$, and
$\pi_{\mathsf{circuit}}(\$_B;\mathsf{Ver}_B)$. Below them, the TTP branches on
the two verification flags.]

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

       SWAP                               RETURN TO OWNERS
```

> **Delay release:** neither party receives the other's unique asset until
> both checks are complete.

### Speaker notes

- The two one-sided circuit evaluations leave the processed encrypted assets and their updated Pauli keys at the TTP until both flags are known.
- On success the outputs cross. On failure each updated asset returns to its original owner.
- Keep the verifier labels semantically clear: Bob runs the public circuit that validates Alice's asset; Alice runs the one that validates Bob's asset. The active rewrite has some subscript naming still being cleaned up.
- The fairness lever is delayed release: neither party receives the other's unique asset until both checks have completed.
- The preceding resource-bank slide now carries the preprocessing headline;
  keep this slide focused on the single release decision.
- The TTP's online quantum behavior is intended to reduce to storage, routing,
  and SWAP/permutation operations.
- Say “construction idea” or “candidate construction” while the security proof and a few circuit-gadget details remain in progress.
