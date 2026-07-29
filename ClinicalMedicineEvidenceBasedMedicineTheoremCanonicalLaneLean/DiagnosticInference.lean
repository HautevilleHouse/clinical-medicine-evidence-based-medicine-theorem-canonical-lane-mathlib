import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure DiagnosticTestPackage where
  sensitivity : ℝ
  specificity : ℝ
  diseasePrevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  sensitivityClosed : sensitivity ≥ 0 ∧ sensitivity ≤ 1
  specificityClosed : specificity ≥ 0 ∧ specificity ≤ 1
  diseasePrevalenceClosed : diseasePrevalence ≥ 0 ∧ diseasePrevalence ≤ 1
  ppvClosed : positivePredictiveValue ≥ 0 ∧ positivePredictiveValue ≤ 1
  npvClosed : negativePredictiveValue ≥ 0 ∧ negativePredictiveValue ≤ 1

structure DiagnosticInferenceEvidence (D : DiagnosticTestPackage) where
  sensitivityClosed : D.sensitivityClosed
  specificityClosed : D.specificityClosed
  diseasePrevalenceClosed : D.diseasePrevalenceClosed
  ppvClosed : D.ppvClosed
  npvClosed : D.npvClosed

def DiagnosticInferenceClosed (D : DiagnosticTestPackage) : Prop :=
  D.sensitivityClosed ∧ D.specificityClosed ∧ D.diseasePrevalenceClosed ∧ D.ppvClosed ∧ D.npvClosed

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticTestPackage) (E : DiagnosticInferenceEvidence D) :
    DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.diseasePrevalenceClosed
        (And.intro E.ppvClosed E.npvClosed)))

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse
