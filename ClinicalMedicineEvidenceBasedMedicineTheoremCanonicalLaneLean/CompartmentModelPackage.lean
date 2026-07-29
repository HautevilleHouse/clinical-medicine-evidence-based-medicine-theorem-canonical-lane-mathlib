import ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean.ClinicalEvidenceAdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure CompartmentModel where
  numCompartments : Nat
  rateConstants : List Float
  initialConditions : List Float
  solutionPath : Type u

structure CompartmentModelEvidence (M : CompartmentModel) where
  compartmentsPositive : M.numCompartments > 0
  rateConstantsValid : List.length M.rateConstants = M.numCompartments * M.numCompartments
  initialConditionsValid : List.length M.initialConditions = M.numCompartments

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.numCompartments > 0 ∧ List.length M.rateConstants = M.numCompartments * M.numCompartments ∧
  List.length M.initialConditions = M.numCompartments

theorem compartment_model_closed_from_evidence (M : CompartmentModel) (E : CompartmentModelEvidence M) : CompartmentModelClosed M :=
  And.intro E.compartmentsPositive (And.intro E.rateConstantsValid E.initialConditionsValid)

end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean
end HautevilleHouse
