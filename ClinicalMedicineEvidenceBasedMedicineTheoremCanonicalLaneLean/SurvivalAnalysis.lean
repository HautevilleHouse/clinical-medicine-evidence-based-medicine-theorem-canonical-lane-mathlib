import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure SurvivalModelPackage where
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  hazardNonnegative : ∀ t, hazardFunction t ≥ 0
  survivalBetweenZeroOne : ∀ t, survivalFunction t ≥ 0 ∧ survivalFunction t ≤ 1
  survivalDerivative : ∀ t, survivalFunction t = Real.exp (-∫ s in (0:ℝ)..t, hazardFunction s)

structure SurvivalAnalysisEvidence (S : SurvivalModelPackage) where
  hazardNonnegativeClosed : S.hazardNonnegative
  survivalBetweenZeroOneClosed : S.survivalBetweenZeroOne
  survivalDerivativeClosed : S.survivalDerivative

def SurvivalAnalysisClosed (S : SurvivalModelPackage) : Prop :=
  S.hazardNonnegative ∧ S.survivalBetweenZeroOne ∧ S.survivalDerivative

theorem survival_analysis_closed_from_evidence (S : SurvivalModelPackage) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.hazardNonnegativeClosed
    (And.intro E.survivalBetweenZeroOneClosed E.survivalDerivativeClosed)

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse
