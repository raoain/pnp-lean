inductive Branch where
  | left : Branch
  | right : Branch
  deriving DecidableEq

abbrev Path := List Branch

/-- 深度 n 的选择串共有多少条：递归定义（每一拍分两支） -/
def numPaths : Nat -> Nat
  | 0 => 1
  | n + 1 => 2 * numPaths n

/-- 直接算出：它就是 2^n —— 即"深度 n 的树有 2^n 条路" -/
theorem numPaths_eq (n : Nat) : numPaths n = 2 ^ n := by
  induction n with
  | zero => rfl
  | succ k ih =>
      simp [numPaths, ih, Nat.pow_succ]
      exact Nat.mul_comm 2 (2 ^ k) ▸ rfl

/-- 一条路的代价＝它的深度（走几步） -/
def cost (p : Path) : Nat := p.length