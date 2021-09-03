package com.green.board;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BoardDAO {
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() { return instance; }
	
	private static int idNum;				// 게시글 고유 번호
	private ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
	
	// (1) 새 게시글을 저장해주는 메서드
	public void boardWrite(BoardDTO board) {
		
		/* 아래 5개의 항목은 입력받을 수 없는 데이터로서
		 * 직접 값을 저장해줘야 한다.
		 * 
		 * ① 게시글 번호	: 마지막 게시글 번호에 1을 증가시킨다
		 * ② 작성일		: Date클래스를 활용해 작성일자를 저장한다
		 * ③ ref		: 새글의 ref는 현재 최대 ref값에 1을 증가시킨다
		 * ④ reStep		: 새글의 reStep의 값은 1이다
		 * ⑤ reLevel	: 새글의 reLevel의 값은 1이다
		 */
		
		int num = BoardDAO.idNum + 1;
		String regDate = getDate();
		int ref = getMaxOfRef() + 1;
		int reStep = 1;
		int reLevel = 1;
		
		board.setNum(num);
		board.setRegDate(regDate);
		board.setRef(ref);
		board.setReStep(reStep);
		board.setReLevel(reLevel);
		
		BoardDAO.idNum++;
		boardList.add(board);
		
		printBoardList();
	}
	
	// (2) 전체 게시글 수를 리턴해주는 메서드
	public int getAllCount() {
		return boardList.size();
	}
	
	// (3) 오늘 날짜를 문자열로 리턴해주는 메서드
	public String getDate() {
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	// (4) 최대 ref 값을 리턴해주는 메서드
	public int getMaxOfRef() {
		int maxRef = 0;
		
		if(boardList.size() != 0) {
			int lastIndex = boardList.size() -1;
			maxRef = boardList.get(lastIndex).getRef();
		}
		return maxRef;
	}
	
	// (5) 전체 게시글 내용을 출력해주는 메서드 <-- 콘솔 검토용
	public void printBoardList() {
		for(BoardDTO board : boardList) {
			System.out.println(board.toString());
		}
		System.out.println("\n\n\n");
	}
	
	// (6) boardList를 리턴해주는 메서드
	public ArrayList<BoardDTO> getBoardList(){
		return boardList;
	}
	
	// (7) 게시글 번호를 넘겨받으면 해당 게시글의 인덱스를 리턴해주는 메서드
	public int getBoardIndex(int num) {
		int index = 0;
		for(int i=0; i<boardList.size(); i++) {
			if(boardList.get(i).getNum() == num) {
				index = i;
			}
		}
		return index;
	}
	
	// (7) 게시글 번호를 넘겨받아 해당 게시글 정보를 리턴해주는 메서드(게시글 내용 확인하기)
	public BoardDTO getBoardOfInfo(int num) {
		int index = getBoardIndex(num);
		
		BoardDTO board = boardList.get(index);
		//게시글을 선택했기 때문에 조회수를 1 증가 시킨다
		board.setReadCount(board.getReadCount()+1);
		return board;
	}
	
	// (8) 게시글 번호를 넘겨받아 해당 게시글 정보를 리턴해주는 메서드(게시글 내용 수정하기)
	public BoardDTO getBoardOfUpdate(int num) {
		int index = getBoardIndex(num);
		
		return boardList.get(index);
	}
	
	// (9) 게시글의 내용을(이메일, 제목, 내용) 수정해주는 메서드
	public void boardUpdate(BoardDTO board) {
		int index = getBoardIndex(board.getNum());
		
		boardList.get(index).setEmail(board.getContent());
		boardList.get(index).setSubject(board.getSubject());
		boardList.get(index).setContent(board.getContent());
	}
	
	// (10) 게시글 삭제해주는 메서드 : 비밀번호가 일치하면 1, 불일치하면 -1을 리턴
	public int boardDelete(int num, String password) {
		int result = -1;
		
		int index = getBoardIndex(num);
		String dbPassword = boardList.get(index).getPassword();
		
		if(dbPassword.equals(password)) {
			result = 1;
			
			boardList.remove(index);
		}
		return result;
	}
}







