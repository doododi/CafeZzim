package com.cafe.gitteam1.search;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cafe.gitteam1.reserve.ReserveVo;

@Mapper
@Repository
public interface SearchMapper {
	public List<CafeInfoVo> cafeSearch(SearchVo search);
	public String chkWork(ReserveVo vo);
	public List<String> cafeFindName(String findStr);
	public Set<String> cafeFindLocation(String findStr);
	public CafeInfoVo viewCafe(String cid);
	public List<String> viewOtherPhoto(String cid);
	public List<ReviewVo> viewReview(String cid);
	public List<MenuVo> viewMenu(String cid);
	public ReservInfoVo viewReserv(String rid);
	public List<MenuVo> viewReservMenu(String rid);
	public int insertReview(ReviewVo vo);
	public int zzimIns(ZzimVo vo);
	public int zzimDel(ZzimVo vo);
	public String zzimCafe(ZzimVo vo);
	public String myZzim(ZzimVo vo);
}
