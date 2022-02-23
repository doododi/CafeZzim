package com.cafe.gitteam1.sale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import com.cafe.gitteam1.reserve.ReserveVo;

@Service
@Transactional
public class SaleService {
	@Autowired
	SaleMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	TransactionStatus status;
	
	List<ReserveVo> list = null;
	public List<ReserveVo> selectYear(SaleVo vo){
		list = mapper.selectYear(vo);
		return list;
	}
	public List<ReserveVo> chart(){
		list = mapper.chart();
		return list;
	}
}
