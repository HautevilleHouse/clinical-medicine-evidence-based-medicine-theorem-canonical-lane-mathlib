import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure PharmacokineticPackage where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  plasmaConcentrationCurve : Prop
  bioavailability : Prop
  halfLife : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  plasmaConcentrationCurveClosed : P.plasmaConcentrationCurve
  bioavailabilityClosed : P.bioavailability
  halfLifeClosed : P.halfLife

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.plasmaConcentrationCurve ∧ P.bioavailability ∧ P.halfLife

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.plasmaConcentrationCurveClosed
          (And.intro E.bioavailabilityClosed E.halfLifeClosed))))

end HautevilleHouse
end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean