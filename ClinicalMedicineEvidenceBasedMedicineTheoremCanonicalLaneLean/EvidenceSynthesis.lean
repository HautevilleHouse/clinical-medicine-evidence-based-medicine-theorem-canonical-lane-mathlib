import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure EvidenceSynthesis where
  studies : List (ℕ × ℝ × ℝ × ℝ)  -- (sampleSize, effectSize, variance, weight)
  heterogeneityMeasure : ℝ
  randomEffectsModel : Prop
  fixedEffectsModel : Prop
  publicationBiasAdjusted : Prop

structure SynthesisEvidence (E : EvidenceSynthesis) where
  randomEffectsModelClosed : E.randomEffectsModel
  fixedEffectsModelClosed : E.fixedEffectsModel
  publicationBiasAdjustedClosed : E.publicationBiasAdjusted

def EvidenceSynthesisClosed (E : EvidenceSynthesis) : Prop :=
  E.randomEffectsModel ∧ E.fixedEffectsModel ∧ E.publicationBiasAdjusted

theorem evidence_synthesis_closed_from_evidence (E : EvidenceSynthesis) (Ev : SynthesisEvidence E) :
    EvidenceSynthesisClosed E := by
  exact And.intro Ev.randomEffectsModelClosed (And.intro Ev.fixedEffectsModelClosed Ev.publicationBiasAdjustedClosed)

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse