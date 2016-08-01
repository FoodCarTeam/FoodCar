package model;

import java.util.HashSet;
import java.util.Set;


public class StoresVO implements java.io.Serializable {

	private Integer sID;
	private String sUsername;
	private String sPassword;
	private String sName;
	private String sBossName;
	private String sLogo;
	private String sIntro;

	private Set<HoursVO> hoursVO = new HashSet<HoursVO>();
	private Set<MapsVO> mapVO = new HashSet<MapsVO>();
	private Set<MenusVO> menusVO = new HashSet<MenusVO>();
	private Set<OrdersVO> ordersVO = new HashSet<OrdersVO>();
	private Set<OrderDetailsVO> orderDetailsVO = new HashSet<OrderDetailsVO>();
	private StoreOpenTime storeTimeVO=new StoreOpenTime();
	
	

	public StoreOpenTime getStoreTimeVO() {
		return storeTimeVO;
	}

	public void setStoreTimeVO(StoreOpenTime storeTimeVO) {
		this.storeTimeVO = storeTimeVO;
	}

	public Set<HoursVO> getHoursVO() {
		return hoursVO;
	}

	public void setHoursVO(Set<HoursVO> hoursVO) {
		this.hoursVO = hoursVO;
	}

	public String getsIntro() {
		return sIntro;
	}

	public void setsIntro(String sIntro) {
		this.sIntro = sIntro;
	}

	public Set<MenusVO> getMenusVO() {
		return menusVO;
	}

	public void setMenusVO(Set<MenusVO> menusVO) {
		this.menusVO = menusVO;
	}

	public Set<MapsVO> getMapVO() {
		return mapVO;
	}

	public void setMapVO(Set<MapsVO> mapVO) {
		this.mapVO = mapVO;
	}
    
	public Set<OrdersVO> getOrdersVO() {
		return ordersVO;
	}

	public void setOrdersVO(Set<OrdersVO> ordersVO) {
		this.ordersVO = ordersVO;
	}

	public Set<OrderDetailsVO> getOrderDetailsVO() {
		return orderDetailsVO;
	}

	public void setOrderDetailsVO(Set<OrderDetailsVO> orderDetailsVO) {
		this.orderDetailsVO = orderDetailsVO;
	}

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

	public String getsLogo() {
		return sLogo;
	}

	public void setsLogo(String sLogo) {

		this.sLogo = sLogo;
	}

}
