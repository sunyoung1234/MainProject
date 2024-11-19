package com.proj.main.result.dto;

public class EnergyResultDTO {
	
    private String memId;                     // ����� ID
    private String buildingId;                // �ǹ��� + ��곯¥
    private double heatingPerf;               // ���漺��
    private double heatingDemand;             // ���� �䱸�� (kWh/����yr)
    private double heatingLoad;               // ������� (W/��)
    private double coolingDemand;             // �ù濡���� �䱸�� (kWh/����yr)
    private double sensibleEnergy;            // ����������
    private double dehumidEnergy;             // ����������
    private double coolingLoad;               // �ù���� (W/��)
    private double sensibleLoad;              // ��������
    private double dehumidLoad;               // ��������
    private double totalEnergy;               // �ѿ����� �ҿ䷮ (kWh/����yr)
    private double co2Emissions;              // CO2 ���ⷮ (kg/����yr)
    private double primaryEnergy;             // 1�������� �ҿ䷮ (kWh/����yr)
    private double airtightness;              // ��е� n50 (1/h)
    private String energyGrade;               // ������ ȿ�����
    private String climate;                   // ��������
    private double avgTemp;                   // ��ձ�� (��)
    private double heatDegreeDay;             // ���浵�� (kKh)
    private String buildingType;              // �ǹ�����
    private int thermalStorage;            // �࿭ (Wh/��K)
    private double occupants;                 // �����ڼ� (ǥ��ġ)
    private double internalHeat;              // ���ι߿� (W/��)
    private double indoorArea;                // ��ȿ�ǳ�����
    private double ventilationVolume;         // ȯ���ü�� (��)
    private double avRatio;                   // A/V ��
    private String avFormula;                 // A/V ����
    private double roofTransmit;              // ���� �������� (W/��K)
    private double wallTransmit;              // �ܺ� �������� (W/��K)
    private double floorTransmit;             // �ٴ� �������� (W/��K)
    private double indirectTransmit;          // �ܱⰣ�� �������� (W/��K)
    private double doorTransmit;              // ���Թ� �������� (W/��K)
    private double windowTransmit;            // âȣ �������� (W/��K)
    private String glazingProd;               // ���� ��ǰ ����
    private double glazingTransmit;           // ���� �������� (W/��K)
    private double solarGain;                 // �ϻ�ȹ���� (SHGC)
    private String frameProd;                 // âƲ ��ǰ ����
    private double frameTransmit;             // âƲ �������� (W/��K)
    private double spacerTransmit;            // ���� �������� (W/��K)
    private String ventProd;                  // ȯ�� ��ġ ��ǰ ����
    private double heatEff;                   // ����ȿ�� (%)
    private double coolEff;                   // �ù�ȿ�� (%)
    private double humidityRec;               // ���� ȸ���� (%)
    private double powerCons;                 // ���� �Һ� (Wh/��)
    private double linearCoeff;               // ���� ���ް�� (W/K)
    private double pointCoeff;                // ���� ���ް�� (W/K)
    private String annualHeatCost;            // ���� ������
    private String annualEnergyCost;          // ���� �ѿ����� ���
    
    
    
	public EnergyResultDTO() {
		super();
	}



