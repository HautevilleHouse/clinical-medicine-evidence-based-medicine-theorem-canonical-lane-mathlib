import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure RandomizedTrial where
  sampleSize : ℕ
  treatmentEffect : ℝ
  pValue : ℝ
  confidenceInterval : ℝ × ℝ
  randomizationValid : Prop
  blindingValid : Prop
  intentionToTreat : Prop

structure TrialEvidence (T : RandomizedTrial) where
  randomizationValidClosed : T.randomizationValid
  blindingValidClosed : T.blindingValid
  intentionToTreatClosed : T.intentionToTreat

def RandomizedTrialClosed (T : RandomizedTrial) : Prop :=
  T.randomizationValid ∧ T.blindingValid ∧ T.intentionToTreat

theorem randomized_trial_closed_from_evidence (T : RandomizedTrial) (E : TrialEvidence T) :
    RandomizedTrialClosed T := by
  exact And.intro E.randomizationValidClosed (And.intro E.blindingValidClosed E.intentionToTreatClosed)

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse