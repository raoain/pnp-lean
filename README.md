# pnp-lean

守链（Raoain）这套"分叉即判定"框架的**形式化副本** ＋ 两张对外表。

**说明（先读）**：本仓库**不产生新知识**，它是账（`track\theory\公式结果账-*.md`，另存于作者本地）里已有推论的机械化副本。
对外的推翻机制在账里的"可推翻点"；这里只做**对内机器核**（防抄错、推错、自欺）。

## 目录

| 路径 | 内容 |
|---|---|
| `Basic.lean` | `numPaths n = 2^n`——深度 `n` 的决策串有 `2^n` 条 |
| `Select.lean` | `eq_of_same_at?`（同长位位相同 ⇒ 同一串）、`differs_somewhere`（不同路必差一位） |
| `Adversary.lean` | 对手下界**骨架**：`adversary_needs_all_bits` 目前用 `sorry`（**未证**） |
| `STATUS.md` | 逐文件状态与"对外推翻／对内机器核"两栏说明 |
| `docs/表-域.md` | 五域主干（数学→物理→化学→生物→社会）＋各域内补充 |
| `docs/表-符号与变式.md` | 符号表与各档最简式 |

## 构建

依赖：`elan`（Lean 版本管理器）。版本锁在 `lean-toolchain`（`leanprover/lean4:v4.36.0`）。

    elan toolchain install $(cat lean-toolchain)   # 或 elan toolchain install stable
    lake build

**不需要 Mathlib**：全部只用 Lean 核心（`Nat`／`List`／`inductive`）。

## 已证 / 未证

- 已证（无 `sorry`）：`Basic.numPaths_eq`、`Pnp.eq_of_same_at?`、`Pnp.differs_somewhere`；
- 未证（含 `sorry`，**不许当结论引用**）：`Pnp.adversary_needs_all_bits`。

## 许可

AGPL-3.0（与作者另一个仓库一致）。