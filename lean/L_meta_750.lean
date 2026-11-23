import Mathlib
import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_750_aux

theorem greedy (n T K : ℕ) (h : Fin T → (Fin n → Bool) → Bool)
    (hmono : ∀ j : Fin T, Monotone (h j)) :
    ∀ m : ℕ, ∀ (y : Fin n → Bool) (D : Finset (Fin T)),
      T - D.card < m →
      (∀ j1 ∈ D, h j1 y = true) →
      (Finset.univ.filter (fun i2 : Fin n => y i2 = true)).card ≤ K * D.card →
      ∃ (y : Fin n → Bool) (D : Finset (Fin T)), (∀ j1 ∈ D, h j1 y = true) ∧
        (∀ j2 : Fin T, j2 ∉ D → ∀ x : Fin n → Bool, (∀ i : Fin n, y i = true → x i = true) →
          (Finset.univ.filter (fun i1 : Fin n => x i1 = true ∧ y i1 = false)).card ≤ K →
          h j2 x = false) ∧
        (Finset.univ.filter (fun i2 : Fin n => y i2 = true)).card ≤ K * D.card := by
  intro m
  induction m with
  | zero =>
    intro y D hm
    exact absurd hm (Nat.not_lt_zero _)
  | succ m ih =>
    intro y D hm hD hy
    by_cases hstop : ∀ j2 : Fin T, j2 ∉ D → ∀ x : Fin n → Bool,
        (∀ i : Fin n, y i = true → x i = true) →
        (Finset.univ.filter (fun i1 : Fin n => x i1 = true ∧ y i1 = false)).card ≤ K →
        h j2 x = false
    · exact ⟨y, D, hD, hstop, hy⟩
    · obtain ⟨j0, hj0D, x, hyx, hxK, hj0x⟩ : ∃ j0 : Fin T, j0 ∉ D ∧ ∃ x : Fin n → Bool,
          (∀ i : Fin n, y i = true → x i = true) ∧
          (Finset.univ.filter (fun i1 : Fin n => x i1 = true ∧ y i1 = false)).card ≤ K ∧
          h j0 x = true := by
        by_contra hcon
        apply hstop
        intro j2 hj2 x hyx hxK
        cases hb : h j2 x
        · rfl
        · exact (hcon ⟨j2, hj2, x, hyx, hxK, hb⟩).elim
      have hle : y ≤ x := by
        intro i
        cases hyi : y i
        · first
            | exact Bool.false_le _
            | exact Bool.le_iff_imp.mpr (fun hf => absurd hf (by decide))
        · exact le_of_eq (hyx i hyi).symm
      have hDsub : D ⊆ Finset.univ.filter (fun j => h j x = true) := by
        intro j hj
        rw [Finset.mem_filter]
        refine ⟨Finset.mem_univ _, ?_⟩
        have h1 : h j y ≤ h j x := hmono j hle
        rw [hD j hj] at h1
        exact Bool.le_iff_imp.mp h1 rfl
      have hj0D' : j0 ∈ Finset.univ.filter (fun j => h j x = true) := by
        rw [Finset.mem_filter]
        exact ⟨Finset.mem_univ _, hj0x⟩
      have hss : D ⊂ Finset.univ.filter (fun j => h j x = true) :=
        (Finset.ssubset_iff_of_subset hDsub).mpr ⟨j0, hj0D', hj0D⟩
      have hcard : D.card < (Finset.univ.filter (fun j => h j x = true)).card :=
        Finset.card_lt_card hss
      have hcardT : (Finset.univ.filter (fun j => h j x = true)).card ≤ T := by
        have hu := Finset.card_le_univ (Finset.univ.filter (fun j => h j x = true))
        first
          | (rw [Fintype.card_fin] at hu; exact hu)
          | simpa using hu
      have hsub : Finset.univ.filter (fun i2 : Fin n => x i2 = true) ⊆
          Finset.univ.filter (fun i2 : Fin n => y i2 = true) ∪
          Finset.univ.filter (fun i1 : Fin n => x i1 = true ∧ y i1 = false) := by
        intro i hi
        rw [Finset.mem_filter] at hi
        rw [Finset.mem_union, Finset.mem_filter, Finset.mem_filter]
        cases hyi : y i
        · exact Or.inr ⟨Finset.mem_univ _, hi.2, rfl⟩
        · exact Or.inl ⟨Finset.mem_univ _, rfl⟩
      have hc1 : D.card + 1 ≤ (Finset.univ.filter (fun j => h j x = true)).card := by
        omega
      have hxcard : (Finset.univ.filter (fun i2 : Fin n => x i2 = true)).card ≤
          K * (Finset.univ.filter (fun j => h j x = true)).card := by
        calc (Finset.univ.filter (fun i2 : Fin n => x i2 = true)).card
            ≤ (Finset.univ.filter (fun i2 : Fin n => y i2 = true) ∪
                Finset.univ.filter (fun i1 : Fin n => x i1 = true ∧ y i1 = false)).card :=
              Finset.card_le_card hsub
          _ ≤ (Finset.univ.filter (fun i2 : Fin n => y i2 = true)).card +
                (Finset.univ.filter (fun i1 : Fin n => x i1 = true ∧ y i1 = false)).card :=
              Finset.card_union_le _ _
          _ ≤ K * D.card + K := Nat.add_le_add hy hxK
          _ = K * (D.card + 1) := by ring
          _ ≤ K * (Finset.univ.filter (fun j => h j x = true)).card :=
              Nat.mul_le_mul (le_refl K) hc1
      have hm' : T - (Finset.univ.filter (fun j => h j x = true)).card < m := by
        omega
      exact ih x (Finset.univ.filter (fun j => h j x = true)) hm'
        (fun j1 hj1 => (Finset.mem_filter.mp hj1).2) hxcard

end PEqualNP.Outside.L_meta_750_aux

theorem PEqualNP.Outside.L_meta_750 : ∀ (n T K : ℕ) (h : Fin T → (Fin n → Bool) → Bool), 1 ≤ K → (∀ j : Fin T, Monotone (h j)) → ∃ (y : Fin n → Bool) (D : Finset (Fin T)), (∀ j1 ∈ D, h j1 y = true) ∧ (∀ j2 : Fin T, j2 ∉ D → ∀ x : Fin n → Bool, (∀ i : Fin n, y i = true → x i = true) → (Finset.univ.filter (fun i1 : Fin n => x i1 = true ∧ y i1 = false)).card ≤ K → h j2 x = false) ∧ (Finset.univ.filter (fun i2 : Fin n => y i2 = true)).card ≤ K * D.card := by
  intro n T K h _ hmono
  exact PEqualNP.Outside.L_meta_750_aux.greedy n T K h hmono (T + 1) (fun _ => false) ∅
    (by omega) (by simp) (by simp)
