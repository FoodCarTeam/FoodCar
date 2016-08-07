package model;

import java.util.HashSet;
import java.util.Set;

public class HoursVO {
	private Integer hrID;
	private Integer sID;
	private String sun;
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private StoresVO storeVo;
	
	
	public StoresVO getStoreVo() {
		return storeVo;
	}
	public void setStoreVo(StoresVO storeVo) {
		this.storeVo = storeVo;
	}
	public Integer getHrID() {
		return hrID;
	}
	public void setHrID(Integer hrID) {
		this.hrID = hrID;
	}
	public Integer getsID() {
		return sID;
	}
	public void setsID(Integer sID) {
		this.sID = sID;
	}
	public String getSun() {
		return sun;
	}
	public void setSun(String sun) {
		this.sun = sun;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public String getTue() {
		return tue;
	}
	public void setTue(String tue) {
		this.tue = tue;
	}
	public String getWed() {
		return wed;
	}
	public void setWed(String wed) {
		this.wed = wed;
	}
	public String getThu() {
		return thu;
	}
	public void setThu(String thu) {
		this.thu = thu;
	}
	public String getFri() {
		return fri;
	}
	public void setFri(String fri) {
		this.fri = fri;
	}
	public String getSat() {
		return sat;
	}
	public void setSat(String sat) {
		this.sat = sat;
	}
	
}