package com.proj.main.result.dto;

public class EnergyResultDTO {
	
    private String memId;                     // 사용자 ID
    private String buildingId;                // 건물명 + 계산날짜
    private double heatingPerf;               // 난방성능
    private double heatingDemand;             // 난방 요구량 (kWh/㎡·yr)
    private double heatingLoad;               // 난방부하 (W/㎡)
    private double coolingDemand;             // 냉방에너지 요구량 (kWh/㎡·yr)
    private double sensibleEnergy;            // 현열에너지
    private double dehumidEnergy;             // 제습에너지
    private double coolingLoad;               // 냉방부하 (W/㎡)
    private double sensibleLoad;              // 현열부하
    private double dehumidLoad;               // 제습부하
    private double totalEnergy;               // 총에너지 소요량 (kWh/㎡·yr)
    private double co2Emissions;              // CO2 배출량 (kg/㎡·yr)
    private double primaryEnergy;             // 1차에너지 소요량 (kWh/㎡·yr)
    private double airtightness;              // 기밀도 n50 (1/h)
    private String energyGrade;               // 에너지 효율등급
    private String climate;                   // 기후조건
    private double avgTemp;                   // 평균기온 (℃)
    private double heatDegreeDay;             // 난방도시 (kKh)
    private String buildingType;              // 건물유형
    private int thermalStorage;            // 축열 (Wh/㎡K)
    private double occupants;                 // 거주자수 (표준치)
    private double internalHeat;              // 내부발열 (W/㎡)
    private double indoorArea;                // 유효실내면적
    private double ventilationVolume;         // 환기용체적 (㎥)
    private double avRatio;                   // A/V 비
    private String avFormula;                 // A/V 계산식
    private double roofTransmit;              // 지붕 열관류율 (W/㎡K)
    private double wallTransmit;              // 외벽 열관류율 (W/㎡K)
    private double floorTransmit;             // 바닥 열관류율 (W/㎡K)
    private double indirectTransmit;          // 외기간접 열관류율 (W/㎡K)
    private double doorTransmit;              // 출입문 열관류율 (W/㎡K)
    private double windowTransmit;            // 창호 열관류율 (W/㎡K)
    private String glazingProd;               // 유리 제품 정보
    private double glazingTransmit;           // 유리 열관류율 (W/㎡K)
    private double solarGain;                 // 일사획득계수 (SHGC)
    private String frameProd;                 // 창틀 제품 정보
    private double frameTransmit;             // 창틀 열관류율 (W/㎡K)
    private double spacerTransmit;            // 간봉 열관류율 (W/㎡K)
    private String ventProd;                  // 환기 장치 제품 정보
    private double heatEff;                   // 난방효율 (%)
    private double coolEff;                   // 냉방효율 (%)
    private double humidityRec;               // 습도 회수율 (%)
    private double powerCons;                 // 전력 소비량 (Wh/㎥)
    private double linearCoeff;               // 선형 전달계수 (W/K)
    private double pointCoeff;                // 점형 전달계수 (W/K)
    private String annualHeatCost;            // 연간 난방비용
    private String annualEnergyCost;          // 연간 총에너지 비용
    
    
    
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
