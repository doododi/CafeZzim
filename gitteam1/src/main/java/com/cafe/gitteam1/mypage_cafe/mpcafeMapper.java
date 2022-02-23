package com.cafe.gitteam1.mypage_cafe;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cafe.gitteam1.mypage_cafe.mpcafeVo;

@Repository
@Mapper
public interface mpcafeMapper {
	public List<mpcafeVo> search(String findStr);
	public List<dayoffVo> dayoffSelect(String cafe_id);
	public int modify(mpcafeVo vo);
	public int scnInsert(mpcafe_listVo lvo);
	public mpcafeVo view(String cafe_id);
	public List<mpcafe_listVo> otherphotos(String cafe_id);
	public List<mpcafe_listVo> cafesearch(String cafe_id);
	public List<mpcafe_listVo> menu(String cafe_id);
	public int insertOff(dayoffVo vo);
	public int insertOffday(dayoffVo vo);
	public int insertMenu(mpcafe_listVo lvo);
	public int deleteOff(String cafe_id);
	public int deleteMenu(String menu_id);
	public int deleteScn(String cafe_id);
	public int attInsert(mpcafe_listVo lvo);
	public int deleteOtherphoto(String photo_name);
	public int modifyTitle(mpcafeVo vo);

}
