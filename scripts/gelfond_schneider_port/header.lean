import Mathlib

/-!
The development below is M. Karatarakis's formalization of the Gelfond–Schneider theorem,
from `Mathlib/NumberTheory/Transcendental/GelfondSchneider/` (the files `MainAlg`, `MainAlgSetup`,
`MainOrder`, `MainAnalytic`, `AnalyticPart`, `MainPostAnalytic`, `MainAnalyticBounds`, `MainHol`,
`MainBounds` and `statement`, in that order) and the house
version of Siegel's lemma from `Mathlib/NumberTheory/NumberField/House.lean` (namespace
`NumberField.house`, here `GSHouse`, with its constants made public as in that fork), and the house
version of Siegel's lemma from `Mathlib/NumberTheory/NumberField/House.lean` (namespace
`NumberField.house`, here `GSHouse`, with its constants made public as in that fork), and the house
version of Siegel's lemma from `Mathlib/NumberTheory/NumberField/House.lean` (namespace
`NumberField.house`, here `GSHouse`, with its constants made public as in that fork), and the house
version of Siegel's lemma from `Mathlib/NumberTheory/NumberField/House.lean` (namespace
`NumberField.house`, here `GSHouse`, with its constants made public as in that fork), and the house
version of Siegel's lemma from `Mathlib/NumberTheory/NumberField/House.lean` (namespace
`NumberField.house`, here `GSHouse`, with its constants made public as in that fork), and the house
version of Siegel's lemma from `Mathlib/NumberTheory/NumberField/House.lean` (namespace
`NumberField.house`, here `GSHouse`, with its constants made public as in that fork), and the house
version of Siegel's lemma from `Mathlib/NumberTheory/NumberField/House.lean` (namespace
`NumberField.house`, here `GSHouse`, with its constants made public as in that fork), and the house
version of Siegel's lemma from `Mathlib/NumberTheory/NumberField/House.lean` (namespace
`NumberField.house`, here `GSHouse`, with its constants made public as in that fork), in
https://github.com/mkaratarakis/mathlib4 at commit cb781672b399c6badb5c70e3f73056bcb31012b0,
described in M. Karatarakis and F. Wiedijk, "A formalization of the Gelfond-Schneider theorem",
arXiv:2603.24823 (2026). Copyright (c) 2026 Michail Karatarakis, released under the Apache 2.0
license. Adapted here only as needed to build against this Mathlib revision.
-/
