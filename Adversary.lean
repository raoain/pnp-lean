import Select

/-!
第四页（对手下界）的**骨架**：先把"算法/查询"的模型定义出来，
定理暂时 `sorry`——**这不是已证的东西**，只是把形状占住。
-/

namespace Pnp

open Branch

/-- 一个"世界"＝一条真实的路 -/
abbrev World := List Branch

/-- 回答者：给定已问过的位（表），回答第 i 位是多少 -/
def answer (w : World) (i : Nat) : Option Branch := at? w i

/-- 已问过的位：位置 → 答案 -/
abbrev Seen := List (Nat × Branch)

def seenGet (s : Seen) (i : Nat) : Option Branch :=
  (s.find? (fun p => p.1 == i)).map (fun p => p.2)

/-- 与已见答案一致的"世界"集合里的元素判定 -/
def Consistent (w : World) (s : Seen) : Prop :=
  ∀ i a, seenGet s i = some a → at? w i = some a

/-- 策略：看已见答案，决定下一个问哪位（none＝停，输出） -/
abbrev Strategy := Seen → Option Nat

/-- **TODO（未证）**：若真实长度 n≥1 而只问了 m<n 位，
    则总存在另一个与已见答案一致、但不同的世界——
    所以任何"只问 m<n 位就输出"的策略都会在某些世界出错。
    这就是"最坏情况必须问 n 位"的对手下界的核心。 -/
theorem adversary_needs_all_bits
    (n : Nat) (hn : 0 < n) (s : Seen) (hshort : s.length < n) :
    ∃ w w' : World, w.length = n ∧ w'.length = n ∧ w ≠ w' ∧
      Consistent w s ∧ Consistent w' s := by
  sorry

end Pnp