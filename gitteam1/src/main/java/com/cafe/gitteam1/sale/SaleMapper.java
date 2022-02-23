package com.cafe.gitteam1.sale;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cafe.gitteam1.reserve.ReserveVo;

@Repository
@Mapper
public interface SaleMapper {
	public List<ReserveVo> selectYear(SaleVo vo);
	public List<ReserveVo> chart();
}
