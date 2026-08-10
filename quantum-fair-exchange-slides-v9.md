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
  - \cite{alon-et-al-identifiable-abort, chung-et-al-pvia}

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

# Impossibility with a Classical Trusted Party

[Main-result slide. Keep the statement informal because the project and its exact error parameters are still being finalized.]

The two inputs are **uncloneable** if, given one valid instance of each, no
efficient algorithm can choose one input and produce two usable versions of
that same identified asset, except with negligible probability.

Suppose a $T$-round fair-exchange protocol:

- succeeds honestly with probability $p$,
- preserves an honest party's asset on rejection, and
- uses a trusted party whose state is entirely **classical**.

Then the protocol gives an efficient cloning algorithm $\mathcal C_\Pi$ with

$$
\Pr[\mathcal C_\Pi\text{ duplicates one input}]
    \geq \frac{p}{2T}
    \qquad\text{(idealized setting)}.
$$

For $p\approx 1$ and polynomial $T$, this probability is non-negligible.

> **Contradiction: the exchanged assets were assumed to be uncloneable.**

### Speaker notes

- The important correction is that $1/T$ is the scale of the **cloning attack's success**, not an upper bound of $1/T$ on honest protocol success.
- Equivalently, if the assets are $\varepsilon$-uncloneable, then $p\leq O(T\varepsilon)$, up to the protocol's correctness and fairness errors.
- The manuscript's perfect-setting sketch obtains a constant such as $p/(2T)$; the constant is not important for this talk.
- This formulation replaces the BB84 basis-guessing game with a black-box operational assumption: given one valid asset, producing two states that both count as that same asset has negligible probability.
- Textbook deterministic no-cloning alone is not a quantitative security game; the operational unclonability premise is what makes the direct reduction sound.
- The cloning game may give the reduction an independent second exchange input and lets it name which of the two inputs it duplicated; this changes at most a constant factor.
- Alice and Bob may exchange quantum messages. The restriction is that the trusted party has no quantum state that must remain uncopyable.
- This is the application-facing version of the result. The manuscript's BB84 embedding is what lifts the contradiction to its broader rank-at-least-two accepting-space statement; omit that lift from the talk.

---

# Intuition: Somewhere, the Exchange Must Happen

[Use a horizontal timeline from a cut before the protocol to a cut after the protocol, with a highlighted guessed boundary $\hat t$.]

```text
 cut 0                    guessed boundary t-hat                 cut T

 Alice: Rej + keeps $_A        ... ? ...                   Acc + gets $_B
 Bob:   Rej + keeps $_B        ... ? ...                   Acc + gets $_A
```

In the simple cartoon, there is a decisive round where ownership changes.

Pick $\hat t\leftarrow[T]$ uniformly:

> With probability $1/T$, we cut exactly at that round.

At the cut, let Alice's message through but drop Bob's:

- If Alice does not recover her asset, she is **left with nothing**.
- If Alice does recover it, Alice and Bob both hold Alice's asset: a **clone**.

### Speaker notes

- This is intuition, not yet the formal probability argument.
- Before the protocol, stopping means both parties reject and retain their own assets. After a successful protocol, both accept and hold the other party's asset.
- Pretend first that there is a single sharp round in which this changes. Guessing that round costs the factor $1/T$.
- Deliver Alice's message to Bob and suppress Bob's message to Alice.
- Bob has crossed the exchange boundary and may obtain Alice's asset; Alice has not.
- “Alice is left with nothing” is already a fairness violation. If the protocol repairs that violation by returning Alice's input, the same input now exists at both outputs.
- A real quantum protocol can change its acceptance probability gradually. The next slide replaces the sharp-round cartoon with adjacent hybrids.

---

# Formal Reduction: Two Adjacent Cuts

[Time runs down the slide. Alice is the left vertical lane and Bob the right.
At both rounds $t^*$ and $t^*+1$, draw the two messages as crossing diagonal
arrows. Show a small classical trusted-party state being forked into two copies.]

For each party $P$, let

$$
q_P(t)=\Pr[P\text{ accepts when the peer is honest through cut }t,
                    \text{ then stops}].
$$

The endpoints move from rejection to honest success:

$$
q_P(0)=0
\qquad\longrightarrow\qquad
q_P(T)\approx p.
$$

Therefore, for some $t$, either

$$
\left|q_A(t)-q_B(t)\right|
\quad\text{or}\quad
q_B(t+1)-q_A(t)
$$

is $\Omega(p/T)$.

At that boundary, fork the classical trusted-party state:

$$
c_{t^*}\longmapsto
\bigl(c_{t^*}^{A},c_{t^*}^{B}\bigr).
$$

