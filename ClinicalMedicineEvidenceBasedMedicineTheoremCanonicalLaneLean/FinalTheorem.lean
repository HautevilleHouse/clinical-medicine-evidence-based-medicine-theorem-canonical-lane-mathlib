import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

def ClinicalMedicineEvidenceBasedMedicineClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem clinical_medicine_ebm_endgame (A : AdmissibleClass) :
    ClinicalMedicineEvidenceBasedMedicineClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse
end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean