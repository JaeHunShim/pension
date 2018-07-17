package com.spring.pension.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.pension.domain.ChatRoomVO;
import com.spring.pension.domain.MessageVO;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.spring.mapper.ChatMapper";
	//방개설 
	@Override
	public void createRoom(ChatRoomVO vo) throws Exception {
		
		sqlSession.insert(namespace+".createRoom", vo);
	}
	//방에 대한 정보 
	@Override
	public ChatRoomVO isRoom(ChatRoomVO vo) throws Exception {
		
		ChatRoomVO roomvo = null;
		roomvo = sqlSession.selectOne(namespace+".isRoom", vo);
		return roomvo;
	}
	//대화한 내용을 db에 저장하는 부분 
	@Override
	public void insertMessage(MessageVO vo) throws Exception {
		
		sqlSession.insert(namespace+".insertMessage", vo);
	}
	//대화하고 있는 유저 id가지고 오는 부분
	@Override
	public String getPartner(ChatRoomVO vo) throws Exception {
		
		List<MessageVO> mvo = sqlSession.selectList(namespace+".getPartner", vo);
		
		return mvo.get(0).getUSER_user_id();
	}
	//유저 이미지 가지고오는 부분(경로가 들어가있는 부분 ) 
	@Override
	public String getProfile(String str) throws Exception {
		
		return sqlSession.selectOne(namespace+".getProfile", str);
	}
	//유저 이름 뽑아오는 부분
	@Override
	public String getName(String str) throws Exception {
		
		return sqlSession.selectOne(namespace+".getName",str);
	}
	//메세지에 대한 정보 가지고오는 부분 
	@Override
	public List<MessageVO> getMessageList(String str) throws Exception {
		
		return sqlSession.selectList(namespace+".getMessageList", str);
	}
	//해당 사용자가 있는 방에 대한 정보
	@Override
	public List<ChatRoomVO> getRoomList(String str) throws Exception {
		
		return sqlSession.selectList(namespace+".getRoomList", str);
	}
	//교수가 대화하는 채팅방에 대한 정보 가지고오는 부분 
	@Override
	public List<ChatRoomVO> getRoomList2(String str) throws Exception {
		
		return sqlSession.selectList(namespace+".getRoomList2", str);
	}
	//최근 정보 가지고 오기
	@Override
	public MessageVO getRecentMessage(String str) throws Exception {
		
		return sqlSession.selectOne(namespace+".getRecentMessage", str);
	}
	//교수 아이디 가지고 오는 부분
	@Override
	public String getTutorId(String str) throws Exception {
		
		return sqlSession.selectOne(namespace+".getTutorId", str);
	}
	//채팅하는 시간에 대한 업데이트 하는 부분
	@Override
	public List<ChatRoomVO> getRoomListTutor(String str) throws Exception {
		
		return sqlSession.selectList(namespace+".getRoomListTutor", str);
	}
	//답변하는 교수 실시간으로 시간 업데이트
	@Override
	public void updateReadTime(int class_id, String user_id, String TUTOR_USER_user_id) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object> ();
		
		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		sqlSession.update(namespace+".updateReadTime" , map);
	}
	//조건에 맞는 총 글의 갯수 가지고오기
	@Override
	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object> ();
		
		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		
		
		return sqlSession.selectOne(namespace+".getUnReadCount" , map);
	}
	//모든 대화의 총 갯수 가지고 오기 
	@Override
	public int getAllCount(String str) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object> ();
		map.put("USER_user_id", str);
		map.put("TUTOR_USER_user_id", str);
		if(sqlSession.selectOne(namespace+".getAllCount" ,map) ==null) {
			return 0;
		}else {
			
			return sqlSession.selectOne(namespace+".getAllCount" ,map);
		}
	}
	//답변자(교수)의 시간 업데이트 하는 부분
	@Override
	public void updateReadTimeTutor(int class_id, String user_id, String TUTOR_USER_user_id) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object> ();
		
		map.put("TUTOR_USER_user_id", TUTOR_USER_user_id);
		map.put("USER_user_id", user_id);
		map.put("CLASS_class_id", class_id);
		sqlSession.update(namespace+".updateReadTimeTutor" , map);
		
	}
	//대화한 목록에 대한 총 대화갯수 가지고 오기 
	@Override
	public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
