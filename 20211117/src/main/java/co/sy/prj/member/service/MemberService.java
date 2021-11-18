package co.sy.prj.member.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO vo); // login + 1명의 member데이터 찾는 두 가지 역할
	int memberInsert(MemberVO vo);
	int memberDelete(MemberVO vo);
	int memberUpdate(MemberVO vo);
	boolean memberIdCheck(MemberVO vo); // id중복체크
	int memberAuthorUpdate(MemberVO vo);// Member 권한 변경
}
