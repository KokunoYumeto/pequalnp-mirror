import PEqualNP.Defs

namespace PEqualNP.Outside.L_meta_788_aux

open PEqualNP.CircuitLowerBounds

def cycleCircuit : Circuit := { gates := [⟨.or, [7, 1]⟩, ⟨.and, [8, 0]⟩, ⟨.or, [5, 3]⟩, ⟨.and, [4, 10]⟩, ⟨.or, [9, 11]⟩, ⟨.or, [7, 5]⟩, ⟨.and, [13, 6]⟩, ⟨.or, [3, 1]⟩, ⟨.and, [2, 15]⟩, ⟨.or, [14, 16]⟩, ⟨.or, [12, 17]⟩], output := 18 }

def edges : List (ℕ × ℕ) := [(0, 1), (0, 7), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7)]

def orGate (a b : Bool) : Bool := [a,b].any id
def andGate (a b : Bool) : Bool := [a,b].all id

def leftStars (x : Fin 8 → Bool) : Bool :=
  orGate (andGate (orGate (x 7) (x 1)) (x 0))
    (andGate (x 4) (orGate (x 5) (x 3)))

def rightStars (x : Fin 8 → Bool) : Bool :=
  orGate (andGate (orGate (x 7) (x 5)) (x 6))
    (andGate (x 2) (orGate (x 3) (x 1)))

def leftRows (x : Fin 8 → Bool) : Bool :=
  ((x 1 && x 0) || (x 3 && x 4)) || ((x 5 && x 4) || (x 7 && x 0))

def rightRows (x : Fin 8 → Bool) : Bool :=
  ((x 1 && x 2) || (x 3 && x 2)) || ((x 5 && x 6) || (x 7 && x 6))

lemma wire12 (x : Fin 8 → Bool) :
    (cycleCircuit.wires (List.ofFn x)).getD 12 false = leftStars x := by rfl

lemma wire17 (x : Fin 8 → Bool) :
    (cycleCircuit.wires (List.ofFn x)).getD 17 false = rightStars x := by rfl

set_option maxHeartbeats 2000000 in
lemma finalGate (x : Fin 8 → Bool) :
    cycleCircuit.eval (List.ofFn x) =
      orGate ((cycleCircuit.wires (List.ofFn x)).getD 12 false)
        ((cycleCircuit.wires (List.ofFn x)).getD 17 false) := by
  rw [wire12, wire17]
  rfl

lemma operandRows : ∀ x : Fin 8 → Bool,
    leftStars x = leftRows x ∧ rightStars x = rightRows x := by decide +kernel

lemma rowEdges : ∀ x : Fin 8 → Bool,
    orGate (leftRows x) (rightRows x) = true ↔
      ∃ u v : Fin 8, (u.val, v.val) ∈ edges ∧ x u = true ∧ x v = true := by
  decide +kernel

lemma correct (x : Fin 8 → Bool) :
    cycleCircuit.eval (List.ofFn x) = true ↔
      ∃ u v : Fin 8, (u.val, v.val) ∈ edges ∧ x u = true ∧ x v = true := by
  rw [finalGate, wire12, wire17, (operandRows x).1, (operandRows x).2]
  exact rowEdges x

lemma fanIn : PEqualNP.MetaComplexity.FanInTwo cycleCircuit := by
  simp [PEqualNP.MetaComplexity.FanInTwo, cycleCircuit]

end PEqualNP.Outside.L_meta_788_aux

theorem PEqualNP.Outside.L_meta_788 : ∀ C : PEqualNP.CircuitLowerBounds.Circuit, C = ({ gates := [⟨PEqualNP.CircuitLowerBounds.GateOp.or, [7, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [8, 0]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [5, 3]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [4, 10]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [9, 11]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [7, 5]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [13, 6]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [3, 1]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.and, [2, 15]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [14, 16]⟩, ⟨PEqualNP.CircuitLowerBounds.GateOp.or, [12, 17]⟩], output := 18 } : PEqualNP.CircuitLowerBounds.Circuit) → PEqualNP.MetaComplexity.FanInTwo C ∧ C.size = 11 ∧ (∀ x : Fin 8 → Bool, (C.eval (List.ofFn x) = true ↔ ∃ u v : Fin 8, (u.val, v.val) ∈ ([(0, 1), (0, 7), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7)] : List (ℕ × ℕ)) ∧ x u = true ∧ x v = true)) := by
  rintro C rfl
  exact ⟨PEqualNP.Outside.L_meta_788_aux.fanIn, rfl, PEqualNP.Outside.L_meta_788_aux.correct⟩
