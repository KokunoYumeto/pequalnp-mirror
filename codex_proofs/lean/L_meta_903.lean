import PEqualNP.MetaComplexity.L104
import PEqualNP.MetaComplexity.L105

namespace PEqualNP.Outside.L_meta_903_aux

namespace Tree1

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 0 && j == 4) ||
    (i == 0 && j == 5) ||
    (i == 0 && j == 6) ||
    (i == 0 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  (show graph.Adj 0 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  (show graph.Adj 0 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  (show graph.Adj 0 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  (show graph.Adj 0 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 1 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 1 ∈ T) → 1 ≤ T.card := by decide
  exact bound T (h 0 1 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 0 && x 5) || (x 0 && x 6) || (x 0 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 0 && x 5) || (x 0 && x 6) || (x 0 && x 7)) s ↔ 7 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 1 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 1 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree1

namespace Tree2

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 0 && j == 4) ||
    (i == 0 && j == 5) ||
    (i == 0 && j == 6) ||
    (i == 1 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  (show graph.Adj 0 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  (show graph.Adj 0 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  (show graph.Adj 0 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach1.trans (show graph.Adj 1 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 2 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 2 ∈ T) → (1 ∈ T ∨ 7 ∈ T) → 2 ≤ T.card := by decide
  exact bound T (h 0 2 (by decide)) (h 1 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 0 && x 5) || (x 0 && x 6) || (x 1 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 0 && x 5) || (x 0 && x 6) || (x 1 && x 7)) s ↔ 8 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 2 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 2 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree2

namespace Tree3

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 1 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 1 && j == 6) ||
    (i == 2 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  reach1.trans (show graph.Adj 1 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach1.trans (show graph.Adj 1 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach2.trans (show graph.Adj 2 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {1, 2}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 2 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 1 ∈ T) → (2 ∈ T ∨ 7 ∈ T) → 2 ≤ T.card := by decide
  exact bound T (h 0 1 (by decide)) (h 2 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 1 && x 6) || (x 2 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 1 && x 6) || (x 2 && x 7)) s ↔ 8 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 2 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 2 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree3

namespace Tree4

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 0 && j == 4) ||
    (i == 0 && j == 5) ||
    (i == 1 && j == 6) ||
    (i == 1 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  (show graph.Adj 0 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  (show graph.Adj 0 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach1.trans (show graph.Adj 1 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach1.trans (show graph.Adj 1 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 2 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 2 ∈ T) → (1 ∈ T ∨ 6 ∈ T) → 2 ≤ T.card := by decide
  exact bound T (h 0 2 (by decide)) (h 1 6 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 0 && x 5) || (x 1 && x 6) || (x 1 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 0 && x 5) || (x 1 && x 6) || (x 1 && x 7)) s ↔ 8 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 2 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 2 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree4

namespace Tree5

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 0 && j == 4) ||
    (i == 0 && j == 5) ||
    (i == 1 && j == 6) ||
    (i == 2 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  (show graph.Adj 0 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  (show graph.Adj 0 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach1.trans (show graph.Adj 1 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach2.trans (show graph.Adj 2 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 2}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 3 ∈ T) → (1 ∈ T ∨ 6 ∈ T) → (2 ∈ T ∨ 7 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 3 (by decide)) (h 1 6 (by decide)) (h 2 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 0 && x 5) || (x 1 && x 6) || (x 2 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 0 && x 5) || (x 1 && x 6) || (x 2 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree5

namespace Tree6

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 1 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 2 && j == 6) ||
    (i == 2 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  reach1.trans (show graph.Adj 1 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach2.trans (show graph.Adj 2 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach2.trans (show graph.Adj 2 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {1, 2}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 2 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 1 ∈ T) → (2 ∈ T ∨ 6 ∈ T) → 2 ≤ T.card := by decide
  exact bound T (h 0 1 (by decide)) (h 2 6 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 2 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 2 && x 7)) s ↔ 8 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 2 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 2 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree6

namespace Tree7

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 0 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 1 && j == 6) ||
    (i == 1 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  (show graph.Adj 0 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach1.trans (show graph.Adj 1 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach1.trans (show graph.Adj 1 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 2 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 2 ∈ T) → (1 ∈ T ∨ 5 ∈ T) → 2 ≤ T.card := by decide
  exact bound T (h 0 2 (by decide)) (h 1 5 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 1 && x 5) || (x 1 && x 6) || (x 1 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 1 && x 5) || (x 1 && x 6) || (x 1 && x 7)) s ↔ 8 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 2 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 2 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree7

namespace Tree8

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 1 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 2 && j == 6) ||
    (i == 6 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  reach1.trans (show graph.Adj 1 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach2.trans (show graph.Adj 2 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach6.trans (show graph.Adj 6 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 6}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 2 ∈ T) → (1 ∈ T ∨ 3 ∈ T) → (6 ∈ T ∨ 7 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 2 (by decide)) (h 1 3 (by decide)) (h 6 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 6 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 6 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree8

namespace Tree9

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 0 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 2 && j == 6) ||
    (i == 5 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  (show graph.Adj 0 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach2.trans (show graph.Adj 2 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach5.trans (show graph.Adj 5 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 2, 5}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 1 ∈ T) → (2 ∈ T ∨ 6 ∈ T) → (5 ∈ T ∨ 7 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 1 (by decide)) (h 2 6 (by decide)) (h 5 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 5 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 5 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree9

namespace Tree10

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 1 && j == 6) ||
    (i == 2 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach1.trans (show graph.Adj 1 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach2.trans (show graph.Adj 2 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 2}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 3 ∈ T) → (1 ∈ T ∨ 4 ∈ T) → (2 ∈ T ∨ 7 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 3 (by decide)) (h 1 4 (by decide)) (h 2 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 1 && x 6) || (x 2 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 1 && x 6) || (x 2 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree10

namespace Tree11

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 0 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 1 && j == 6) ||
    (i == 2 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  (show graph.Adj 0 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach1.trans (show graph.Adj 1 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach2.trans (show graph.Adj 2 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 2}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 3 ∈ T) → (1 ∈ T ∨ 5 ∈ T) → (2 ∈ T ∨ 7 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 3 (by decide)) (h 1 5 (by decide)) (h 2 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 1 && x 5) || (x 1 && x 6) || (x 2 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 1 && x 5) || (x 1 && x 6) || (x 2 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree11

namespace Tree12

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 0 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 2 && j == 6) ||
    (i == 3 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  (show graph.Adj 0 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach2.trans (show graph.Adj 2 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach3.trans (show graph.Adj 3 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 2, 3}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 4 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 4 ∈ T) → (1 ∈ T ∨ 5 ∈ T) → (2 ∈ T ∨ 6 ∈ T) → (3 ∈ T ∨ 7 ∈ T) → 4 ≤ T.card := by decide
  exact bound T (h 0 4 (by decide)) (h 1 5 (by decide)) (h 2 6 (by decide)) (h 3 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 3 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 0 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 3 && x 7)) s ↔ 10 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 4 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 4 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree12

namespace Tree13

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 2 && j == 6) ||
    (i == 6 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach2.trans (show graph.Adj 2 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach6.trans (show graph.Adj 6 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 6}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 2 ∈ T) → (1 ∈ T ∨ 4 ∈ T) → (6 ∈ T ∨ 7 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 2 (by decide)) (h 1 4 (by decide)) (h 6 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 6 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 6 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree13

namespace Tree14

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 1 && j == 3) ||
    (i == 2 && j == 4) ||
    (i == 3 && j == 5) ||
    (i == 3 && j == 6) ||
    (i == 4 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  reach1.trans (show graph.Adj 1 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach2.trans (show graph.Adj 2 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach3.trans (show graph.Adj 3 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach3.trans (show graph.Adj 3 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach4.trans (show graph.Adj 4 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 3, 4}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 1 ∈ T) → (2 ∈ T ∨ 4 ∈ T) → (3 ∈ T ∨ 5 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 1 (by decide)) (h 2 4 (by decide)) (h 3 5 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 2 && x 4) || (x 3 && x 5) || (x 3 && x 6) || (x 4 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 2 && x 4) || (x 3 && x 5) || (x 3 && x 6) || (x 4 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree14

namespace Tree15

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 1 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 2 && j == 5) ||
    (i == 5 && j == 6) ||
    (i == 5 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  reach1.trans (show graph.Adj 1 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach2.trans (show graph.Adj 2 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach5.trans (show graph.Adj 5 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach5.trans (show graph.Adj 5 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 5}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 2 ∈ T) → (1 ∈ T ∨ 3 ∈ T) → (5 ∈ T ∨ 6 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 2 (by decide)) (h 1 3 (by decide)) (h 5 6 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 5 && x 6) || (x 5 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 5 && x 6) || (x 5 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree15

namespace Tree16

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 2 && j == 5) ||
    (i == 4 && j == 6) ||
    (i == 4 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach2.trans (show graph.Adj 2 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach4.trans (show graph.Adj 4 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach4.trans (show graph.Adj 4 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 2, 4}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 1 ∈ T) → (2 ∈ T ∨ 5 ∈ T) → (4 ∈ T ∨ 6 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 1 (by decide)) (h 2 5 (by decide)) (h 4 6 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 4 && x 6) || (x 4 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 4 && x 6) || (x 4 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree16

namespace Tree17

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 2 && j == 5) ||
    (i == 4 && j == 6) ||
    (i == 5 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach2.trans (show graph.Adj 2 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach4.trans (show graph.Adj 4 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach5.trans (show graph.Adj 5 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 4, 5}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 1 ∈ T) → (2 ∈ T ∨ 5 ∈ T) → (4 ∈ T ∨ 6 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 1 (by decide)) (h 2 5 (by decide)) (h 4 6 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 4 && x 6) || (x 5 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 4 && x 6) || (x 5 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree17

namespace Tree18

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 2 && j == 6) ||
    (i == 2 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach2.trans (show graph.Adj 2 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach2.trans (show graph.Adj 2 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 2}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 3 ∈ T) → (1 ∈ T ∨ 4 ∈ T) → (2 ∈ T ∨ 6 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 3 (by decide)) (h 1 4 (by decide)) (h 2 6 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 2 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 2 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree18

namespace Tree19

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 2 && j == 6) ||
    (i == 3 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach2.trans (show graph.Adj 2 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach3.trans (show graph.Adj 3 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {1, 2, 3}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 3 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 1 ∈ T) → (2 ∈ T ∨ 6 ∈ T) → (3 ∈ T ∨ 7 ∈ T) → 3 ≤ T.card := by decide
  exact bound T (h 0 1 (by decide)) (h 2 6 (by decide)) (h 3 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 3 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 3 && x 7)) s ↔ 9 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 3 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 3 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree19

namespace Tree20

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 2 && j == 5) ||
    (i == 3 && j == 6) ||
    (i == 4 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach2.trans (show graph.Adj 2 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach3.trans (show graph.Adj 3 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach4.trans (show graph.Adj 4 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 2, 3, 4}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 4 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 1 ∈ T) → (2 ∈ T ∨ 5 ∈ T) → (3 ∈ T ∨ 6 ∈ T) → (4 ∈ T ∨ 7 ∈ T) → 4 ≤ T.card := by decide
  exact bound T (h 0 1 (by decide)) (h 2 5 (by decide)) (h 3 6 (by decide)) (h 4 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 3 && x 6) || (x 4 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 3 && x 6) || (x 4 && x 7)) s ↔ 10 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 4 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 4 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree20

namespace Tree21

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 1 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 2 && j == 5) ||
    (i == 3 && j == 6) ||
    (i == 5 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  reach1.trans (show graph.Adj 1 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach2.trans (show graph.Adj 2 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach3.trans (show graph.Adj 3 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach5.trans (show graph.Adj 5 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 3, 5}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 4 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 2 ∈ T) → (1 ∈ T ∨ 4 ∈ T) → (3 ∈ T ∨ 6 ∈ T) → (5 ∈ T ∨ 7 ∈ T) → 4 ≤ T.card := by decide
  exact bound T (h 0 2 (by decide)) (h 1 4 (by decide)) (h 3 6 (by decide)) (h 5 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 3 && x 6) || (x 5 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 1 && x 3) || (x 1 && x 4) || (x 2 && x 5) || (x 3 && x 6) || (x 5 && x 7)) s ↔ 10 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 4 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 4 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree21

namespace Tree22

private def graphArc (i j : Fin 8) : Bool :=
  (i == 0 && j == 1) ||
    (i == 0 && j == 2) ||
    (i == 0 && j == 3) ||
    (i == 1 && j == 4) ||
    (i == 1 && j == 5) ||
    (i == 2 && j == 6) ||
    (i == 4 && j == 7)

private abbrev graph : SimpleGraph (Fin 8) where
  Adj i j := (graphArc i j || graphArc j i) = true
  symm := ⟨fun _ _ => by simp [Bool.or_comm]⟩
  loopless := ⟨by decide⟩

private theorem reach1 : graph.Reachable 0 1 :=
  (show graph.Adj 0 1 by decide).reachable

private theorem reach2 : graph.Reachable 0 2 :=
  (show graph.Adj 0 2 by decide).reachable

private theorem reach3 : graph.Reachable 0 3 :=
  (show graph.Adj 0 3 by decide).reachable

private theorem reach4 : graph.Reachable 0 4 :=
  reach1.trans (show graph.Adj 1 4 by decide).reachable

private theorem reach5 : graph.Reachable 0 5 :=
  reach1.trans (show graph.Adj 1 5 by decide).reachable

private theorem reach6 : graph.Reachable 0 6 :=
  reach2.trans (show graph.Adj 2 6 by decide).reachable

private theorem reach7 : graph.Reachable 0 7 :=
  reach4.trans (show graph.Adj 4 7 by decide).reachable

private theorem tree_acyclic : graph.IsAcyclic := by
  apply SimpleGraph.IsTree.isAcyclic
  apply SimpleGraph.isTree_iff_connected_and_card.mpr
  constructor
  · apply graph.connected_iff_exists_forall_reachable.mpr
    refine ⟨0, ?_⟩
    intro w
    fin_cases w
    · exact SimpleGraph.Reachable.rfl
    · exact reach1
    · exact reach2
    · exact reach3
    · exact reach4
    · exact reach5
    · exact reach6
    · exact reach7
  · rw [Nat.card_eq_fintype_card, ← graph.edgeFinset_card, Nat.card_eq_fintype_card]
    decide

private def cover : Finset (Fin 8) := {0, 1, 2, 4}

set_option maxRecDepth 4096 in
private theorem cover_lower (T : Finset (Fin 8))
    (h : ∀ i j : Fin 8, graph.Adj i j → i ∈ T ∨ j ∈ T) : 4 ≤ T.card := by
  have bound : ∀ T : Finset (Fin 8), (0 ∈ T ∨ 3 ∈ T) → (1 ∈ T ∨ 5 ∈ T) → (2 ∈ T ∨ 6 ∈ T) → (4 ∈ T ∨ 7 ∈ T) → 4 ≤ T.card := by decide
  exact bound T (h 0 3 (by decide)) (h 1 5 (by decide)) (h 2 6 (by decide)) (h 4 7 (by decide))

set_option maxRecDepth 4096 in
private theorem edge_fn :
    (fun x : Fin 8 → Bool => decide (∃ i j : Fin 8,
      graph.Adj i j ∧ x i = true ∧ x j = true)) =
    (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 4 && x 7)) := by
  funext x
  decide +revert

private theorem classified (s : ℕ) :
    PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x : Fin 8 → Bool => (x 0 && x 1) || (x 0 && x 2) || (x 0 && x 3) || (x 1 && x 4) || (x 1 && x 5) || (x 2 && x 6) || (x 4 && x 7)) s ↔ 10 ≤ s := by
  have he : ∃ i j : Fin 8, graph.Adj i j := ⟨0, 1, by decide⟩
  have ec : graph.edgeFinset.card = 7 := by decide
  constructor
  · intro h
    rw [← edge_fn] at h
    have lower := PEqualNP.MetaComplexity.L104 8 4 s graph tree_acyclic he cover_lower h
    rw [ec] at lower
    omega
  · intro hs
    have hc : ∀ i j : Fin 8, graph.Adj i j → i ∈ cover ∨ j ∈ cover := by decide
    have cc : cover.card = 4 := by decide
    have upper := PEqualNP.MetaComplexity.L105 8 graph cover he hc
    rw [edge_fn, ec, cc] at upper
    obtain ⟨c, legal, size, computes⟩ := upper
    exact ⟨c, legal, size.trans hs, computes⟩

end Tree22

end PEqualNP.Outside.L_meta_903_aux

theorem PEqualNP.Outside.L_meta_903 : (∀ s1 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x1 : Fin 8 → Bool => (x1 0 && x1 1) || (x1 0 && x1 2) || (x1 0 && x1 3) || (x1 0 && x1 4) || (x1 0 && x1 5) || (x1 0 && x1 6) || (x1 0 && x1 7)) s1 ↔ 7 ≤ s1) ∧ (∀ s2 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x2 : Fin 8 → Bool => (x2 0 && x2 1) || (x2 0 && x2 2) || (x2 0 && x2 3) || (x2 0 && x2 4) || (x2 0 && x2 5) || (x2 0 && x2 6) || (x2 1 && x2 7)) s2 ↔ 8 ≤ s2) ∧ (∀ s3 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x3 : Fin 8 → Bool => (x3 0 && x3 1) || (x3 0 && x3 2) || (x3 1 && x3 3) || (x3 1 && x3 4) || (x3 1 && x3 5) || (x3 1 && x3 6) || (x3 2 && x3 7)) s3 ↔ 8 ≤ s3) ∧ (∀ s4 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x4 : Fin 8 → Bool => (x4 0 && x4 1) || (x4 0 && x4 2) || (x4 0 && x4 3) || (x4 0 && x4 4) || (x4 0 && x4 5) || (x4 1 && x4 6) || (x4 1 && x4 7)) s4 ↔ 8 ≤ s4) ∧ (∀ s5 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x5 : Fin 8 → Bool => (x5 0 && x5 1) || (x5 0 && x5 2) || (x5 0 && x5 3) || (x5 0 && x5 4) || (x5 0 && x5 5) || (x5 1 && x5 6) || (x5 2 && x5 7)) s5 ↔ 9 ≤ s5) ∧ (∀ s6 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x6 : Fin 8 → Bool => (x6 0 && x6 1) || (x6 0 && x6 2) || (x6 1 && x6 3) || (x6 1 && x6 4) || (x6 1 && x6 5) || (x6 2 && x6 6) || (x6 2 && x6 7)) s6 ↔ 8 ≤ s6) ∧ (∀ s7 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x7 : Fin 8 → Bool => (x7 0 && x7 1) || (x7 0 && x7 2) || (x7 0 && x7 3) || (x7 0 && x7 4) || (x7 1 && x7 5) || (x7 1 && x7 6) || (x7 1 && x7 7)) s7 ↔ 8 ≤ s7) ∧ (∀ s8 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x8 : Fin 8 → Bool => (x8 0 && x8 1) || (x8 0 && x8 2) || (x8 1 && x8 3) || (x8 1 && x8 4) || (x8 1 && x8 5) || (x8 2 && x8 6) || (x8 6 && x8 7)) s8 ↔ 9 ≤ s8) ∧ (∀ s9 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x9 : Fin 8 → Bool => (x9 0 && x9 1) || (x9 0 && x9 2) || (x9 0 && x9 3) || (x9 0 && x9 4) || (x9 1 && x9 5) || (x9 2 && x9 6) || (x9 5 && x9 7)) s9 ↔ 9 ≤ s9) ∧ (∀ s10 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x10 : Fin 8 → Bool => (x10 0 && x10 1) || (x10 0 && x10 2) || (x10 0 && x10 3) || (x10 1 && x10 4) || (x10 1 && x10 5) || (x10 1 && x10 6) || (x10 2 && x10 7)) s10 ↔ 9 ≤ s10) ∧ (∀ s11 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x11 : Fin 8 → Bool => (x11 0 && x11 1) || (x11 0 && x11 2) || (x11 0 && x11 3) || (x11 0 && x11 4) || (x11 1 && x11 5) || (x11 1 && x11 6) || (x11 2 && x11 7)) s11 ↔ 9 ≤ s11) ∧ (∀ s12 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x12 : Fin 8 → Bool => (x12 0 && x12 1) || (x12 0 && x12 2) || (x12 0 && x12 3) || (x12 0 && x12 4) || (x12 1 && x12 5) || (x12 2 && x12 6) || (x12 3 && x12 7)) s12 ↔ 10 ≤ s12) ∧ (∀ s13 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x13 : Fin 8 → Bool => (x13 0 && x13 1) || (x13 0 && x13 2) || (x13 0 && x13 3) || (x13 1 && x13 4) || (x13 1 && x13 5) || (x13 2 && x13 6) || (x13 6 && x13 7)) s13 ↔ 9 ≤ s13) ∧ (∀ s14 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x14 : Fin 8 → Bool => (x14 0 && x14 1) || (x14 0 && x14 2) || (x14 1 && x14 3) || (x14 2 && x14 4) || (x14 3 && x14 5) || (x14 3 && x14 6) || (x14 4 && x14 7)) s14 ↔ 9 ≤ s14) ∧ (∀ s15 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x15 : Fin 8 → Bool => (x15 0 && x15 1) || (x15 0 && x15 2) || (x15 1 && x15 3) || (x15 1 && x15 4) || (x15 2 && x15 5) || (x15 5 && x15 6) || (x15 5 && x15 7)) s15 ↔ 9 ≤ s15) ∧ (∀ s16 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x16 : Fin 8 → Bool => (x16 0 && x16 1) || (x16 0 && x16 2) || (x16 0 && x16 3) || (x16 1 && x16 4) || (x16 2 && x16 5) || (x16 4 && x16 6) || (x16 4 && x16 7)) s16 ↔ 9 ≤ s16) ∧ (∀ s17 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x17 : Fin 8 → Bool => (x17 0 && x17 1) || (x17 0 && x17 2) || (x17 0 && x17 3) || (x17 1 && x17 4) || (x17 2 && x17 5) || (x17 4 && x17 6) || (x17 5 && x17 7)) s17 ↔ 9 ≤ s17) ∧ (∀ s18 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x18 : Fin 8 → Bool => (x18 0 && x18 1) || (x18 0 && x18 2) || (x18 0 && x18 3) || (x18 1 && x18 4) || (x18 1 && x18 5) || (x18 2 && x18 6) || (x18 2 && x18 7)) s18 ↔ 9 ≤ s18) ∧ (∀ s19 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x19 : Fin 8 → Bool => (x19 0 && x19 1) || (x19 0 && x19 2) || (x19 0 && x19 3) || (x19 1 && x19 4) || (x19 1 && x19 5) || (x19 2 && x19 6) || (x19 3 && x19 7)) s19 ↔ 9 ≤ s19) ∧ (∀ s20 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x20 : Fin 8 → Bool => (x20 0 && x20 1) || (x20 0 && x20 2) || (x20 0 && x20 3) || (x20 1 && x20 4) || (x20 2 && x20 5) || (x20 3 && x20 6) || (x20 4 && x20 7)) s20 ↔ 10 ≤ s20) ∧ (∀ s21 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x21 : Fin 8 → Bool => (x21 0 && x21 1) || (x21 0 && x21 2) || (x21 1 && x21 3) || (x21 1 && x21 4) || (x21 2 && x21 5) || (x21 3 && x21 6) || (x21 5 && x21 7)) s21 ↔ 10 ≤ s21) ∧ (∀ s22 : ℕ, PEqualNP.MetaComplexity.HasCircuitSize 8 (fun x22 : Fin 8 → Bool => (x22 0 && x22 1) || (x22 0 && x22 2) || (x22 0 && x22 3) || (x22 1 && x22 4) || (x22 1 && x22 5) || (x22 2 && x22 6) || (x22 4 && x22 7)) s22 ↔ 10 ≤ s22) := by
  exact ⟨
    PEqualNP.Outside.L_meta_903_aux.Tree1.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree2.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree3.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree4.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree5.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree6.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree7.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree8.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree9.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree10.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree11.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree12.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree13.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree14.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree15.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree16.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree17.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree18.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree19.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree20.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree21.classified,
    PEqualNP.Outside.L_meta_903_aux.Tree22.classified⟩