	public EnergyResultDTO(String memId, String buildingId, double heatingPerf, double heatingDemand,
			double heatingLoad, double coolingDemand, double sensibleEnergy, double dehumidEnergy, double coolingLoad,
			double sensibleLoad, double dehumidLoad, double totalEnergy, double co2Emissions, double primaryEnergy,
			double airtightness, String energyGrade, String climate, double avgTemp, double heatDegreeDay,
			String buildingType, int thermalStorage, double occupants, double internalHeat, double indoorArea,
			double ventilationVolume, double avRatio, String avFormula, double roofTransmit, double wallTransmit,
			double floorTransmit, double indirectTransmit, double doorTransmit, double windowTransmit,
			String glazingProd, double glazingTransmit, double solarGain, String frameProd, double frameTransmit,
			double spacerTransmit, String ventProd, double heatEff, double coolEff, double humidityRec,
			double powerCons, double linearCoeff, double pointCoeff, String annualHeatCost, String annualEnergyCost) {
		super();
		this.memId = memId;
		this.buildingId = buildingId;
		this.heatingPerf = heatingPerf;
		this.heatingDemand = heatingDemand;
		this.heatingLoad = heatingLoad;
		this.coolingDemand = coolingDemand;
		this.sensibleEnergy = sensibleEnergy;
		this.dehumidEnergy = dehumidEnergy;
		this.coolingLoad = coolingLoad;
		this.sensibleLoad = sensibleLoad;
		this.dehumidLoad = dehumidLoad;
		this.totalEnergy = totalEnergy;
		this.co2Emissions = co2Emissions;
		this.primaryEnergy = primaryEnergy;
		this.airtightness = airtightness;
		this.energyGrade = energyGrade;
		this.climate = climate;
		this.avgTemp = avgTemp;
		this.heatDegreeDay = heatDegreeDay;
		this.buildingType = buildingType;
		this.thermalStorage = thermalStorage;
		this.occupants = occupants;
		this.internalHeat = internalHeat;
		this.indoorArea = indoorArea;
		this.ventilationVolume = ventilationVolume;
		this.avRatio = avRatio;
		this.avFormula = avFormula;
		this.roofTransmit = roofTransmit;
		this.wallTransmit = wallTransmit;
		this.floorTransmit = floorTransmit;
		this.indirectTransmit = indirectTransmit;
		this.doorTransmit = doorTransmit;
		this.windowTransmit = windowTransmit;
		this.glazingProd = glazingProd;
		this.glazingTransmit = glazingTransmit;
		this.solarGain = solarGain;
		this.frameProd = frameProd;
		this.frameTransmit = frameTransmit;
		this.spacerTransmit = spacerTransmit;
		this.ventProd = ventProd;
		this.heatEff = heatEff;
		this.coolEff = coolEff;
		this.humidityRec = humidityRec;
		this.powerCons = powerCons;
		this.linearCoeff = linearCoeff;
		this.pointCoeff = pointCoeff;
		this.annualHeatCost = annualHeatCost;
		this.annualEnergyCost = annualEnergyCost;
	}



	@Override
	public String toString() {
		return "EnergyResultDTO [memId=" + memId + ", buildingId=" + buildingId + ", heatingPerf=" + heatingPerf
				+ ", heatingDemand=" + heatingDemand + ", heatingLoad=" + heatingLoad + ", coolingDemand="
				+ coolingDemand + ", sensibleEnergy=" + sensibleEnergy + ", dehumidEnergy=" + dehumidEnergy
				+ ", coolingLoad=" + coolingLoad + ", sensibleLoad=" + sensibleLoad + ", dehumidLoad=" + dehumidLoad
				+ ", totalEnergy=" + totalEnergy + ", co2Emissions=" + co2Emissions + ", primaryEnergy=" + primaryEnergy
				+ ", airtightness=" + airtightness + ", energyGrade=" + energyGrade + ", climate=" + climate
				+ ", avgTemp=" + avgTemp + ", heatDegreeDay=" + heatDegreeDay + ", buildingType=" + buildingType
				+ ", thermalStorage=" + thermalStorage + ", occupants=" + occupants + ", internalHeat=" + internalHeat
				+ ", indoorArea=" + indoorArea + ", ventilationVolume=" + ventilationVolume + ", avRatio=" + avRatio
				+ ", avFormula=" + avFormula + ", roofTransmit=" + roofTransmit + ", wallTransmit=" + wallTransmit
				+ ", floorTransmit=" + floorTransmit + ", indirectTransmit=" + indirectTransmit + ", doorTransmit="
				+ doorTransmit + ", windowTransmit=" + windowTransmit + ", glazingProd=" + glazingProd
				+ ", glazingTransmit=" + glazingTransmit + ", solarGain=" + solarGain + ", frameProd=" + frameProd
				+ ", frameTransmit=" + frameTransmit + ", spacerTransmit=" + spacerTransmit + ", ventProd=" + ventProd
				+ ", heatEff=" + heatEff + ", coolEff=" + coolEff + ", humidityRec=" + humidityRec + ", powerCons="
				+ powerCons + ", linearCoeff=" + linearCoeff + ", pointCoeff=" + pointCoeff + ", annualHeatCost="
				+ annualHeatCost + ", annualEnergyCost=" + annualEnergyCost + "]";
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



	public double getHeatingPerf() {
		return heatingPerf;
	}



	public void setHeatingPerf(double heatingPerf) {
		this.heatingPerf = heatingPerf;
	}



	public double getHeatingDemand() {
		return heatingDemand;
	}



	public void setHeatingDemand(double heatingDemand) {
		this.heatingDemand = heatingDemand;
	}



	public double getHeatingLoad() {
		return heatingLoad;
	}



	public void setHeatingLoad(double heatingLoad) {
		this.heatingLoad = heatingLoad;
	}



	public double getCoolingDemand() {
		return coolingDemand;
	}



	public void setCoolingDemand(double coolingDemand) {
		this.coolingDemand = coolingDemand;
	}



	public double getSensibleEnergy() {
		return sensibleEnergy;
	}



	public void setSensibleEnergy(double sensibleEnergy) {
		this.sensibleEnergy = sensibleEnergy;
	}



	public double getDehumidEnergy() {
		return dehumidEnergy;
	}



	public void setDehumidEnergy(double dehumidEnergy) {
		this.dehumidEnergy = dehumidEnergy;
	}



	public double getCoolingLoad() {
		return coolingLoad;
	}



	public void setCoolingLoad(double coolingLoad) {
		this.coolingLoad = coolingLoad;
	}



	public double getSensibleLoad() {
		return sensibleLoad;
	}



	public void setSensibleLoad(double sensibleLoad) {
		this.sensibleLoad = sensibleLoad;
	}



	public double getDehumidLoad() {
		return dehumidLoad;
	}



	public void setDehumidLoad(double dehumidLoad) {
		this.dehumidLoad = dehumidLoad;
	}



	public double getTotalEnergy() {
		return totalEnergy;
	}



	public void setTotalEnergy(double totalEnergy) {
		this.totalEnergy = totalEnergy;
	}



	public double getCo2Emissions() {
		return co2Emissions;
	}



	public void setCo2Emissions(double co2Emissions) {
		this.co2Emissions = co2Emissions;
	}



	public double getPrimaryEnergy() {
		return primaryEnergy;
	}



	public void setPrimaryEnergy(double primaryEnergy) {
		this.primaryEnergy = primaryEnergy;
	}



	public double getAirtightness() {
		return airtightness;
	}



	public void setAirtightness(double airtightness) {
		this.airtightness = airtightness;
	}



	public String getEnergyGrade() {
		return energyGrade;
	}



	public void setEnergyGrade(String energyGrade) {
		this.energyGrade = energyGrade;
	}



	public String getClimate() {
		return climate;
	}



	public void setClimate(String climate) {
		this.climate = climate;
	}



	public double getAvgTemp() {
		return avgTemp;
	}



	public void setAvgTemp(double avgTemp) {
		this.avgTemp = avgTemp;
	}



	public double getHeatDegreeDay() {
		return heatDegreeDay;
	}



	public void setHeatDegreeDay(double heatDegreeDay) {
		this.heatDegreeDay = heatDegreeDay;
	}



	public String getBuildingType() {
		return buildingType;
	}



	public void setBuildingType(String buildingType) {
		this.buildingType = buildingType;
	}



	public int getThermalStorage() {
		return thermalStorage;
	}



	public void setThermalStorage(int thermalStorage) {
		this.thermalStorage = thermalStorage;
	}



	public double getOccupants() {
		return occupants;
	}



	public void setOccupants(double occupants) {
		this.occupants = occupants;
	}



	public double getInternalHeat() {
		return internalHeat;
	}



	public void setInternalHeat(double internalHeat) {
		this.internalHeat = internalHeat;
	}



	public double getIndoorArea() {
		return indoorArea;
	}



	public void setIndoorArea(double indoorArea) {
		this.indoorArea = indoorArea;
	}



	public double getVentilationVolume() {
		return ventilationVolume;
	}



	public void setVentilationVolume(double ventilationVolume) {
		this.ventilationVolume = ventilationVolume;
	}



	public double getAvRatio() {
		return avRatio;
	}



	public void setAvRatio(double avRatio) {
		this.avRatio = avRatio;
	}



	public String getAvFormula() {
		return avFormula;
	}



	public void setAvFormula(String avFormula) {
		this.avFormula = avFormula;
	}



	public double getRoofTransmit() {
		return roofTransmit;
	}



	public void setRoofTransmit(double roofTransmit) {
		this.roofTransmit = roofTransmit;
	}



	public double getWallTransmit() {
		return wallTransmit;
	}



	public void setWallTransmit(double wallTransmit) {
		this.wallTransmit = wallTransmit;
	}



	public double getFloorTransmit() {
		return floorTransmit;
	}



	public void setFloorTransmit(double floorTransmit) {
		this.floorTransmit = floorTransmit;
	}



	public double getIndirectTransmit() {
		return indirectTransmit;
	}



	public void setIndirectTransmit(double indirectTransmit) {
		this.indirectTransmit = indirectTransmit;
	}



	public double getDoorTransmit() {
		return doorTransmit;
	}



	public void setDoorTransmit(double doorTransmit) {
		this.doorTransmit = doorTransmit;
	}



	public double getWindowTransmit() {
		return windowTransmit;
	}



	public void setWindowTransmit(double windowTransmit) {
		this.windowTransmit = windowTransmit;
	}



	public String getGlazingProd() {
		return glazingProd;
	}



	public void setGlazingProd(String glazingProd) {
		this.glazingProd = glazingProd;
	}



	public double getGlazingTransmit() {
		return glazingTransmit;
	}



	public void setGlazingTransmit(double glazingTransmit) {
		this.glazingTransmit = glazingTransmit;
	}



	public double getSolarGain() {
		return solarGain;
	}



	public void setSolarGain(double solarGain) {
		this.solarGain = solarGain;
	}



	public String getFrameProd() {
		return frameProd;
	}



	public void setFrameProd(String frameProd) {
		this.frameProd = frameProd;
	}



	public double getFrameTransmit() {
		return frameTransmit;
	}



	public void setFrameTransmit(double frameTransmit) {
		this.frameTransmit = frameTransmit;
	}



	public double getSpacerTransmit() {
		return spacerTransmit;
	}



	public void setSpacerTransmit(double spacerTransmit) {
		this.spacerTransmit = spacerTransmit;
	}



	public String getVentProd() {
		return ventProd;
	}



	public void setVentProd(String ventProd) {
		this.ventProd = ventProd;
	}



	public double getHeatEff() {
		return heatEff;
	}



	public void setHeatEff(double heatEff) {
		this.heatEff = heatEff;
	}



	public double getCoolEff() {
		return coolEff;
	}



	public void setCoolEff(double coolEff) {
		this.coolEff = coolEff;
	}



	public double getHumidityRec() {
		return humidityRec;
	}



	public void setHumidityRec(double humidityRec) {
		this.humidityRec = humidityRec;
	}



	public double getPowerCons() {
		return powerCons;
	}



	public void setPowerCons(double powerCons) {
		this.powerCons = powerCons;
	}



	public double getLinearCoeff() {
		return linearCoeff;
	}



	public void setLinearCoeff(double linearCoeff) {
		this.linearCoeff = linearCoeff;
	}



	public double getPointCoeff() {
		return pointCoeff;
	}



	public void setPointCoeff(double pointCoeff) {
		this.pointCoeff = pointCoeff;
	}



	public String getAnnualHeatCost() {
		return annualHeatCost;
	}



	public void setAnnualHeatCost(String annualHeatCost) {
		this.annualHeatCost = annualHeatCost;
	}



	public String getAnnualEnergyCost() {
		return annualEnergyCost;
	}



	public void setAnnualEnergyCost(String annualEnergyCost) {
		this.annualEnergyCost = annualEnergyCost;
	}

	

	
	
	
	
    
    
    
}
