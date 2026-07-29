import ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean.ClinicalEvidenceAdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : Float
  specificity : Float
  prevalence : Float

def positivePredictiveValue (t : DiagnosticTest) : Float :=
  (t.sensitivity * t.prevalence) / (t.sensitivity * t.prevalence + (1 - t.specificity) * (1 - t.prevalence))

def negativePredictiveValue (t : DiagnosticTest) : Float :=
  (t.specificity * (1 - t.prevalence)) / ((1 - t.sensitivity) * t.prevalence + t.specificity * (1 - t.prevalence))

structure DiagnosticEvidence (t : DiagnosticTest) where
  sensitivityInRange : 0 ≤ t.sensitivity ∧ t.sensitivity ≤ 1
  specificityInRange : 0 ≤ t.specificity ∧ t.specificity ≤ 1
  prevalenceInRange : 0 ≤ t.prevalence ∧ t.prevalence ≤ 1

def DiagnosticInferenceClosed (t : DiagnosticTest) : Prop :=
  0 ≤ t.sensitivity ∧ t.sensitivity ≤ 1 ∧
  0 ≤ t.specificity ∧ t.specificity ≤ 1 ∧
  0 ≤ t.prevalence ∧ t.prevalence ≤ 1

theorem diagnostic_inference_closed_from_evidence (t : DiagnosticTest) (E : DiagnosticEvidence t) : DiagnosticInferenceClosed t :=
  And.intro E.sensitivityInRange.1 (And.intro E.sensitivityInRange.2
    (And.intro E.specificityInRange.1 (And.intro E.specificityInRange.2
      (And.intro E.prevalenceInRange.1 E.prevalenceInRange.2))))

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse
