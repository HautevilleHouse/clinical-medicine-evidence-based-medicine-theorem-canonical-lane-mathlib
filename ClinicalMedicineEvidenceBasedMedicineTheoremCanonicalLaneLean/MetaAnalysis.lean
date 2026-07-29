import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure MetaAnalysisPackage where
  effectSize : ℝ
  confidenceIntervalLower : ℝ
  confidenceIntervalUpper : ℝ
  heterogeneityStatistic : ℝ
  publicationBiasTest : Prop
  forestPlot : Prop

structure MetaAnalysisEvidence (M : MetaAnalysisPackage) where
  effectSizeClosed : M.effectSize ≠ 0
  confidenceIntervalClosed : M.confidenceIntervalLower < M.confidenceIntervalUpper
  heterogeneityStatisticClosed : M.heterogeneityStatistic ≥ 0
  publicationBiasTestClosed : M.publicationBiasTest
  forestPlotClosed : M.forestPlot

def MetaAnalysisClosed (M : MetaAnalysisPackage) : Prop :=
  M.effectSize ≠ 0 ∧ M.confidenceIntervalLower < M.confidenceIntervalUpper ∧
  M.heterogeneityStatistic ≥ 0 ∧ M.publicationBiasTest ∧ M.forestPlot

theorem meta_analysis_closed_from_evidence (M : MetaAnalysisPackage)
    (E : MetaAnalysisEvidence M) : MetaAnalysisClosed M := by
  exact And.intro E.effectSizeClosed
    (And.intro E.confidenceIntervalClosed
      (And.intro E.heterogeneityStatisticClosed
        (And.intro E.publicationBiasTestClosed
          E.forestPlotClosed)))

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse