package com.cafe.gitteam1.signUp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.cafe.gitteam1.member.MemberVo;

@Service
@Transactional
public class SignUpService {
	@Autowired
	SignUpMapper mapper;
	
	@Autowired
	PlatformTransactionManager manager;
	
	//암호화
	@Autowired
	AES aes;
	
	TransactionStatus status;
	
	public boolean join(MemberVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		try {
			vo.setPassword(aes.encrypt(vo.getPassword()));
			int c = mapper.join(vo);
			if(c>0) {
				manager.commit(status);
				b = true;
			}else {
				manager.rollback(status);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	public int idCheck(String checkId) {
		int c = mapper.idCheck(checkId);
		return c;
	}
	public int emailCheck(String checkEmail) {
		int c = mapper.emailCheck(checkEmail);
		return c;
	}	
	public List<MemberVo> searchMember(String findStr){
		List<MemberVo> list = null;
		list = mapper.searchMember(findStr);
		return list;
	}
	public MemberVo searchMemberView(String mid){
		MemberVo vo = mapper.searchMemberView(mid);
		vo.setPassword(aes.decrypt(vo.getPassword()));
		return vo;
	}
	public boolean memberModify(MemberVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		try {
			vo.setPassword(aes.encrypt(vo.getPassword()));
			int c = mapper.memberModify(vo);
			if(c>0) {
				manager.commit(status);
				b = true;
			}else {
				manager.rollback(status);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public boolean memberCancel(MemberVo vo) {
		boolean b = false;
		status = manager.getTransaction(new DefaultTransactionDefinition());
		try {
			vo.setPassword(aes.encrypt(vo.getPassword()));
			int c = mapper.memberCancel(vo);
			if(c>0) {
				manager.commit(status);
				b = true;
			}else {
				manager.rollback(status);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
}
