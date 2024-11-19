package com.proj.main.result.dto;

public class EnergyUsedDTO {
	
    private String memId;                     // 사용자 ID
    private String buildingId;                // 건물 ID
    private String elecUse;                   // 연간 전기 사용량
    private String gasUse;                    // 연간 가스 사용량
    private String solarEnergyProduction;     // 연간 태양광발전량
    private String annualElecSave;			  // 연간 전기 절약량
    private String annualElecCostSave;        // 연간 전기요금 절약량
    private String elecCost;                  // 연간 전기 요금
    private String gasCost;                   // 연간 가스 요금
    private String allCo2;                    // 연간 총 탄소배출량
    private String allPrimaryEnergy;          // 연간 총 1차에너지 소요량

    // 사용량 용도별
    private String wHeating;                  // 난방 사용량
    private String wHotWater;                 // 온수 사용량
    private String wCooling;                  // 냉방 사용량
    private String wVentilation;              // 환기 사용량 
    private String wLight;                    // 조명 사용량
    private String wCooking;                  // 조리 사용량
    private String wAppliance;                // 가전 사용량
    private String wEtc;                      // 기타 사용량

    // 요금 용도별
    private String cHeating;                  // 난방 요금
    private String cHotWater;                 // 온수 요금
    private String cCooling;                  // 냉방 요금
    private String cVentilation;              // 환기 요금
    private String cLight;                    // 조명 요금
    private String cCooking;                  // 조리 요금
    private String cAppliance;                // 가전 요금
    private String cEtc;                      // 기타 요금
    
	public EnergyUsedDTO() {
		super();
	}

	public EnergyUsedDTO(String memId, String buildingId, String elecUse, String gasUse, String solarEnergyProduction,
			String annualElecSave, String annualElecCostSave, String elecCost, String gasCost, String allCo2,
			String allPrimaryEnergy, String wHeating, String wHotWater, String wCooling, String wVentilation,
			String wLight, String wCooking, String wAppliance, String wEtc, String cHeating, String cHotWater,
			String cCooling, String cVentilation, String cLight, String cCooking, String cAppliance, String cEtc) {
		super();
		this.memId = memId;
		this.buildingId = buildingId;
		this.elecUse = elecUse;
		this.gasUse = gasUse;
		this.solarEnergyProduction = solarEnergyProduction;
		this.annualElecSave = annualElecSave;
		this.annualElecCostSave = annualElecCostSave;
		this.elecCost = elecCost;
		this.gasCost = gasCost;
		this.allCo2 = allCo2;
		this.allPrimaryEnergy = allPrimaryEnergy;
		this.wHeating = wHeating;
		this.wHotWater = wHotWater;
		this.wCooling = wCooling;
		this.wVentilation = wVentilation;
		this.wLight = wLight;
		this.wCooking = wCooking;
		this.wAppliance = wAppliance;
		this.wEtc = wEtc;
		this.cHeating = cHeating;
		this.cHotWater = cHotWater;
		this.cCooling = cCooling;
		this.cVentilation = cVentilation;
		this.cLight = cLight;
		this.cCooking = cCooking;
		this.cAppliance = cAppliance;
		this.cEtc = cEtc;
	}

	@Override
	public String toString() {
		return "EnergyUsedDTO [memId=" + memId + ", buildingId=" + buildingId + ", elecUse=" + elecUse + ", gasUse="
				+ gasUse + ", solarEnergyProduction=" + solarEnergyProduction + ", annualElecSave=" + annualElecSave
				+ ", annualElecCostSave=" + annualElecCostSave + ", elecCost=" + elecCost + ", gasCost=" + gasCost
				+ ", allCo2=" + allCo2 + ", allPrimaryEnergy=" + allPrimaryEnergy + ", wHeating=" + wHeating
				+ ", wHotWater=" + wHotWater + ", wCooling=" + wCooling + ", wVentilation=" + wVentilation + ", wLight="
				+ wLight + ", wCooking=" + wCooking + ", wAppliance=" + wAppliance + ", wEtc=" + wEtc + ", cHeating="
				+ cHeating + ", cHotWater=" + cHotWater + ", cCooling=" + cCooling + ", cVentilation=" + cVentilation
				+ ", cLight=" + cLight + ", cCooking=" + cCooking + ", cAppliance=" + cAppliance + ", cEtc=" + cEtc
				+ "]";
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}

