import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure PharmacokineticModel where
  absorptionRate : ℝ
  distributionVolume : ℝ
  eliminationRate : ℝ
  halfLife : ℝ
  clearance : ℝ
  bioavailability : ℝ
  steadyStateConcentration : ℝ

structure PharmacokineticEvidence (M : PharmacokineticModel) where
  absorptionRateClosed : M.absorptionRate > 0
  distributionVolumeClosed : M.distributionVolume > 0
  eliminationRateClosed : M.eliminationRate > 0
  halfLifeClosed : M.halfLife > 0
  clearanceClosed : M.clearance > 0
  bioavailabilityClosed : M.bioavailability > 0
  steadyStateConcentrationClosed : M.steadyStateConcentration > 0

def PharmacokineticClosed (M : PharmacokineticModel) : Prop :=
  M.absorptionRate > 0 ∧ M.distributionVolume > 0 ∧ M.eliminationRate > 0 ∧
  M.halfLife > 0 ∧ M.clearance > 0 ∧ M.bioavailability > 0 ∧
  M.steadyStateConcentration > 0

theorem pharmacokinetic_closed_from_evidence (M : PharmacokineticModel)
    (E : PharmacokineticEvidence M) : PharmacokineticClosed M := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.halfLifeClosed
          (And.intro E.clearanceClosed
            (And.intro E.bioavailabilityClosed
              E.steadyStateConcentrationClosed)))))

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse