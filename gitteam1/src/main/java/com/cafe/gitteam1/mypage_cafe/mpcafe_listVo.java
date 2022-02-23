package com.cafe.gitteam1.mypage_cafe;

public class mpcafe_listVo {
	String cafe_id;
	String photo_name;
	String search_name;
	int scname_id;
	String menu_id;
	String menu_name;
	int menu_price;
	int menu_type;

	//setter getter
	public String getSearch_name() {
		return search_name;
	}

	public void setSearch_name(String search_name) {
		this.search_name = search_name;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public int getMenu_type() {
		return menu_type;
	}

	public void setMenu_type(int menu_type) {
		this.menu_type = menu_type;
	}

	public int getScname_id() {
		return scname_id;
	}

	public void setScname_id(int scname_id) {
		this.scname_id = scname_id;
	}

	public String getCafe_id() {
		return cafe_id;
	}

	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}

}
