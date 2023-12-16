package com.model.member;

import java.util.List;
import java.util.Map;

public interface MemberMapper {
	int duplicatedId(String id);
	int duplicatedEmail(String email);
	int create(MemberDTO dto);
	int loginCheck(Map<String,String> map);
	Map<String,String> getGrade(String id);
	int total(Map map);
	List<MemberDTO> list(Map map);
	MemberDTO read(String id);
	int update(MemberDTO dto);
	MemberDTO mypage(String id);
	int updateFile(Map map);
	MemberDTO findMemberByNameAndId(String name, String id);
	void updatePassword(String id, String newPassword);
	String findIdByNameAndEmail(String name, String email);
}
