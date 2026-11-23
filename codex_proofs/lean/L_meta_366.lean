import Mathlib
import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_366_aux

lemma five_incompatible {n : ℕ} (E : List (Fin n × Fin n))
    (O : Finset (Fin n) → Finset (Fin n × Fin n))
    (hO : ∀ J : Finset (Fin n), (∀ e ∈ E, ¬(e.1 ∈ J ∧ e.2 ∈ J)) →
      (∀ d ∈ O J, d ∈ E ∨ (d.2,d.1) ∈ E) ∧
      (∀ e ∈ E, (e ∈ O J ∨ (e.2,e.1) ∈ O J) ∧ ¬(e ∈ O J ∧ (e.2,e.1) ∈ O J)) ∧
      (∀ d ∈ O J, d.2 ∉ J))
    (J : Fin 5 → Finset (Fin n))
    (hi : ∀ i, ∀ e ∈ E, ¬(e.1 ∈ J i ∧ e.2 ∈ J i))
    (hs : ∀ i j, i ≠ j → ∃ e ∈ E,
      (e.1 ∈ J i ∧ e.2 ∈ J j) ∨ (e.1 ∈ J j ∧ e.2 ∈ J i)) :
    3 ≤ Module.finrank (ZMod 2) (vectorSpan (ZMod 2)
      {w : Fin n × Fin n → ZMod 2 | ∃ K : Finset (Fin n),
        (∀ e ∈ E, ¬(e.1 ∈ K ∧ e.2 ∈ K)) ∧ w = fun d => if d ∈ O K then 1 else 0}) := by
  classical
  let points : Set (Fin n × Fin n → ZMod 2) := {w | ∃ K : Finset (Fin n),
    (∀ e ∈ E, ¬(e.1 ∈ K ∧ e.2 ∈ K)) ∧ w = fun d => if d ∈ O K then 1 else 0}
  let w (i : Fin 5) : Fin n × Fin n → ZMod 2 := fun d => if d ∈ O (J i) then 1 else 0
  have hm (i : Fin 5) : w i ∈ points := ⟨J i, hi i, rfl⟩
  have bad (i j : Fin 5) (eqO : O (J i) = O (J j)) (e : Fin n × Fin n)
      (he : e ∈ E) (ha : e.1 ∈ J i) (hb : e.2 ∈ J j) : False := by
    rcases ((hO (J i) (hi i)).2.1 e he).1 with h | h
    · exact (hO (J j) (hi j)).2.2 e (eqO ▸ h) hb
    · exact (hO (J i) (hi i)).2.2 _ h ha
  have inj : Function.Injective w := by
    intro i j h
    by_contra hn
    have eqO : O (J i) = O (J j) := by
      ext d
      have hd := congrFun h d
      constructor
      · intro h1
        by_contra h2
        simp [w, h1, h2] at hd
      · intro h2
        by_contra h1
        simp [w, h1, h2] at hd
    obtain ⟨e,he,hs'⟩ := hs i j hn
    rcases hs' with ⟨ha,hb⟩ | ⟨ha,hb⟩
    · exact bad i j eqO e he ha hb
    · exact bad j i eqO.symm e he ha hb
  let V := vectorSpan (ZMod 2) points
  let g : Fin 5 → V := fun i => ⟨w i -ᵥ w 0, vsub_mem_vectorSpan _ (hm i) (hm 0)⟩
  have ig : Function.Injective g := by
    intro i j h
    exact inj (vsub_left_cancel (congrArg Subtype.val h))
  let _ : Fintype V := Fintype.ofFinite _
  have card := Fintype.card_le_of_injective g ig
  rw [Module.card_eq_pow_finrank (K := ZMod 2) (V := V), ZMod.card, Fintype.card_fin] at card
  change 3 ≤ Module.finrank (ZMod 2) V
  by_contra! bound
  have small : 2 ^ Module.finrank (ZMod 2) V ≤ 2 ^ 2 :=
    Nat.pow_le_pow_right (by decide) (by omega)
  omega

end PEqualNP.Outside.L_meta_366_aux


theorem PEqualNP.Outside.L_meta_366 : ∀ E : List (Fin 5 × Fin 5), E = [(0, 1), (1, 2), (2, 3), (3, 4), (0, 4)] → ∀ O : Finset (Fin 5) → Finset (Fin 5 × Fin 5), (∀ J : Finset (Fin 5), (∀ f ∈ E, ¬ (f.1 ∈ J ∧ f.2 ∈ J)) → (∀ d ∈ O J, d ∈ E ∨ (d.2, d.1) ∈ E) ∧ (∀ e ∈ E, (e ∈ O J ∨ (e.2, e.1) ∈ O J) ∧ ¬ (e ∈ O J ∧ (e.2, e.1) ∈ O J)) ∧ (∀ d ∈ O J, d.2 ∉ J)) → PEqualNP.MetaComplexity.SingleLevel.vc E ≤ Module.finrank (ZMod 2) (vectorSpan (ZMod 2) {w : Fin 5 × Fin 5 → ZMod 2 | ∃ J : Finset (Fin 5), (∀ f ∈ E, ¬ (f.1 ∈ J ∧ f.2 ∈ J)) ∧ w = fun d => if d ∈ O J then 1 else 0}) := by
  rintro E rfl O hO
  let J : Fin 5 → Finset (Fin 5) := ![{0,2}, {1,3}, {2,4}, {3,0}, {4,1}]
  have hi : ∀ i, ∀ e ∈ ([(0,1),(1,2),(2,3),(3,4),(0,4)] : List (Fin 5 × Fin 5)),
      ¬(e.1 ∈ J i ∧ e.2 ∈ J i) := by decide +kernel
  have hs : ∀ i j, i ≠ j → ∃ e ∈ ([(0,1),(1,2),(2,3),(3,4),(0,4)] : List (Fin 5 × Fin 5)),
      (e.1 ∈ J i ∧ e.2 ∈ J j) ∨ (e.1 ∈ J j ∧ e.2 ∈ J i) := by decide +kernel
  apply le_trans _ (PEqualNP.Outside.L_meta_366_aux.five_incompatible _ O hO J hi hs)
  apply Nat.sInf_le
  exact ⟨({0,2,4} : Finset (Fin 5)), by decide +kernel, by decide +kernel⟩