**No quantum asset is copied at this step.**

### Speaker notes

- Run Alice and Bob honestly on the challenge assets up to the selected boundary.
- Unlike the cartoon, the formal proof fixes a boundary with a large hybrid gap; it does not randomly guess an already-averaged $t^*$ and lose another factor of $T$.
- The current manuscript permits this boundary to be hardwired non-uniformly; alternatively, one can estimate the cut probabilities when the model provides suitable sampling access.
- The reduction simulates the trusted party and copies only its classical internal state, creating two locally consistent continuations.
- If Alice's and Bob's accept probabilities already differ substantially at the same cut, the simultaneous-cut experiment is enough.
- Otherwise, telescoping from $0$ to $p$ gives an adjacent jump of size at least $p/T$, and closeness at the earlier cut leaves a staggered gap of order $p/T$.
- A marginal accept/reject gap lower-bounds the probability that the two output flags disagree. Do not show the intersection-bound calculation in the talk.
- This is what the manuscript's longer BB84 proof quantifies. We are taking unclonability as the final contradiction instead.
- The fork is precisely the step that is unavailable when the trusted party holds quantum state.

---

# Formal Reduction: Let One Message Through

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

$$
\Pr[\text{duplicate Alice's or Bob's asset}]
    = \Omega\!\left(\frac{p}{T}\right).
$$

### Speaker notes

- Alice and Bob are now continued against different copies of the classical trusted-party state.
- In the orientation drawn, Bob has crossed the pivotal boundary and Alice has not.
- If Bob accepts, he must have a usable version of Alice's asset.
- If Alice rejects, asset-preserving abort requires her to recover a usable version of her own asset.
- Both outputs must be versions of Alice's same identified asset, or pass the same instance-specific verifier; merely passing a broad type verifier is not enough.
- If the flags are reversed, the reduction duplicates Bob's input instead.
- If the rejecting party gets no asset, fairness has already failed, so either outcome contradicts a required property.
- The formal proof loses only the $1/T$-scale hybrid factor. Skip the detailed probability and intersection-bound analysis in a 45-minute talk.
- Transition: quantum custody prevents this classical fork, which points toward the positive construction.

---

# Preliminaries I: Quantum Error Correction

[One logical qubit enters an encoder and becomes a block of
$\ell_{\mathrm{code}}$ physical qubits. Below it, draw a supported logical gate
$g$ becoming coordinate operations $g^{(1)},\ldots,g^{(\ell_{\mathrm{code}})}$.]

Fix a quantum code

$$
\mathsf{QECC}=(\mathsf{QEnc},\mathsf{QDec}),
\qquad
[[\ell_{\mathrm{code}},1,d_{\mathrm{code}}]].
$$

- One logical qubit is spread over $\ell_{\mathrm{code}}$ physical qubits.
- The decoder corrects up to
  $r=\lfloor(d_{\mathrm{code}}-1)/2\rfloor$ physical errors **per code block**.
- A supported logical Clifford gate is applied coordinate by coordinate:

$$
\left(\bigotimes_{j=1}^{\ell_{\mathrm{code}}}g^{(j)}\right)
\mathsf{QEnc}^{\otimes a}\ket{\psi}
=
\mathsf{QEnc}^{\otimes a}g\ket{\psi}.
$$

> **Why here?** QEC gives us a damage budget: test each delegated step, stop a
> detected cheater, and repair any residual low-weight error.

### Speaker notes

- This is the first of two preliminary slides. Keep it operational; do not give a coding-theory lecture.
- The code used in the manuscript is written abstractly as an $[[\ell_{\mathrm{code}},1,d_{\mathrm{code}}]]$ code with supported transversal Clifford representatives.
- “Transversal” here means that the $j$th physical coordinates of the code blocks are acted on together. The coordinate gates $g^{(j)}$ need not all be identical.
- Later, one checked-gate call handles one coordinate $j$; the protocol repeats it for $j\in[\ell_{\mathrm{code}}]$.
- The construction must identify and replace a malicious evaluator before accumulated damage exceeds the decoder's correction radius.

---

# VQFHE: Compute, Then Verify — coverage TODO

[Draw a client on the left and a server on the right. The client runs key
generation and encryption, sends an encrypted input plus evaluation material
and a circuit to the server, receives an evaluated ciphertext and log, and
runs verified decryption.]

```text
 Client                                              Server

 (sk, evk) <- KeyGen

       ( Enc_sk(|psi>), evk, C )  ----------------->  Eval

       ( evaluated ciphertext, log ) <--------------

 VerDec_sk(C, ·)  --->  Rej   or   |y>
```

For a unitary cartoon, honest correctness says

$$
\ket{y}=C\ket{\psi}.
$$

Verifiability says:

> Even for a malicious server, the output is the declared
> $\Phi_C(\rho)$ (up to negligible error) or **Rej**. A malicious server may
> still force rejection.

A standard trap-code ciphertext has the form

$$
X^aZ^b\,\pi\!\left(
  \mathsf{QEnc}\ket{\psi}\otimes\ket{0}^{\otimes m}
  \otimes\ket{+}^{\otimes m}
\right).
$$

The secret permutation hides which registers are data, $0$-traps, and
$+$-traps.

**In our protocol, the TTP stores only
$Q\mathsf{QEnc}(\rho)Q^\dagger$; fresh traps are supplied per gate.**

> **Why should we care?** Bob wants to run Alice's money-verification circuit
> without being able to silently alter Alice's protected state.

### Speaker notes

- Cite Alagic–Dulek–Schaffner–Speelman for VQFHE. This slide uses their natural symmetric-key interface with a secret key and quantum evaluation key; public-key variants can add `pk`.
- A fully formal return message contains an evaluated ciphertext and an evaluation log, not a plaintext $\ket{\widetilde y}$.
- Label $\ket y=C\ket\psi$ as **correctness**, not security. For a general channel and reference system, the statement is $\rho_{\mathrm{out}}\approx\Phi_C(\rho)$ on honest evaluation.
- Generic VQFHE verifies at the end. Rejection by itself does not restore a consumed, unique quantum input.
- Our asset-preserving adaptation adds three ingredients: the TTP keeps custody of the encrypted QEC block, traps are checked immediately after each delegated coordinate operation, and QEC repairs undetected low-weight damage.
- The displayed trap-code ciphertext is the conceptual ancestor, not the state stored at rest in our current manuscript. The TTP actually stores only a Pauli-padded QEC block and introduces fresh gate-dependent traps in each checked-gate call.

---

# Construction I: Input Encoding

[Use two vertical lanes, Alice and the TTP. Repeat the following for every
logical input qubit $i$.]

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
labelled $j=1,\ldots,\ell_{\mathrm{code}}$.]

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

[Reuse the Alice–TTP–Bob lanes. For each Clifford instruction $g_t$, draw eight
arrows. Put a dashed box around the first four and another around the second
four. Put an outer brace labelled $t=1,\ldots,T$.]

For every Clifford instruction $g_t$:

$$
\boxed{
\pi_{\mathsf{gate}}(g_t):
\quad \text{Bob evaluates; Alice checks}
}
$$

followed by

$$
\boxed{
\pi_{\mathsf{gate}}(I):
\quad \text{Alice rerandomizes; Bob checks}
}.
$$

Each box is the four-message primitive from the previous slide and internally
repeats over $j\in[\ell_{\mathrm{code}}]$.

The identity pass gives both parties an evaluator role and refreshes the hidden
state before the next instruction.

> For each **Clifford instruction**: delegate, check, replace if needed, then
> continue. Measurements use a separate trap-checked primitive.

### Speaker notes

- For Alice's asset, Alice is the sender and Bob is the verifier. In the actual-gate call Bob evaluates and Alice checks. In the identity call the roles reverse.
- Show all eight arrows even if their labels are abbreviated; the repeated geometry is the point.
- A circuit is not literally eight messages total: this pair of gate calls is repeated for every Clifford instruction, and every call repeats over all physical code coordinates.
- Measurement instructions use a separate trap-checked two-message primitive. The active draft's treatment of all non-Clifford/measurement cases is not yet equally polished, so keep this slide explicitly about a Clifford instruction.
- This is a candidate construction and its load-bearing coherent-attack argument is still being finalized. Do not present the security statement as a finished theorem.

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

> Precompute the encoded EPR halves and gate-dependent traps. Online, the TTP
> stores and routes quantum registers, implements hidden permutations with
> SWAPs, and performs classical checks and key updates.

### Speaker notes

- The two one-sided circuit evaluations leave the processed encrypted assets and their updated Pauli keys at the TTP until both flags are known.
- On success the outputs cross. On failure each updated asset returns to its original owner.
- Keep the verifier labels semantically clear: Bob runs the public circuit that validates Alice's asset; Alice runs the one that validates Bob's asset. The active rewrite has some subscript naming still being cleaned up.
- The fairness lever is delayed release: neither party receives the other's unique asset until both checks have completed.
- The resource headline is the possibility result's point. Quantum states used online can be prepared in advance; the TTP's online quantum behavior is intended to reduce to storage, routing, and SWAP/permutation operations.
- Say “construction idea” or “candidate construction” while the security proof and a few circuit-gadget details remain in progress.
