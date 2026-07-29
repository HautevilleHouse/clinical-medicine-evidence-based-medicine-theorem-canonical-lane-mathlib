import ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean.ClinicalEvidenceAdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.evidenceSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.evidenceSatisfied

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse
