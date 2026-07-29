import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean

structure ClinicalTrialDesignPackage where
  randomization : Prop
  blinding : Prop
  allocationConcealment : Prop
  sampleSizeCalculation : Prop
  primaryEndpoint : Prop
  statisticalPower : Prop
  intentionToTreat : Prop

structure ClinicalTrialDesignEvidence (C : ClinicalTrialDesignPackage) where
  randomizationClosed : C.randomization
  blindingClosed : C.blinding
  allocationConcealmentClosed : C.allocationConcealment
  sampleSizeCalculationClosed : C.sampleSizeCalculation
  primaryEndpointClosed : C.primaryEndpoint
  statisticalPowerClosed : C.statisticalPower
  intentionToTreatClosed : C.intentionToTreat

def ClinicalTrialDesignClosed (C : ClinicalTrialDesignPackage) : Prop :=
  C.randomization ∧ C.blinding ∧ C.allocationConcealment ∧ C.sampleSizeCalculation ∧ C.primaryEndpoint ∧ C.statisticalPower ∧ C.intentionToTreat

theorem clinical_trial_design_closed_from_evidence (C : ClinicalTrialDesignPackage) (E : ClinicalTrialDesignEvidence C) :
    ClinicalTrialDesignClosed C := by
  exact And.intro E.randomizationClosed
    (And.intro E.blindingClosed
      (And.intro E.allocationConcealmentClosed
        (And.intro E.sampleSizeCalculationClosed
          (And.intro E.primaryEndpointClosed
            (And.intro E.statisticalPowerClosed E.intentionToTreatClosed)))))

end HautevilleHouse
end ClinicalMedicineEvidenceBasedMedicineTheoremCanonicalLaneLean