import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure ClinicalStudy where
  population : String
  intervention : String
  comparator : String
  outcome : String
  studyType : String

def clinicalAdmittedObject (study : ClinicalStudy) : AdmittedObject := 
  AdmittedObject.mk study.studyType

structure EvidenceBasedMedicineEndpoint where
  effectSize : Float
  confidenceInterval : Float × Float
  pValue : Float
  clinicalSignificance : Prop

structure AdmissibleClass where
  object : ClinicalStudy
  endpoint : EvidenceBasedMedicineEndpoint
  evidenceSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : evidenceSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ (A.evidenceSatisfied ∨ A.remainderRecorded)

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse
