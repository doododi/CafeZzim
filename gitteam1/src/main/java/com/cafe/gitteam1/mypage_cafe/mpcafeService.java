package com.cafe.gitteam1.mypage_cafe;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.cafe.gitteam1.mypage_cafe.mpcafeVo;
import com.cafe.gitteam1.mypage_cafe.dayoffVo;
import com.cafe.gitteam1.mypage_cafe.mpcafe_listVo;


@Service
@Transactional
public class mpcafeService {
	public static String uploadPath="/home/hosting_users/gitteam1/tomcat/webapps/upload/";
	
	@Autowired
	mpcafeMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;
	String findStr;
	String cafe_id;
	mpcafeVo vo;	
	
	public List<mpcafeVo> search(String findStr){
		List<mpcafeVo> list = null;
		list = mapper.search(findStr);		
		return list;		
	}
	
	public mpcafeVo dayoffSelect(String cafe_id){
		mpcafeVo vo = null;
		vo = mapper.view(cafe_id);
		List<dayoffVo> offlist = null;
		offlist = mapper.dayoffSelect(cafe_id);
		vo.setOfflist(offlist);		
		return vo;
	}
	
	public mpcafeVo view(String cafe_id) { //cafe_id를 사용해서 호출
		status = manager.getTransaction(new DefaultTransactionDefinition());
		mpcafeVo vo = null;
		List<mpcafe_listVo> otherphotos = null;
		List<mpcafe_listVo> cafesearch = null;
		List<mpcafe_listVo> menu = null;
			
		try {
			vo = mapper.view(cafe_id);
			otherphotos = mapper.otherphotos(cafe_id);
			cafesearch = mapper.cafesearch(cafe_id);
			menu = mapper.menu(cafe_id);
			vo.setOtherphotos(otherphotos);
			vo.setCafesearch(cafesearch);
			vo.setMenu(menu);
			

		}catch(Exception ex) {
			ex.printStackTrace();
			
		}return vo;
	}
	
	public boolean modify(mpcafeVo vo) {
		status = manager.getTransaction(new DefaultTransactionDefinition());
		boolean b = false;
		Object savePoint = null;
		
	try {
		savePoint = status.createSavepoint();
		int c = mapper.modify(vo); //기본카페정보만 수정
		b=true;

		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}
	
	public boolean scnmodify(mpcafeVo vo) {
		boolean c = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		//기존 search_name 삭제
		int d = mapper.deleteScn(vo.getCafe_id());
		System.out.println(d);		
		if(d>0) { //기존 search_name가 삭제되면
			int e = 0;
			try {
				//새로운 검색어 저장
				for(mpcafe_listVo lvo: vo.getCafesearch()){ //반복해서 검색어 insert실행			
						e += mapper.scnInsert(lvo);	
						System.out.println(lvo.getCafe_id() + lvo.getSearch_name());
				}
				if(e == vo.getCafesearch().size()) {
					manager.commit(status);
					c=true;
				}else {
					manager.rollback(status);
				}
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}return c;
		
	}
	
	
	public boolean insertOff(dayoffVo dvo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
			int c = mapper.insertOff(dvo);
			if(c>0) {
				manager.commit(status);
				b = true;
			}else {
				manager.rollback(status);
			}

		return b;
		
	}
	
	public boolean insertOffday(dayoffVo dvo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
			int c = mapper.insertOffday(dvo);
			if(c>0) {
				manager.commit(status);
				b = true;
			}else {
				manager.rollback(status);
			}

		return b;
		
	}
	
	public boolean insertMenu(mpcafe_listVo lvo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
			int c = mapper.insertMenu(lvo);
			if(c>0) {
				manager.commit(status);
				b = true;
			}else {
				manager.rollback(status);
			}

		return b;
		
	}
	
	public boolean deleteOff(String off_id) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
		int c = mapper.deleteOff(off_id);
		if(c>0) {
			manager.commit(status);
			b = true;
		}else {
			manager.rollback(status);
		
		}
		return b;
		
	}
	
	public boolean deleteMenu(String menu_id) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
		int c = mapper.deleteMenu(menu_id);
		if(c>0) {
			manager.commit(status);
			b = true;
		}else {
			manager.rollback(status);
		
		}
		return b;
		
	}
	
	public boolean insertAtt(mpcafeVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
		int c = 0;
		try {
			for(mpcafe_listVo lvo: vo.getOtherphotos()) {
				c += mapper.attInsert(lvo);
			}
			if(c == vo.getOtherphotos().size()) {
				manager.commit(status);
				b = true;
			}else {
				manager.rollback(status);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;	
		
	}

	public boolean deleteOtherphoto(String photo_name) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
		int c = mapper.deleteOtherphoto(photo_name);
		if(c>0) {
			manager.commit(status);
			b = true;
			File delFile = new File(uploadPath + photo_name); 
			if(delFile.exists()) delFile.delete();
		}else {
			manager.rollback(status);
		
		}
		return b;
		
	}
	//타이틀사진삭제
	public boolean deleteTitle(String pre_title) {
		boolean b = false;
			File delFile = new File(uploadPath + pre_title); 
			if(delFile.exists()) delFile.delete();
			b=true;
		return b;		
	}
	
	//타이틀사진 추가
	public boolean modifyTitle(mpcafeVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		
		int c = mapper.modifyTitle(vo);
		if(c>0) {
			manager.commit(status);
			b = true;
		}else {
			manager.rollback(status);
		}
		return b;			
	}

}
