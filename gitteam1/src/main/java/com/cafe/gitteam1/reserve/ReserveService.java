package com.cafe.gitteam1.reserve;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.cafe.gitteam1.search.CafeInfoVo;
import com.cafe.gitteam1.search.MenuVo;

@Service
@Transactional
public class ReserveService {
	
	@Autowired
	ReserveMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager; 
	
	TransactionStatus status;
	
// ------------------------------------- 주문 페이지 로딩시 필요 데이터 -----------------------------------------------------------


	
	// 카페 이름 표시 
	public CafeInfoVo viewCafe(String cid) {
		CafeInfoVo vo = mapper.viewCafe(cid);
		
		return vo;
	}	
	// 메뉴 표시 
	public List<MenuVo> orderMenu(String cid) {
		List<MenuVo> list = mapper.orderMenu(cid);
		return list;
	}
	// 쿠폰 가져오기 
	public int loadCupon(String mid) {
		int cupon = 0;
		cupon = mapper.loadCupon(mid);
		return cupon;
		
	}	
	// 쿠폰 가져오기 
	public List<CuponVo> cuponList(String mid) {
		List<CuponVo> cuponList = mapper.cuponList(mid);
		return cuponList;
		
	}
	
// ------------------------------------- 결제 요청 후 동작들 -----------------------------------------------------------

	// 결재 완료시 예약내용 표시 
	public boolean reserveResult(ReserveVo vo) {
		boolean b=false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
		boolean c = mapper.reserveResult(vo);

		if(c) {
			manager.commit(status);
			b=true;
		}else {
			manager.rollback(status);
		}
		
		return b;

	}

	// stamp 추가 
	public boolean stamp(ReserveVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean a = false;
		mapper.stamp(vo);
		
		return a;
	}
	// stamp 확인
	public int stampCheck(String mid) {
		int stampCnt = 0;
		stampCnt = mapper.stampCheck(mid);
		
		return stampCnt;
	}
	// 쿠폰 제공 
	public boolean cuponInsert(String mid) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean a = false;

		mapper.cuponInsert(mid);
		
		return a;
	}
	// 쿠폰 제공 후 스탬프 회수 
	public boolean stampReset(String mid) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean a = false;

		mapper.stampReset(mid);
		
		return a;
	}
	
	// 쿠폰 사용
	public void cuponUse(int cuponSN) {
		status = manager.getTransaction(new DefaultTransactionDefinition());

		mapper.cuponUse(cuponSN);
	}
	
	
	public List<ReserveTimeVo> viewTimeTable(ReserveVo vo){
		List<ReserveTimeVo> list = new ArrayList<ReserveTimeVo>();
		
		ReserveTimeVo rtv = mapper.workTime(vo);
		ReserveTimeVo offVo = mapper.offChk(vo);
		int start = 0;
		int end = 0;
		// 일시정지 일때
		if(offVo != null) {
			start = (offVo.getOffstart()==null)?0:Integer.parseInt(offVo.getOffstart().substring(0,2));
			end = (offVo.getOffend()==null)?0:Integer.parseInt(offVo.getOffend().substring(0,2));
		}
		
		
		rtv.setCid(vo.getCafe_id());
		rtv.setOffdate(vo.getReserve_date());
		String temp  =  rtv.getStime().substring(0,2);
		int startTime = Integer.parseInt(temp);
		int workTime = rtv.getWtime();
		for(int i = startTime; i<=startTime+workTime; i++) {
			ReserveTimeVo timeVo = new ReserveTimeVo();
			
			String time = (i>=10) ? i+"" : "0"+i;
			
			
			if(offVo != null) {
				// 선택한 시간이 휴무/일시정지 일때
				timeVo.setStime(time + ":00");
				if(offVo.getOfftype().equals("일시정지")) {
					
					if(start <= i && end > i) {
						// 일시 정지 시간일때
						timeVo.setOfftype(offVo.getOfftype());
						timeVo.setCond("disabled");
					}else {
						timeVo.setOfftype("예약 가능");
					}
				} else {
					// 휴무일 일때
					timeVo.setOfftype(offVo.getOfftype());
					timeVo.setCond("disabled");
				}
				
				
			} else {
				// 휴무가 아닐때
				timeVo = new ReserveTimeVo();
				timeVo.setStime(time + ":00");
				if(mapper.viewTimeTable(vo) !=null && mapper.viewTimeTable(vo).equals("disabled")) {
					timeVo.setOfftype("자리 없음");
					timeVo.setCond("disabled");
				}else {
					timeVo.setOfftype("예약 가능");
				}
				//System.out.println(mapper.viewTimeTable(vo));
				
			}
			list.add(timeVo);
		}
		return list;
	}
	
	
	public ReserveTimeVo viewAvailSeats(ReserveVo vo) {
		ReserveTimeVo ci = mapper.viewAvailSeats(vo);
		return ci;
	}
	
	
}
