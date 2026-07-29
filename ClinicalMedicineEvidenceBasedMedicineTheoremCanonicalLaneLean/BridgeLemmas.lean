import ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ClinicalWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse