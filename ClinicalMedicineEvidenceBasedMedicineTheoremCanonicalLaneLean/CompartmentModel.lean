import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure CompartmentModel (S : Type) (E : Type) (I : Type) (R : Type) where
  susceptible : S
  exposed : E
  infected : I
  recovered : R
  transmissionRate : Prop
  recoveryRate : Prop
  incubationPeriod : Prop
  diseaseFreeEquilibrium : Prop
  basicReproductionNumber : Prop

structure CompartmentModelEvidence (S : Type) (E : Type) (I : Type) (R : Type) (M : CompartmentModel S E I R) where
  transmissionRateClosed : M.transmissionRate
  recoveryRateClosed : M.recoveryRate
  incubationPeriodClosed : M.incubationPeriod
  diseaseFreeEquilibriumClosed : M.diseaseFreeEquilibrium
  basicReproductionNumberClosed : M.basicReproductionNumber

def CompartmentModelClosed (S : Type) (E : Type) (I : Type) (R : Type) (M : CompartmentModel S E I R) : Prop :=
  M.transmissionRate ∧ M.recoveryRate ∧ M.incubationPeriod ∧ M.diseaseFreeEquilibrium ∧ M.basicReproductionNumber

theorem compartment_model_closed_from_evidence
    (S : Type) (E : Type) (I : Type) (R : Type) (M : CompartmentModel S E I R) (Ev : CompartmentModelEvidence S E I R M) :
    CompartmentModelClosed S E I R M := by
  exact And.intro Ev.transmissionRateClosed
    (And.intro Ev.recoveryRateClosed
      (And.intro Ev.incubationPeriodClosed
        (And.intro Ev.diseaseFreeEquilibriumClosed Ev.basicReproductionNumberClosed)))

end HautevilleHouse
end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean