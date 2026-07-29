import ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean.ClinicalBridgeLemmas

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.evidenceSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse
