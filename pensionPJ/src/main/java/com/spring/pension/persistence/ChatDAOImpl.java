package com.spring.pension.persistence;

import java.util.List;

import javax.inject.Inject;

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
	
	@Override
	public String getPartner(ChatRoomVO vo) throws Exception {
		
		return null;
	}
	
	@Override
	public String getProfile(String str) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getName(String str) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MessageVO> getMessageList(String str) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRoomVO> getRoomList(String str) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRoomVO> getRoomList2(String str) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MessageVO getRecentMessage(String str) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTutorId(String str) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRoomVO> getRoomListTutor(String str) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReadTime(int class_id, String user_id, String TUTOR_USER_user_id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getUnReadCount(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getAllCount(String str) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReadTimeTutor(int class_id, String user_id, String TUTOR_USER_user_id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getUnReadCountTutor(String TUTOR_USER_user_id, int class_id, String user_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
