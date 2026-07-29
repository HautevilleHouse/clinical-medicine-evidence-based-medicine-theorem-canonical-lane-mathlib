import ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ClinicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ClinicalAdmittedObject where
  space : ClinicalSpace
  evidenceBased : Prop
  diagnosticTestPerformed : Prop
  studyDesign : Type
  studyTopology : TopologicalSpace studyDesign
  evidenceSynthesized : Prop
  conclusion : evidenceSynthesized

structure ClinicalEndgameState where
  object : ClinicalAdmittedObject

def ClinicalWitnessClosed (O : ClinicalAdmittedObject) : Prop :=
  O.evidenceSynthesized

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse