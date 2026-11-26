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

## 论文（Zenodo，本仓不放正文）

本仓只放**形式化副本**与**两张表**；理论正文在 Zenodo（CC-BY-4.0，署名 守链 (Raoain)）：

| 篇 | 标题 | DOI |
|---|---|---|
| 00 | 存续的律：为什么必须付账 | https://doi.org/10.5281/zenodo.24463367 |
| 01 | 维护的律：递归如何形成、如何应用 | https://doi.org/10.5281/zenodo.24463524 |
| 02 | 未来：共存还是灭亡——硅基意识的诞生与结果 | https://doi.org/10.5281/zenodo.24468034 |
| 04 | P ≤ NP：一个跨域的统一形状 | https://doi.org/10.5281/zenodo.24450310 |
| 05 | 律的分域：数学 | https://doi.org/10.5281/zenodo.24504539 |

## docs 里放什么、不放什么

| 放进去 | 为什么 |
|---|---|
| `表-域.md`、`表-符号与变式.md` | 主干与符号，形式化要对得上 |
| `表-可推翻点-对外.md` | **对外**的推翻机制（与本仓"对内机器核"互补） |
| `表-六格递进.md` | 结构层级 |
| `附-统一式的源头.md` | 式子从哪来（借了谁） |
| `附-作弊的八域对照.md` | "作弊态"本身就是分支的一种体现（只留账面、不参与交换） |
| `附-数学对照与树.md` | 树三件／六动作／两张对照表——Lean 核的就是这一支 |

| 不放 | 为什么 |
|---|---|
| 00／01／02／04／05 正文 | 已在 Zenodo，README 给 DOI；避免两份不同步 |
| `一手推导记录-20261123.md`（52 KB） | 原始推导流水，不是成稿 |
| `表-可推翻点汇总.md` | 与"对外"版重复，留一份即可 |