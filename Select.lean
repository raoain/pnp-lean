import Basic

namespace Pnp

open Branch

def at? : List Branch → Nat → Option Branch
  | [], _ => none
  | a :: _, 0 => some a
  | _ :: as, n + 1 => at? as n

theorem eq_of_same_at? :
    ∀ {p q : List Branch}, p.length = q.length → (∀ i, at? p i = at? q i) → p = q
  | [], [], _, _ => rfl
  | [], _ :: _, hlen, _ => by simp at hlen
  | _ :: _, [], hlen, _ => by simp at hlen
  | a :: as, b :: bs, hlen, hget => by
      have hab : a = b := by
        have h0 := hget 0
        simpa [at?] using h0
      subst hab
      have htail : as = bs := by
        apply eq_of_same_at? (p := as) (q := bs)
        · simp at hlen; omega
        · intro i
          have hi := hget (i + 1)
          simpa [at?] using hi
      simp [htail]

theorem differs_somewhere {p q : List Branch} (hlen : p.length = q.length) (hne : p ≠ q) :
    ∃ i, at? p i ≠ at? q i := by
  by_cases hex : ∃ i, at? p i ≠ at? q i
  · exact hex
  · exfalso
    exact hne (eq_of_same_at? hlen (fun i => by
      by_cases hq : at? p i = at? q i
      · exact hq
      · exact absurd ⟨i, hq⟩ hex))

end Pnp