	public String getElecUse() {
		return elecUse;
	}

	public void setElecUse(String elecUse) {
		this.elecUse = elecUse;
	}

	public String getGasUse() {
		return gasUse;
	}

	public void setGasUse(String gasUse) {
		this.gasUse = gasUse;
	}

	public String getSolarEnergyProduction() {
		return solarEnergyProduction;
	}

	public void setSolarEnergyProduction(String solarEnergyProduction) {
		this.solarEnergyProduction = solarEnergyProduction;
	}

	public String getAnnualElecSave() {
		return annualElecSave;
	}

	public void setAnnualElecSave(String annualElecSave) {
		this.annualElecSave = annualElecSave;
	}

	public String getAnnualElecCostSave() {
		return annualElecCostSave;
	}

	public void setAnnualElecCostSave(String annualElecCostSave) {
		this.annualElecCostSave = annualElecCostSave;
	}

	public String getElecCost() {
		return elecCost;
	}

	public void setElecCost(String elecCost) {
		this.elecCost = elecCost;
	}

	public String getGasCost() {
		return gasCost;
	}

	public void setGasCost(String gasCost) {
		this.gasCost = gasCost;
	}

	public String getAllCo2() {
		return allCo2;
	}

	public void setAllCo2(String allCo2) {
		this.allCo2 = allCo2;
	}

	public String getAllPrimaryEnergy() {
		return allPrimaryEnergy;
	}

	public void setAllPrimaryEnergy(String allPrimaryEnergy) {
		this.allPrimaryEnergy = allPrimaryEnergy;
	}

	public String getwHeating() {
		return wHeating;
	}

	public void setwHeating(String wHeating) {
		this.wHeating = wHeating;
	}

	public String getwHotWater() {
		return wHotWater;
	}

	public void setwHotWater(String wHotWater) {
		this.wHotWater = wHotWater;
	}

	public String getwCooling() {
		return wCooling;
	}

	public void setwCooling(String wCooling) {
		this.wCooling = wCooling;
	}

	public String getwVentilation() {
		return wVentilation;
	}

	public void setwVentilation(String wVentilation) {
		this.wVentilation = wVentilation;
	}

	public String getwLight() {
		return wLight;
	}

	public void setwLight(String wLight) {
		this.wLight = wLight;
	}

	public String getwCooking() {
		return wCooking;
	}

	public void setwCooking(String wCooking) {
		this.wCooking = wCooking;
	}

	public String getwAppliance() {
		return wAppliance;
	}

	public void setwAppliance(String wAppliance) {
		this.wAppliance = wAppliance;
	}

	public String getwEtc() {
		return wEtc;
	}

	public void setwEtc(String wEtc) {
		this.wEtc = wEtc;
	}

	public String getcHeating() {
		return cHeating;
	}

	public void setcHeating(String cHeating) {
		this.cHeating = cHeating;
	}

	public String getcHotWater() {
		return cHotWater;
	}

	public void setcHotWater(String cHotWater) {
		this.cHotWater = cHotWater;
	}

	public String getcCooling() {
		return cCooling;
	}

	public void setcCooling(String cCooling) {
		this.cCooling = cCooling;
	}

	public String getcVentilation() {
		return cVentilation;
	}

	public void setcVentilation(String cVentilation) {
		this.cVentilation = cVentilation;
	}

	public String getcLight() {
		return cLight;
	}

	public void setcLight(String cLight) {
		this.cLight = cLight;
	}

	public String getcCooking() {
		return cCooking;
	}

	public void setcCooking(String cCooking) {
		this.cCooking = cCooking;
	}

	public String getcAppliance() {
		return cAppliance;
	}

	public void setcAppliance(String cAppliance) {
		this.cAppliance = cAppliance;
	}

	public String getcEtc() {
		return cEtc;
	}

	public void setcEtc(String cEtc) {
		this.cEtc = cEtc;
	}

	
	
    
}
