import Mathlib
import PEqualNP.Defs

theorem PEqualNP.Outside.L_meta_369 : ∀ E : List (Fin 7 × Fin 7), E = [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (0, 6)] → ∀ O : Finset (Fin 7) → Finset (Fin 7 × Fin 7), (∀ J : Finset (Fin 7), (∀ f ∈ E, ¬ (f.1 ∈ J ∧ f.2 ∈ J)) → (∀ d ∈ O J, d ∈ E ∨ (d.2, d.1) ∈ E) ∧ (∀ e ∈ E, (e ∈ O J ∨ (e.2, e.1) ∈ O J) ∧ ¬ (e ∈ O J ∧ (e.2, e.1) ∈ O J)) ∧ (∀ d ∈ O J, d.2 ∉ J)) → PEqualNP.MetaComplexity.SingleLevel.vc E ≤ Module.finrank (ZMod 2) (vectorSpan (ZMod 2) {w : Fin 7 × Fin 7 → ZMod 2 | ∃ J : Finset (Fin 7), (∀ f ∈ E, ¬ (f.1 ∈ J ∧ f.2 ∈ J)) ∧ w = fun d => if d ∈ O J then 1 else 0}) := by
  rintro E rfl O hO
  let Es : List (Fin 7 × Fin 7) := [(0,1),(1,2),(2,3),(3,4),(4,5),(5,6),(0,6)]
  let J : Fin 7 → Finset (Fin 7) :=
    ![{2,4,6},{3,5,0},{4,6,1},{5,0,2},{6,1,3},{0,2,4},{1,3,5}]
  let arc : Fin 7 → Fin 7 × Fin 7 := ![(0,1),(1,2),(2,3),(3,4),(4,5),(5,6),(6,0)]
  let sel : Fin 9 → Finset (Fin 7) := ![{0},{1},{2},{3},{4},{5},{6},{0,2,4},{0,2,5}]
  have hi : ∀ i, ∀ e ∈ Es, ¬(e.1 ∈ J i ∧ e.2 ∈ J i) := by decide +kernel
  have he : ∀ c, arc c ∈ Es ∨ ((arc c).2,(arc c).1) ∈ Es := by decide +kernel
  have hj : ∀ i c, i ≠ c → (arc c).1 ∈ J i ∨ (arc c).2 ∈ J i := by decide +kernel
  let points : Set (Fin 7 × Fin 7 → ZMod 2) := {w | ∃ K : Finset (Fin 7),
    (∀ e ∈ Es, ¬(e.1 ∈ K ∧ e.2 ∈ K)) ∧ w = fun d => if d ∈ O K then 1 else 0}
  let w (i : Fin 7) : Fin 7 × Fin 7 → ZMod 2 := fun d => if d ∈ O (J i) then 1 else 0
  have hm (i : Fin 7) : w i ∈ points := ⟨J i, hi i, rfl⟩
  have wk (i c : Fin 7) (hne : i ≠ c) :
      w i (arc c) = if (arc c).1 ∈ J i then 1 else 0 := by
    have H := hO (J i) (hi i)
    have choice : arc c ∈ O (J i) ∨ ((arc c).2,(arc c).1) ∈ O (J i) := by
      rcases he c with h | h
      · exact (H.2.1 _ h).1
      · exact ((H.2.1 _ h).1).symm
    by_cases h1 : (arc c).1 ∈ J i
    · have h2 : arc c ∈ O (J i) := choice.resolve_right (fun hr => H.2.2 _ hr h1)
      simp [w,h1,h2]
    · have h2 := (hj i c hne).resolve_left h1
      have h3 : arc c ∉ O (J i) := fun hf => H.2.2 _ hf h2
      simp [w,h1,h3]
  let val (i : Fin 9) (c : Fin 7) : ZMod 2 :=
    ∑ j ∈ sel i, if (arc c).1 ∈ J j then 1 else 0
  have sep : ∀ i j : Fin 9, i ≠ j → ∃ c : Fin 7,
      c ∉ sel i ∧ c ∉ sel j ∧ val i c ≠ val j c := by decide +kernel
  let y (i : Fin 9) : Fin 7 × Fin 7 → ZMod 2 := ∑ j ∈ sel i, w j
  have yval (i : Fin 9) (c : Fin 7) (hf : c ∉ sel i) : y i (arc c) = val i c := by
    simp only [y,Finset.sum_apply,val]
    apply Finset.sum_congr rfl
    intro j hj'
    exact wk j c (fun h => hf (h ▸ hj'))
  have inj : Function.Injective y := by
    intro i j h
    by_contra hn
    obtain ⟨c,ha,hb,hd⟩ := sep i j hn
    exact hd (by rw [← yval i c ha, ← yval j c hb,h])
  let V := vectorSpan (ZMod 2) points
  let delta (i : Fin 9) : Fin 7 × Fin 7 → ZMod 2 := ∑ j ∈ sel i, (w j - w 0)
  have hd (i : Fin 9) : delta i ∈ V :=
    Submodule.sum_mem _ (fun j _ => vsub_mem_vectorSpan _ (hm j) (hm 0))
  have sizes : ∀ i, (sel i).card = 1 ∨ (sel i).card = 3 := by decide +kernel
  have three : ∀ b : ZMod 2, (3 : ℕ) • b = b := by decide +kernel
  have sumid (i : Fin 9) : delta i = y i - w 0 := by
    simp only [delta,y,Finset.sum_sub_distrib,Finset.sum_const]
    congr 1
    ext d
    change (sel i).card • w 0 d = w 0 d
    rcases sizes i with h | h
    · rw [h,one_smul]
    · rw [h,three]
  let g : Fin 9 → V := fun i => ⟨delta i,hd i⟩
  have ig : Function.Injective g := by
    intro i j h
    have eq' : delta i = delta j := congrArg Subtype.val h
    rw [sumid,sumid] at eq'
    exact inj (sub_left_inj.mp eq')
  let _ : Fintype V := Fintype.ofFinite _
  have card := Fintype.card_le_of_injective g ig
  rw [Module.card_eq_pow_finrank (K := ZMod 2) (V := V), ZMod.card, Fintype.card_fin] at card
  have dim : 4 ≤ Module.finrank (ZMod 2) V := by
    by_contra! bound
    have small : 2 ^ Module.finrank (ZMod 2) V ≤ 2 ^ 3 :=
      Nat.pow_le_pow_right (by decide) (by omega)
    omega
  apply le_trans _ dim
  apply Nat.sInf_le
  exact ⟨({0,2,4,6} : Finset (Fin 7)), by decide +kernel, by decide +kernel⟩
