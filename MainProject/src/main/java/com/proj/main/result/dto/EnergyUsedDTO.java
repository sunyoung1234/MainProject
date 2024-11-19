package com.proj.main.result.dto;

public class EnergyUsedDTO {
	
    private String memId;                     // ����� ID
    private String buildingId;                // �ǹ� ID
    private String elecUse;                   // ���� ���� ��뷮
    private String gasUse;                    // ���� ���� ��뷮
    private String solarEnergyProduction;     // ���� �¾籤������
    private String annualElecSave;			  // ���� ���� ���෮
    private String annualElecCostSave;        // ���� ������ ���෮
    private String elecCost;                  // ���� ���� ���
    private String gasCost;                   // ���� ���� ���
    private String allCo2;                    // ���� �� ź�ҹ��ⷮ
    private String allPrimaryEnergy;          // ���� �� 1�������� �ҿ䷮

    // ��뷮 �뵵��
    private String wHeating;                  // ���� ��뷮
    private String wHotWater;                 // �¼� ��뷮
    private String wCooling;                  // �ù� ��뷮
    private String wVentilation;              // ȯ�� ��뷮 
    private String wLight;                    // ���� ��뷮
    private String wCooking;                  // ���� ��뷮
    private String wAppliance;                // ���� ��뷮
    private String wEtc;                      // ��Ÿ ��뷮

    // ��� �뵵��
    private String cHeating;                  // ���� ���
    private String cHotWater;                 // �¼� ���
    private String cCooling;                  // �ù� ���
    private String cVentilation;              // ȯ�� ���
    private String cLight;                    // ���� ���
    private String cCooking;                  // ���� ���
    private String cAppliance;                // ���� ���
    private String cEtc;                      // ��Ÿ ���
    
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
