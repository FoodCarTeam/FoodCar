package model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;

public class StoresVO implements java.io.Serializable {

	private Integer sID ;
	private String sUsername ;
	private String sPassword ;
	private String sName ;
	private String sBossName ;
	private String sHours ;
	private Byte[] sLogo ;
	private Set<MapsVO> mapVO=new HashSet<MapsVO>(); 
	
	
	
	
//	private MapsVO mapsVO;
	

public Set<MapsVO> getMapVO() {
		return mapVO;
	}
	public void setMapVO(Set<MapsVO> mapVO) {
		this.mapVO = mapVO;
	}
	//	public MapsVO getMapsVO() {
//		return mapsVO;
//	}
//	public void setMapsVO(MapsVO mapsVO) {
//		this.mapsVO = mapsVO;
//	}
	public Integer getsID() {
		return sID;
	}
	public void setsID(Integer sID) {
		this.sID = sID;
	}
	public String getsUsername() {
		return sUsername;
	}
	public void setsUsername(String sUsername) {
		this.sUsername = sUsername;
	}
	public String getsPassword() {
		return sPassword;
	}
	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsBossName() {
		return sBossName;
	}
	public void setsBossName(String sBossName) {
		this.sBossName = sBossName;
	}
	public String getsHours() {
		return sHours;
	}
	public void setsHours(String sHours) {
		this.sHours = sHours;
	}
	public Byte[] getsLogo() {
		return sLogo;
	}
	public void setsLogo(Byte[] sLogo) {
		this.sLogo = sLogo;
	}
	
}
