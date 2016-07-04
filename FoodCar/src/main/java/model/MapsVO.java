package model;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class MapsVO implements java.io.Serializable {

	private Integer mapID ;
	private Integer sID ;
	private String location;
	private StoresVO stroeVO;
	
	
	
//	private Set<StoresVO> stores=new HashSet<StoresVO>();
	
	
	
public StoresVO getStroeVO() {
		return stroeVO;
	}
	public void setStroeVO(StoresVO stroeVO) {
		this.stroeVO = stroeVO;
	}
	//	public Set<StoresVO> getStores() {
//		return stores;
//	}
//	public void setStores(Set<StoresVO> stores) {
//		this.stores = stores;
//	}
	public Integer getMapID() {
		return mapID;
	}
	public void setMapID(Integer mapID) {
		this.mapID = mapID;
	}
	public Integer getsID() {
		return sID;
	}
	public void setsID(Integer sID) {
		this.sID = sID;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
}
