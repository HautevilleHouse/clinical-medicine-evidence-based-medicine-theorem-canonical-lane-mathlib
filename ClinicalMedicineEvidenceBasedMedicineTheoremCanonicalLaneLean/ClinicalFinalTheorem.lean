import ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean.ClinicalGateLemmas

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

def ConstrainedClinicalEvidenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_clinical_evidence_endgame (A : AdmissibleClass) : ConstrainedClinicalEvidenceClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse
