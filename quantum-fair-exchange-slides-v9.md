# Quantum Fair Exchange — Presentation Draft

> Working Markdown for the 40-minute theory-group presentation.
> We will refine this slide-by-slide. Notes in brackets are production/speaker notes, not necessarily slide text.

# Title

**Quantum Fair Exchange**

Hao Chung \quad Yi Lee \quad Justin Raizes<br>
Sri AravindaKrishnan Thyagarajan

LayerZero Labs · University of Maryland<br>
NTT Research · University of Sydney

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
| **Issuance** | Mining / protocol | Bank / issuer |
| **Prevent double spending** | Global ledger / consensus | No-cloning + cryptography |
| **Transfer** | Record the transfer on a global blockchain | Send the quantum state |
| **Fair exchange** | Atomic swaps / smart contracts | **???** |

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

- **Verifiable quantum fully homomorphic encryption (VQFHE)**
  - A key technical building block
  - `[ADSS17]`

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

We propose an ideal functionality for **quantum fair exchange**, adapting classical fair exchange to the limitations imposed by quantum no-cloning.

We aim to show two complementary results:

1. **Impossibility with a classical trusted third party**
   - Quantum fair exchange is impossible in general, even with a classical trusted third party.

2. **Possibility with limited quantum capabilities**
   - Quantum fair exchange can be realized with a trusted third party that has **quantum pre-processing and storage**.
   - During the online phase, the trusted third party performs no quantum computation other than **SWAP gates**.

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

- If Alice rejects, fairness must restore $\ket{\$_A}^{(A)}$.
- Bob accepts $\ket{\$_A}^{(B)}$.

> **No recovery** $\Rightarrow$ unfair. **Recovery** $\Rightarrow$ two copies
> of $\ket{\$_A}$.

### Speaker notes

- This is an operational cartoon. The arrows need not literally be raw asset
  registers.
- Because the TTP holds only bits, the reduction can copy those bits before
  round $t^*$ and let the two stopping experiments finish separately.
- If Bob accepts, he has Alice's identified asset. If Alice rejects,
  asset-preserving fairness returns that same identified asset to her.
- Both outputs must be versions of Alice's same identified asset, or pass the same instance-specific verifier; merely passing a broad type verifier is not enough.
- Formally, same-cut and adjacent-cut cases show that one of the $T$ locations
  produces this mismatch with probability $\Omega(1/T)$.
- No quantum register is copied as an intermediate step; the contradiction is
  at the two final outputs.

---

# QEC: Spread One Qubit Across a Block

[Draw $\ket\psi\to\mathsf{QEnc}$, a row of $n$ physical qubits with a few
damaged positions, then
$\mathsf{QDec}\to\ket\psi$.]

**One entangled block---not $n$ copies of $\ket\psi$.**

$$
\mathsf{QDec}\!\left(
  \textcolor{red}{\mathcal A}\bigl(\mathsf{QEnc}(\rho)\bigr)
\right)=\rho
\quad\text{if $\mathcal A$ damages at most $\lambda$ positions.}
$$

**Bounded damage is repairable.**

### Speaker notes

- Keep this at the one-idea level: an encoder spreads one logical qubit across
  an entangled block of physical qubits.
- This is not cloning. No physical position contains its own copy of the
  unknown input.
- Suppress code distance on the audience slide and call the required
  correction budget $\lambda$. The active draft asks for a code correcting a
  constant multiple of the security parameter.
- $\mathcal A$ is the attack/noise channel; the equation applies when its
  effect is supported on at most $\lambda$ physical positions.
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

**Apply the same small operation at each coordinate; local damage stays
local.**

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

[Use plain client/server lanes, with no circuit input and no boxes around
either party's local operations. Keep the two message arrows short enough not
to collide with those operations.]

```text
 Client                                                Server

 k <- KeyGen
 sigma <- Auth_k(rho)

       authenticated state sigma  -------------------->
                                             untrusted A
       returned state sigma-tilde <--------------------

 VerDec_k(sigma-tilde) --> Rej or rho_out
```

$$
\text{accept}\quad\Longrightarrow\quad
\rho_{\mathrm{out}}\approx\rho.
$$

The attacker may always force rejection.

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

# VQFHE: Compute, Then Verify

**VQFHE = verifiable quantum fully homomorphic encryption.**

[Use plain client/server lanes and no boxes around local operations.]

```text
 Client                                                Server

 (pk,sk,evk) <- KeyGen
 ct <- Enc_pk(|x>)

          (ct,evk,C) --------------------------------->
                        (ct-tilde,log) <- Eval_evk(C,ct)
          (ct-tilde,log) <-----------------------------

 VerDec_sk(C,ct-tilde,log) --> Rej or |y>
```

$$
\text{honest server: }\ket y=C\ket x,
\qquad
\text{malicious server: }\mathsf{Rej}\text{ or }\ket y\approx C\ket x.
$$

### Speaker notes

- This is the security interface, separated from the concrete $X$-gate
  mechanism on the next slide.
- The visible pure-state equation is the unitary cartoon. For a general
  circuit, write $\rho_{\mathrm{out}}\approx\Phi_C(\rho)$ and preserve
  entanglement with an external reference.
- A malicious server may always force rejection. Acceptance certifies the
  requested computation, up to negligible error.
- Privacy is a separate part of the definition: the evaluator should not
  learn the plaintext.

---

# VQFHE by Example: $\mathsf{Eval}_X$

The ciphertext contains the encrypted state and pad keys; the evaluation key
contains the encrypted secret permutation:

$$
\mathsf{ct}
=\bigl(\widetilde\sigma,\widehat x,\widehat z\bigr),
\qquad
\widehat\pi\in\mathsf{evk}.
$$

$$
\begin{aligned}
\widehat{s_\pi}
  &\leftarrow
    \mathsf{HE.Eval}_{\mathsf{permute}}
    \bigl(\widehat\pi,\mathsf{HE.Enc}(1^n0^{2n})\bigr),\\
\widehat x'
  &\leftarrow
    \mathsf{HE.Eval}_{\oplus}
    \bigl(\widehat x,\widehat{s_\pi}\bigr),\\
\mathsf{Eval}_X(\mathsf{ct};\mathsf{evk})
  &=\bigl(\widetilde\sigma,\widehat x',\widehat z,
    \mathsf{log}\bigr).
\end{aligned}
$$

**The quantum register is unchanged; the encrypted pad key is updated.**

Supporting every gate requires nontrivial gadgets `[ADSS17]`.

### Speaker notes

- Hats denote classical homomorphic encryptions. The evaluation key supplies
  $\widehat\pi$; the evaluator learns neither the Pauli pad nor the secret
  trap permutation.
- The string $1^n0^{2n}$ marks the data block before permutation.
  Homomorphically applying the encrypted permutation produces an encryption
  of $s_\pi=\pi(1^n0^{2n})$.
- Updating $x$ to $x\oplus s_\pi$ makes the unchanged quantum register
  decrypt to $X\ket\psi$ while leaving both trap blocks unchanged.
- The log records the homomorphic permutation and XOR computations; it is not
  merely the gate label $X$.
- This is why $X$ is an intentionally easy example. The universal
  Alagic--Dulek--Schaffner--Speelman construction needs nontrivial gadgets and
  evaluation logs for the remaining gates.

---

# Construction I: Teleport into Custody

[Use two plain, unboxed vertical lanes, Alice and the TTP. Put a right-hand
brace `}` around the full exchange, labelled “repeat for every logical input
qubit $i$”. Keep this slide to the construction only.]

1. The TTP prepares an EPR pair $(L_i,D_i)$, QEC-encodes and Pauli-pads $D_i$,
   and keeps that encoded half.
2. The TTP sends $L_i$ to Alice.
3. Alice Bell-measures her input qubit together with $L_i$ and sends the
   classical teleportation label $P_i$ to the TTP.
4. The TTP updates only its secret Pauli key:

$$
Q_i^0=Q_i^{\mathrm{init}}\overline{P_i}.
$$

### Speaker notes

- This subprotocol is called “input commitment” in the manuscript, but “input encoding” or “teleport into custody” is clearer for the talk.
- Keep the interpretation off this frame; the next slide explains what has
  changed.
- Encoded EPR pairs can be prepared in the preprocessing phase. Online, the TTP routes its logical EPR half and later updates a classical Pauli key.
- Teleportation preserves entanglement with an external reference system.

---

# Construction I: State Now in Custody

The quantum TTP stores

$$
\bigl(\widetilde\rho,Q^0\bigr),
\qquad
\widetilde\rho
=Q^0\,\mathsf{QEnc}(\rho)\,(Q^0)^\dagger.
$$

- The TTP holds the **encoded state and its one-time-pad key**.
- Alice retains **no backup copy** of the teleported input.
- This is QEC plus a quantum one-time pad. **Fresh hidden tests** are inserted
  only when a gate is evaluated.

### Speaker notes

- No register carrying $\rho$ traveled Alice-to-TTP. Teleportation placed the
  state in the already encoded and padded retained EPR half.
- The stored state is a fixed Pauli-padded QEC codeword that Alice can no
  longer modify or duplicate.
- It is not a persistent standard trap-code ciphertext and is not yet
  authenticated by traps.

---

# Construction II: Evaluator Pass

[Use unboxed Quantum-TTP and Bob lanes, with a right-hand brace `}` labelled
$j=1,\ldots,n$.]

For physical coordinate $j$, let $G:=g^{(j)}$ and let $\ket{D_j}$ be the padded
data column. The TTP prepares

$$
\ket{E_0}=X^e\ket{0^w},
\qquad
\ket{E_+}=Z^f\ket{+^w},
$$

and samples $\pi_E\in S_3$ and fresh Paulis $Q',P'_0,P'_+$.

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
- Here $w$ is the width of one column, $e,f\in\{0,1\}^w$, and each fresh
  Pauli lies in $\mathcal P^{\otimes w}$.
- Bob receives the Pauli instructions in the same secret order as the three
  quantum registers, so he can perform the requested operation without
  learning which register is data.
- Repeat the call over $j\in[n]$, not $j\in[3\lambda]$. There are three
  registers per call, hence $3n$ evaluator registers over one encoded gate.

---

# Construction II: Checker Pass

[Use unboxed Alice and Quantum-TTP lanes. Separate the two arrows enough for
both two-line labels to fit cleanly between them. Put a right-hand brace `}`
at the right, labelled $j=1,\ldots,n$.]

The TTP unshuffles Bob's return and keeps $Q'G\ket{D_j}$. It prepares fresh
known gate-output tests

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

The TTP accepts only the expected outcomes. On acceptance it records
$Q_{\mathrm{new}}=Q'GQG^\dagger$.

### Speaker notes

- Here $u,v\in\{0,1\}^w$ and the two fresh pair permutations satisfy
  $\pi_0,\pi_+\in S_2$.
- Alice receives each returned test mixed with a fresh known output test.
- If $G^\dagger P'_0G=X^{a_0}Z^{b_0}$ and
  $G^\dagger P'_+G=X^{a_+}Z^{b_+}$, the exact checks are
  $\pi_0^{-1}(o_0)=(a_0\oplus e,u)$ and
  $\pi_+^{-1}(o_+)=(b_+\oplus f,v)$.
- Fresh outputs catch a lying checker; returned tests catch a bad evaluator.
- This remains a candidate construction while the full coherent-attack and
  culprit-attribution arguments are finalized.

---

# Construction III: Circuit Evaluation

[Reuse the Alice–TTP–Bob lanes. Draw eight **unlabelled** arrows: a dashed box
around the first four labelled $\pi_{\mathsf{gate}}(g_t)$, and another dashed
box around the other four labelled $\pi_{\mathsf{gate}}(I)$. Do not add
micro-labels such as “hidden triple”, “apply”, “trap pairs”, or “outcomes”. Put
a right-hand brace `}` on the right labelled $t=1,\ldots,T$. Leave generous
padding below the lowest arrow in each dashed region.]

The first four-arrow region is labelled only
$\pi_{\mathsf{gate}}(g_t)$; the second is labelled only
$\pi_{\mathsf{gate}}(I)$. Each region is the primitive from the previous slide
and internally repeats over $j\in[n]$.

**Each circuit step calls $\pi_{\mathsf{gate}}$ twice, with the roles
reversed.**

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
3. **Checks:** fresh $0/+$ traps for gates and fresh $0$-traps for
   measurements, for every instruction slot, physical coordinate, and
   candidate operation, including the identity pass.

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

[Across the top, use three boxes: `Input encoding`,
$\pi_{\mathsf{circuit}}(\$_A)$, and
$\pi_{\mathsf{circuit}}(\$_B)$. Below them, the TTP waits for both verification
flags before branching.]

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

**Release neither asset until both checks finish.**

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
